package com.web.log;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.web.entity.Log;
import com.web.entity.User;
import com.web.service.LogService;

import java.lang.reflect.Method;
import java.util.Date;

import javax.annotation.Resource;

@Aspect
@Component
public class SysLogAspect {
	
	@Resource
	private LogService logService;
	private Log log=new Log();
	
	private static final Logger logger = Logger.getLogger(SysLogAspect.class);
	 
    @Pointcut("@annotation(com.web.log.LogController)")
    public void controllerAspect()
    {
        System.out.println("切入点");
    }
    /**
     * 前置通知（Before advice） ：在某连接点（JoinPoint）之前执行的通知，但这个通知不能阻止连接点前的执行。
     * @param joinPoint
     */
    /*@Before(value = "controllerAspect()")
    public void doBefore(JoinPoint joinPoint)
    {
        System.out.println("=====SysLogAspect前置通知开始=====");
        handleLog(joinPoint, null,null);
    }*/
    
    /**
     * 正常返回通知
     * @param joinPoint
     */
    @AfterReturning(pointcut = "controllerAspect()",returning="mv")
    public void doAfterReturn(JoinPoint joinPoint,ModelAndView mv)
    {
        System.out.println("=====SysLogAspect后置通知开始=====");
        handleLog(joinPoint, null,mv);
        log.setType("正常");
        if(log.getUser()!=null)
        logService.add(log);
    }
 
    /**
     * 抛出异常后通知（After throwing advice） ： 在方法抛出异常退出时执行的通知。
     * @param joinPoint
     * @param e
     */
    @AfterThrowing(value = "controllerAspect()", throwing = "e")
    public void doAfter(JoinPoint joinPoint, Exception e)
    {
        System.out.println("=====SysLogAspect异常通知开始=====");
        handleLog(joinPoint, e,null);
        log.setType("异常");
        if(log.getUser()!=null)
        logService.add(log);
    }
 
    /**
     * 环绕通知（Around advice） ：包围一个连接点的通知，类似Web中Servlet规范中的Filter的doFilter方法。可以在方法的调用前后完成自定义的行为，也可以选择不执行。
     * @param joinPoint
     * 为什么使用环绕通知时controller方法无法正常执行,被打断后序方法
     */
    /*@Around("controllerAspect()")
    public void doAround(JoinPoint joinPoint){
        System.out.println("=====SysLogAspect 环绕通知开始=====");
        handleLog(joinPoint, null);
    }*/
 
    /**
     * 日志处理
     *
     * @param joinPoint
     * @param e
     */
    private void handleLog(JoinPoint joinPoint, Exception e,ModelAndView mv)
    {
        try
        {
            //获得注解
            LogController logger = giveController(joinPoint);
            if (logger == null)
            {
                return;
            }
            for (int i = 0; i < joinPoint.getArgs().length; i++) {  
                System.out.println(joinPoint.getArgs()[i]);  
            }
            String methodName = joinPoint.getSignature().getName();
            log.setContent(logger.content());
            log.setDate(new Date());
            log.setModual(logger.modual());
            if(mv!=null&&mv.getModel().containsKey("user")){
            	User user=(User)mv.getModel().get("user");
            	log.setUser(user);
            }else{
            	System.out.println("日志记录需要用户id");
            }
            String classType = joinPoint.getTarget().getClass().getName();
 
            Class<?> clazz = Class.forName(classType);
 
            Method[] methods = clazz.getDeclaredMethods();
            System.out.println("methodName: " + methodName);
 
            for (Method method : methods)
            {
                if (method.isAnnotationPresent(LogController.class)
                        && method.getName().equals(methodName))
                {
                    String clazzName = clazz.getName();
                    System.out.println("clazzName: " + clazzName + ", methodName: "
                            + methodName);
                }
            }
            
            
        } catch (Exception exp)
        {
            logger.error("异常信息:{}", exp);
            exp.printStackTrace();
        }
    }
 
    /**
     * 获得注解
     * @param joinPoint
     * @return
     * @throws Exception
     */
    private static LogController giveController(JoinPoint joinPoint) throws Exception
    {
        Signature signature = joinPoint.getSignature();
        MethodSignature methodSignature = (MethodSignature) signature;
        Method method = methodSignature.getMethod();
 
        if (method != null)
        {
            return method.getAnnotation(LogController.class);
        }
        return null;
    }
}
