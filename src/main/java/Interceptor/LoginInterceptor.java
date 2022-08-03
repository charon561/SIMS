package Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// 璇ユ柟娉曟槸鍦ㄦ暣涓姹傛墽琛屽嵆娓叉煋缁撴潫鍚庢墽琛岋紝閫氳繃姝ゆ柟娉曞疄鐜颁竴浜涜祫婧愭竻鐞嗭紝璁板綍鏃ュ織淇℃伅绛夊伐浣�
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView mv)
			throws Exception {
		////璇ユ柟娉曟槸鍦ㄦ帶鍒跺櫒鏂规硶璋冪敤鎵ц涔嬪悗锛屼笖瑙嗗浘瑙ｆ瀽杩樻病杩涜涔嬪墠

	}

	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response ,Object handler)throws Exception{
		String uri = request.getRequestURI();
		if(uri.indexOf("/login")>=0) {
			return true;
		}
		HttpSession session = request.getSession();
		if(((String)session.getAttribute("permission")).equals("1")) {
			return true;
		}
		System.out.print("1");
		request.setAttribute("msg","璇峰厛杩涜绠＄悊鍛樼櫥褰�");
		request.getRequestDispatcher("books_read.jsp").forward(request, response);
		return false;
		
	}
	

}
