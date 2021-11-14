package com.koi.bookmanager.log;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspect {
    // Setup Logger
    private static final Logger logger = LogManager.getLogger(LoggingAspect.class);

    @Pointcut("execution(* com.koi.bookmanager.controller.*.*(..))")
    private void forControllerPackage() {}

    @Pointcut("execution(* com.koi.bookmanager.dao.*.*(..))")
    private void forDAOPackage() {}

    @Pointcut("execution(* com.koi.bookmanager.service.*.*(..))")
    private void forServicePackage() {}

    @Pointcut("forControllerPackage() || forDAOPackage() || forServicePackage()")
    private void forLoggingAspect() {}

    @Before("forLoggingAspect()")
    public void beforeLoggin(JoinPoint joinPoint) {
        logger.info("===> in @Before advice: calling method: " + joinPoint.getSignature().toShortString());

        Object[] args = joinPoint.getArgs();
        for (Object arg : args) {
            logger.info("===> Argument: " + arg);
        }
    }

    @AfterReturning(pointcut = "forLoggingAspect()", returning = "result")
    public void afterReturning(JoinPoint joinPoint, Object result) {
        logger.info("===> in @AfterReturning advice: calling method: " + joinPoint.getSignature().toShortString());

        // Display return data
        logger.info("===> result: " + result);
    }
}
