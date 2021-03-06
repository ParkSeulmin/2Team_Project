package Date.Action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Date.DAO.SendArrow_DAO;
import Login.Action.Action;
import Login.Action.ActionForward;
import Login.DTO.Member;
import Mypage.DTO.Arrow_DTO;

public class ActionDelete implements Action {

	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward= new ActionForward();
		
		String s_id=(String)request.getAttribute("s_id");
		String r_id=(String)request.getAttribute("r_id");
		
		SendArrow_DAO mydao=new SendArrow_DAO();
		mydao.deleteArrow(s_id,r_id);//확인 -->삭제 
		
		List<Member> memberlist=new ArrayList<Member>();
		List<Arrow_DTO> arlist=new ArrayList<Arrow_DTO>();
		
		arlist=mydao.CheckSend(r_id);//본인 찾기
	
		String requestpage=request.getParameter("rp");
		if(request.getParameter("rp")==null){
			requestpage="1";
		}
		memberlist=mydao.getFriendList(r_id,requestpage);//
		String totalfriend=mydao.getTotal(r_id);//
		
		request.setAttribute("total", totalfriend);
		request.setAttribute("friends", memberlist);
		request.setAttribute("arrowlist", arlist);
		
		//
		System.out.println("total"+ totalfriend);
		System.out.println("friends" + memberlist);
		System.out.println("arrowlist"+ arlist);
		
		forward.setPath("/Mypage/Mypage_SendListTable.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
