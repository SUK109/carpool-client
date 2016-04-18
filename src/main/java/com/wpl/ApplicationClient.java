  package com.wpl;

import java.io.IOException;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@SpringBootApplication
public class ApplicationClient 
{
	public static void main(String[] args) throws IOException 
	{
		/*javax.net.ssl.HttpsURLConnection.setDefaultHostnameVerifier(
				new javax.net.ssl.HostnameVerifier(){

				    public boolean verify(String hostname,
				            javax.net.ssl.SSLSession sslSession) {
				        return hostname.equals("localhost");
				    }
				});*/
		System.setProperty("javax.net.ssl.keyStoreType", "PKCS12");
		System.setProperty("javax.net.ssl.keyStore", "carkey.p12");
		System.setProperty("javax.net.ssl.keyStorePassword", "sample");
		System.setProperty("javax.net.ssl.trustStoreType","JKS");
		String certificatesTrustStorePath = "C:/Program Files/Java/jdk1.8.0_51/jre/lib/security/cacerts";
		System.setProperty("javax.net.ssl.trustStore", certificatesTrustStorePath);
		System.setProperty("javax.net.ssl.trustStorePassword", "changeit");
		
		ApplicationContext ctx = SpringApplication.run(ApplicationClient.class, args);

		System.out.println("Spring Boot Application Started at : port 9443");

		/*System.out.println("Let's inspect the beans provided by Spring Boot:");
        String[] beanNames = ctx.getBeanDefinitionNames();
        Arrays.sort(beanNames);
        for (String beanName : beanNames) {
            System.out.println(beanName);
        }*/
	}
	
}

@Controller 
class HomeContoller {
    @RequestMapping("/")
    public String index() {
        return "login";
    }
}