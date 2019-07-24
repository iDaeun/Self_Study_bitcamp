package controller;
import java.io.FileInputStream;
// ★★ MVC패턴 구현!!!! ★★
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.DateService;
import service.GreetingService;
import service.OtherService;
import service.Service;

@WebServlet("/") // = 모든 요청
public class FrontController2 extends HttpServlet {
	
	//----------------------------------------------------------------
	// &&& command 한번에 처리 &&&
	// Map<"uri",service타입> 만들어서 사용
	Map<String, Service> commands = new HashMap<String, Service>();
	// default 생성자
	public FrontController2() {
		// command에 맞춰서 instance 생성
		// command : / , /greeting, /now/date ... ===> 계속 증가하는 부분!!!!
		/*
		 * commands.put("/", new GreetingService()); commands.put("/greeting", new
		 * GreetingService()); commands.put("/now/date", new DateService());
		 */
		
		
	}
	//----------------------------------------------------------------
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		String configFile = config.getInitParameter("config");
		Properties prop = new Properties();
		FileInputStream fis = null;

		String configFilePath = config.getServletContext().getRealPath(configFile);
		try {
			fis = new FileInputStream(configFilePath);
			prop.load(fis);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new ServletException(e);
		} finally {
			if(fis!=null) {
				try {
					fis.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		Iterator keyItr = prop.keySet().iterator();		
		while(keyItr.hasNext()) {
			String command = (String) keyItr.next();
			String serviceClassName = prop.getProperty(command);

			try {
				Class serviceClass = Class.forName(serviceClassName);
				Service serviceInstance = (Service) serviceClass.newInstance();
				commands.put(command, serviceInstance);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	// doGet, doPost -> 모두 다 process메소드 실행
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1) 요청파악 : URI 가져옴
		String command = request.getRequestURI();
		System.out.println("사용자 요청 URI: " + command);
		
		if(command.indexOf(request.getContextPath()) == 0) {
			command = command.substring(request.getContextPath().length());
		}
		
		System.out.println("contextPath 빼낸 URI: " + command);
		
		// 응답결과
		String resultObj = "";
		String viewpage = "";
		
		//----------------------------------------------------------------
		// &&& command 한번에 처리 &&&
		// command(=uri)에 따라서 해당 service객체 받아옴
		Service service = commands.get(command);
		// 그 외의 uri를 받아올때:
		if(service == null) {
			service = new OtherService();
		}
		// uri에 따른 service객체의 getViewPage() 페이지 주소 받기 => viewPage에 대입
		viewpage = service.getViewPage(request);
		//----------------------------------------------------------------
		
		// 2) 요청에 맞는 기능 수행 : Model 처리 (Service + DAO + 기능 class) => 결과 데이터 반환
		// command = 사용자 요청부분만 골라낸 URI
		/*
		 * if(command == null || command.equals("/greeting") || command.equals("/")) {
		 * 
		 * // 응답코드 -> service객체에서 받아오기: //resultObj = (String) new
		 * GreetingService().getObject(request);
		 * 
		 * // 각 처리마다 -> 다른 뷰로 가게끔 처리 // viewpage = 응답코드 생성(a.jsp 안에서 응답코드만 달리 생성)
		 * //resultObj = "안녕하세요"; //viewpage = "/simplePage.jsp";
		 * 
		 * // *** 응답코드 생성, 저장, 뷰페이지 이동 한번에 처리 *** viewpage = new
		 * GreetingService().getViewPage(request);
		 * 
		 * 
		 * } else if (command.equals("/now/date")) { // "/now/date" -> 폴더의 개념이 아니라 하나의
		 * 요청으로 봐야함 //resultObj = new Date().toString(); //viewpage = "/datePage.jsp";
		 * 
		 * // *** 응답코드 생성, 저장, 뷰페이지 이동 한번에 처리 *** viewpage = new
		 * DateService().getViewPage(request);
		 * 
		 * } else { //resultObj = "Invalid type"; //viewpage = "/simplePage.jsp";
		 * 
		 * // *** 응답코드 생성, 저장, 뷰페이지 이동 한번에 처리 *** viewpage = new
		 * OtherService().getViewPage(request); }
		 */
		
		// 3) 결과 데이터를 request 또는 session 영역에 속성으로 저장 = view로 데이터 전달, 공유 역할
		//request.setAttribute("result", resultObj); // <-view에서는 EL로 표현만 해주면 됨!
		
		// 4) 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewpage);
		dispatcher.forward(request, response);
		
	}
}
