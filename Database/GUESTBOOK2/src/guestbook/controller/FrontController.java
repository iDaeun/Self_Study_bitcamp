package guestbook.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestbook.service.GuestBookService;

// /guestWriteForm=WriteFormService -> view: 작성페이지
// /guestWrite=WriteMessageService -> view: 작성완료 페이지
// /guestList=GetMessageListService -> view: 리스트뷰
// /guestDelForm=DeleteFormService -> view: 비밀번호 입력
// /guestDel=DeleteMessageService -> view: 삭제처리완료
// 각각의 service가 viewpage경로를 보여줘야 한다!

@WebServlet(
		urlPatterns = { "/" }, 
		initParams = { 
				@WebInitParam(name = "config", 
						value = "/WEB-INF/commandService.propertise")
		})

public class FrontController extends HttpServlet {
	
	// command패턴(= 인터페이스로 동일 메소드 호출) 실행하기 위해 MAP사용
	private Map<String, GuestBookService> commands = new HashMap<String, GuestBookService>();
	
	@Override
	public void init(ServletConfig config) throws ServletException { // init
		String configfile = config.getInitParameter("config");
		
		// text기반 문서로 경로 & 서비스 객체 저장된 properties
		Properties prop = new Properties();
		
		// prop.load를 쓰기 위해선 IO가 필요하다! (절대경로 -> inputstream 필요, 파일입출력)
		FileInputStream fis = null;
		// config 파일의 절대경로 
		String configFilePath = config.getServletContext().getRealPath(configfile);
		
		// properties에 load하기 -> Key, Value => 문자열, 문자열로 저장
		try {
			
			fis = new FileInputStream(configFilePath);
			prop.load(fis); 
			System.out.println("프로퍼티 사이즈: "+ prop.size());
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// prop.keySet() -> key값을 set집합으로 만들어줌 -> iterator
		// => commands "MAP"에 저장: key값, 서비스객체(Class사용)
		Iterator itr = prop.keySet().iterator();
		
		while(itr.hasNext()) {
			//System.out.println(itr.next()); **next 두개 들어가서 문제생김!!!!!!!!!!!
			
			String command = (String)itr.next(); // 사용자 요청 URI (key값, 경로)
			String serviceClassName = prop.getProperty(command); // 서비스 클래스 이름 (value값, 실행서비스)
						
			try {
				
				// prop에 있는 클래스 이름으로 인스턴스 생성
				Class serviceClass = Class.forName(serviceClassName);
				// 객체 생성
				GuestBookService service = (GuestBookService) serviceClass.newInstance();
				
				// commands Map에 저장 <String, GuestBookService>
				commands.put(command, service);
				
				System.out.println(command+"확인"+service);
				
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	}
       
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 사용자 요청 분석
		String commandUri = request.getRequestURI(); // /guest/guestList 등등 URI가 들어옴
		if(commandUri.indexOf(request.getContextPath()) == 0) { // /guest -> 0 index인지?
			commandUri = commandUri.substring(request.getContextPath().length()); // /guest 뒷부분 뽑아냄
		}
		
		System.out.println(commandUri);
		
		// 2. 사용자 요청에 맞는 모델 실행 (서비스.메소드 실행) -> view 페이지 반환
		String viewPage = "/WEB-INF/view/null.jsp";
		
		// "MAP" -> get(KEY) => service객체(VALUE) 가져옴
		GuestBookService service = commands.get(commandUri); // null값을 반환하기도 한다
		
		if(service != null) {
			viewPage = service.getViewName(request, response); // Interface GuestBookService의 메소드
		}
		
		// 3. view 로 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
