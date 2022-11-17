package com.concerto.ecommerce.aop;



import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class Logging {
private static Logger logger= Logger.getLogger(Logging.class);
	
	@Around("execution(* com.concerto.ecommerce.controller..*.*(..))")
	public Object intercept(ProceedingJoinPoint pjp) throws Throwable{

	    Signature name = pjp.getSignature();
	    try {
	        logger.info("started " + name);
	        Object obj = pjp.proceed();
	        logger.info("finished " + name + " successfully"); 
	        return obj;
	    } catch (Throwable t) {
	         logger.error(name + " finished with Exception - " + t.getMessage());
	         throw t;
	    } finally {
	        // do some more logging if required else skip
	    }       
	}
}
