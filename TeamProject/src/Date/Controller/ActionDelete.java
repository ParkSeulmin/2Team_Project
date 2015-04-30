package Date.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Date.DAO.SendArrow_DAO;
import Login.Action.Action;
import Login.Action.ActionForward;

public class ActionDelete implements Action {

	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward= new ActionForward();
		String s_id=(String)request.getAttribute("s_id");
		String r_id=(String)request.getAttribute("r_id");
		
		SendArrow_DAO mydao=new SendArrow_DAO();
		String result=mydao.deleteArrow(s_id,r_id);
		System.out.println(result);
		request.setAttribute("result", result);
		return forward;
	}
}
