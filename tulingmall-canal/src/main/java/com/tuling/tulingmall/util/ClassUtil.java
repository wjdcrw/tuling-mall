package com.tuling.tulingmall.util;

import com.google.common.base.CaseFormat;
import com.google.common.collect.Sets;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author ：杨过
 * @date ：Created in 2020/3/9
 * @version: V1.0
 * @slogan: 天下风云出我辈，一入代码岁月催
 * @description: 反射工具类,根据column调用相关方法
 **/
@Slf4j
public class ClassUtil {

    private static final String SET_METHOD_PREFIX = "set";

    private static final Collection<Class<?>> GENERAL_CLASS_TYPE;

    static {
        GENERAL_CLASS_TYPE = Sets.<Class<?>>newHashSet(boolean.class, Boolean.class, int.class, Integer.class,
                long.class, Long.class,double.class,Double.class,BigDecimal.class, Date.class,String.class);
    }

    public static String getSetterMethodName(final String columnName) {
        if (columnName.contains("_")) {
            return CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.LOWER_CAMEL, SET_METHOD_PREFIX + "_" + columnName);
        }
        return SET_METHOD_PREFIX + String.valueOf(columnName.charAt(0)).toUpperCase() + columnName.substring(1, columnName.length());
    }

    public static void callSetterMethod(final Object object, final String methodName, final String setterValue) {
        for (Class<?> each : GENERAL_CLASS_TYPE) {
            try {
                Method method = object.getClass().getMethod(methodName, each);
                if (boolean.class == each || Boolean.class == each) {
                    method.invoke(object, Boolean.valueOf(setterValue));
                } else if (int.class == each || Integer.class == each) {
                    method.invoke(object, Integer.parseInt(setterValue));
                } else if (long.class == each || Long.class == each) {
                    method.invoke(object, Long.parseLong(setterValue));
                } else if (double.class == each || Double.class == each) {
                    method.invoke(object, Double.parseDouble(setterValue));
                } else if (BigDecimal.class == each) {
                    method.invoke(object, new BigDecimal(setterValue));
                } else if (Date.class == each && StringUtils.isNotBlank(setterValue)) {
                    try {
                        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        method.invoke(object, simpleDateFormat.parse(setterValue));
                    } catch (ParseException e) {
                        log.error("日期转换错误...!:{}",e.getMessage(),e.getCause());
                        //throw new RuntimeException("日期转换错误...!");
                    }
                } else {
                    method.invoke(object, setterValue);
                }
                return;
            } catch (final ReflectiveOperationException ignored) {
            }
        }
    }

    /**
     * 获取clazz类对象以及父类对象的所有成员属性Field
     * @param clazz
     * @return
     */
    public static Field[] getAllFields(Class<?> clazz){
        List<Field> fieldList = new ArrayList<>();
        while (clazz != null){
            fieldList.addAll(Arrays.asList(clazz.getDeclaredFields()));
            clazz = clazz.getSuperclass();
        }
        Field[] fields = new Field[fieldList.size()];
        fieldList.toArray(fields);
        return fields;
    }


}
