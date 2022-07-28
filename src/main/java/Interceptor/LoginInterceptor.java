package Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// 该方法是在整个请求执行即渲染结束后执行，通过此方法实现一些资源清理，记录日志信息等工作
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView mv)
			throws Exception {
		////该方法是在控制器方法调用执行之后，且视图解析还没进行之前

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
		request.setAttribute("msg","请先进行管理员登录");
		request.getRequestDispatcher("books_read.jsp").forward(request, response);
		return false;
		
	}
	

}
