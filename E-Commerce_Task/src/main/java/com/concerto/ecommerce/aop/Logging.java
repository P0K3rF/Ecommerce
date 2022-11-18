package com.concerto.ecommerce.aop;



import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class Logging {
private static Logger logger= Logger.getLogger(Logging.class);

@Pointcut("execution(* com.concerto.ecommerce.controller..*.*(..)) || execution(* com.concerto.ecommerce.service..*.*(..)) || execution(* com.concerto.ecommerce.service..*.*(..))")
public void poc() {
	    //Point cut expression
}



//Adding Controller logger 
	@Around(value = "poc()")
	public Object intercept(ProceedingJoinPoint pjp) throws Throwable{

	    Signature name = pjp.getSignature();
	    try {
	        logger.info("started " + name);
	        
	        Object[] methodData=pjp.getArgs();
	        for(Object data:methodData)
	        {
	        	logger.info("Data Going in method is "+ data);
	        }
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
