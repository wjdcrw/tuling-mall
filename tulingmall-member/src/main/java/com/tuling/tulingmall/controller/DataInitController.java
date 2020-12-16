package com.tuling.tulingmall.controller;

import com.tuling.tulingmall.common.api.TokenInfo;
import com.tuling.tulingmall.service.UmsMemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.sql.DataSource;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by smlz on 2020/4/19.
 */
@Slf4j
@RestController
@RequestMapping("/sso")
public class DataInitController {

    private static String INSERT_USER = "insert into ums_member(member_level_id,username,password,nickname,phone,status)values" +
            "(?,?,?,?,?,?)";

    @Autowired
    private UmsMemberService umsMemberServiceImpl;

    @Autowired
    private DataSource dataSource;

    @RequestMapping("/batchInsertUser")
    public void batchInsertUser() throws SQLException {
        log.info("start on init user data");
        //获取数据库连接
        Connection connection = dataSource.getConnection();

        PreparedStatement pstm = connection.prepareStatement(INSERT_USER);

        try {
            for(int index=1;index<=1000; index++) {
                pstm.setInt(1,4);
                pstm.setString(2,"yangguo".concat(index+""));
                pstm.setString(3,"$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm");
                pstm.setString(4,"yangguo".concat(index+""));
                pstm.setString(5,"17373960"+index);
                pstm.setInt(6,1);

                pstm.addBatch();
                if(index%200==0) {
                    pstm.executeBatch();
                    pstm.clearBatch();
                }
            }
        }catch (Exception e) {
            System.out.println(e.getCause());
        }finally {
            connection.close();
            pstm.close();
        }
        log.info("finished init user data");
    }

    @RequestMapping("/batchLoginIn")
    public void batchLoginIn() throws SQLException, InterruptedException {
        log.info("start on generate user login token data");
        StringBuilder jwtTokens = new StringBuilder();

        //获取数据库连接
        Connection connection = dataSource.getConnection();

        PreparedStatement pstm = connection.prepareStatement(INSERT_USER);

        String selectUserInfo = "select username,password from ums_member where username like 'yangguo%'";

        ResultSet rs = pstm.executeQuery(selectUserInfo);
        while (rs.next()) {
            String userName = rs.getString("username");
            //Thread.sleep(0);
            TokenInfo tokenInfo = umsMemberServiceImpl.login(userName,"123456");
            jwtTokens.append("bearer ").append(tokenInfo.getAccess_token()+"\n");
        }
        writeToken2File(jwtTokens);
        log.info("the end generate user login token data");
    }

    private void writeToken2File(StringBuilder jwtTokens)  {
        PrintWriter pw=null;
        try {

            File jwtFiles = new File("D:\\"+"jwtTokens.txt");
            if(!jwtFiles.exists()) {
                jwtFiles.createNewFile();
            }
            pw = new PrintWriter(jwtFiles);
            pw.print(jwtTokens);
        }catch (Exception e) {
            System.out.println(e.getCause());
        }finally {
            if(pw!=null) {
                pw.close();
            }
        }
    }

}
