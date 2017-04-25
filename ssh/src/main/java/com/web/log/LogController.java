package com.web.log;

import java.lang.annotation.*;

@Target({ElementType.PARAMETER, ElementType.METHOD})    
@Retention(RetentionPolicy.RUNTIME)    
@Documented 
public @interface LogController {
	/**
     * 模块名字
     */
    String modual();
 
    /**
     * 操作内容
     */
    String content();
}
