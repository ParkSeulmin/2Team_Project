package Board.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.DAO.BoardDAO;
import Board.DTO.Board;

 public class BoardDetailAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{ 
		request.setCharacterEncoding("utf-8");
   		
		BoardDAO boarddao=new BoardDAO();
	   	Board boarddata=new Board();
	   	
		int num=Integer.parseInt(request.getParameter("num"));
		boarddao.setReadCountUpdate(num);
	   	boarddata=boarddao.getDetail(num);
	   	
	   	if(boarddata==null){
	   		System.out.println("상세보기 실패");
	   		return null;
	   	}
	   	System.out.println("상세보기 성공");
	   	
	   	request.setAttribute("boarddata", boarddata);
	   	ActionForward forward = new ActionForward();
	   	forward.setRedirect(false);
   		forward.setPath("./Board/nomal_board_view.jsp");
   		return forward;

	 }
}