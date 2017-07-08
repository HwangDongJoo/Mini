package kr.co.bit.mini.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet {

	private HandlerMapping mappings = null;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		String configName = config.getInitParameter("configName");
		System.out.println("init : " + configName);
		mappings = new HandlerMapping(configName);
	}

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		
		uri = uri.substring(context.length());
		
		try {
			
			Controller controller = mappings.getController(uri);
			System.out.println("controller : " + controller);
			String callPage = controller.HandleRequest(request, response);
			RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
			
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new ServletException(e);
		}
		
	}

	
	
}
