package member;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MainForSpring2 {

   
   /* private static Assembler assembler = new Assembler(); */
     
   //스프링 컨테이너 생성 : 조립기 설정파일 appCtx1.xml
    private  static ApplicationContext ctx = new GenericXmlApplicationContext("classpath:appCtx5.xml");
    
   public static void main(String[] args) throws IOException {
      
      System.out.println("스프링 컨테이너에서 받은 객체");
      System.out.println("MemberRegisterService");
      System.out.println("");
      MemberRegisterService regisetService1 = ctx.getBean("registService", MemberRegisterService.class);
      MemberRegisterService regisetService2 = ctx.getBean("registService", MemberRegisterService.class);
      
      boolean chk = regisetService1 == regisetService2;
      
      System.out.println("regisetService1 == regisetService2 : " + chk);
      
      System.out.println("==========================================");
      System.out.println("스프링 컨테이너에서 받은 객체");
      System.out.println("ChangePasswordService");
      System.out.println("");
      
      ChangePasswordService passwordService1 = ctx.getBean("changePwService", ChangePasswordService.class);
      ChangePasswordService passwordService2 = ctx.getBean("changePwService", ChangePasswordService.class);
      
      chk = passwordService1 == passwordService2;
      System.out.println("passwordService1 == passwordService2 : " + chk);
      
      ChangePasswordService passwordService3 = ctx.getBean("changePwService", ChangePasswordService.class);
      
      chk = passwordService2 == passwordService3;
      System.out.println("passwordService2 == passwordService3 : " + chk);
      
   }
}