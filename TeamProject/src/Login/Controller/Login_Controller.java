package Login.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Login.Action.Action;
import Login.Action.ActionForward;
import Login.Action.Action_Login_Check;


//@WebServlet("*.Login")
public class Login_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Login_Controller() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}
	
	private void doProcess(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		ActionForward forward = null;
		Action action = null;
		String command = req.getParameter("cmd");
		 	
		if (command.equals("logincheck")) {
		
			action = new  Action_Login_Check(); 
			
			System.out.println(action);
	    	   try{
	     		   forward = action.execute(req, res);
	     	   }catch(Exception e){
	     		   e.printStackTrace();
	     	   }
			
		} else if(command.equals("Main.html")){
			RequestDispatcher dis = req
					.getRequestDispatcher("/Main.html");
			dis.forward(req, res);
			
		}
		
		if(forward != null){
			if(forward.isRedirect()){ //view 단 바로....
				System.out.println("forward.isRedirect() : " + forward.isRedirect());
				System.out.println(res);
				res.sendRedirect(forward.getPath());
			}else{
				System.out.println("forward.getPath() : " + forward.getPath());
				RequestDispatcher dispatcher =
				req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, res);
				req.setAttribute("result",req.getParameter("result"));
				
				
			}
		}
	}

}