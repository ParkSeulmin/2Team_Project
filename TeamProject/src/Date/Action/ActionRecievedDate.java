package Date.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Date.DAO.SendArrow_DAO;
import Login.Action.Action;
import Login.Action.ActionForward;
import Mypage.DTO.Arrow_DTO;

public class ActionRecievedDate implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List<Arrow_DTO> ar=new ArrayList<Arrow_DTO>();
		
		ActionForward forward=new ActionForward(); 
		SendArrow_DAO Arw_dao=new SendArrow_DAO();
		
		String recieved_id=(String)request.getAttribute("id");
		System.out.println(recieved_id+"우다다다다다다닫다");
		ar=Arw_dao.Recieved_Arrow(recieved_id);
		request.setAttribute("result", ar);
		forward.setPath("Mypage_RecieveList.jsp");
		forward.setRedirect(false);
		return forward;
	}
}