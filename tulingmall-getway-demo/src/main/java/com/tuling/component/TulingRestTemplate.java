package com.tuling.component;

import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.http.HttpMethod;
import org.springframework.http.client.ClientHttpRequest;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.lang.Nullable;
import org.springframework.util.Assert;
import org.springframework.web.client.*;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Random;

/**
 * 根据RestTemplate特性自己改造
 *
 * @author duanc
 * @version 1.0
 * @date 2021/1/18 22:02
 */
@Slf4j
public class TulingRestTemplate extends RestTemplate {

    private DiscoveryClient discoveryClient;

    public TulingRestTemplate(DiscoveryClient discoveryClient) {
        this.discoveryClient = discoveryClient;
    }

    protected <T> T doExecute(URI url, @Nullable HttpMethod method, @Nullable RequestCallback requestCallback, @Nullable ResponseExtractor<T> responseExtractor) throws RestClientException {
        Assert.notNull(url, "URI is required");
        Assert.notNull(method, "HttpMethod is required");
        ClientHttpResponse response = null;

        try {
            log.info("请求的url路径是:{}",url);
            url=replaceUrl(url);
            log.info("替换后的url路径是:{}",url);
            ClientHttpRequest request = this.createRequest(url, method);
            if (requestCallback != null) {
                requestCallback.doWithRequest(request);
            }
            response = request.execute();
            this.handleResponse(url, method, response);
            return responseExtractor != null ? responseExtractor.extractData(response) : null;
        } catch (IOException var12) {
            String resource = url.toString();
            String query = url.getRawQuery();
            resource = query != null ? resource.substring(0, resource.indexOf(63)) : resource;
            throw new ResourceAccessException("I/O error on " + method.name() + " request for \"" + resource + "\": " + var12.getMessage(), var12);
        } finally {
            if (response != null) {
                response.close();
            }

        }
    }
    /**
     * 把服务实例名称替换为ip:端口
     * 如：http://product-center/selectProductInfoById/1===>>http://192.168.0.8/selectProductInfoById/1
     */
    private URI replaceUrl(URI url){
        //1、获取服务名称
        String serviceName = url.getHost();
        log.info("调用微服务的名称:{}",serviceName);

        //2、解析请求的path
        String reqPath=url.getPath();
        log.info("请求的path:{}",reqPath);

        //通过seviceName去注册中心获取对应的IP
        List<ServiceInstance> serviceInstanceList = discoveryClient.getInstances(serviceName);
        if (serviceInstanceList.isEmpty()){
            throw new RuntimeException("没有对应的微服务列表"+serviceName);
        }
        String chooseTargetIp=chooseTargerIp(serviceInstanceList);

        String sourcePath=chooseTargetIp+reqPath;

        try {
            return new URI(sourcePath);
        } catch (URISyntaxException e) {
            log.info("根据source:{}构建URI异常",sourcePath);
        }
        return url;
    }

    /**
     * 从服务列表中随机选一个IP
     * @param serviceInstanceList
     * @return
     */
    private String chooseTargerIp(List<ServiceInstance> serviceInstanceList){
        //采取随机的获取一个
        Random random = new Random();
        Integer randomIndex = random.nextInt(serviceInstanceList.size());
        String serviceIp = serviceInstanceList.get(randomIndex).getUri().toString();
        log.info("随机选举的服务IP:{}",serviceIp);
        return serviceIp;
    }
}
