package hybridstore.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("*.do")
public class SessionFilter implements Filter {

    public SessionFilter() {
        
    }

	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req =(HttpServletRequest)request;
		HttpServletResponse res=(HttpServletResponse)response;
		PrintWriter out = res.getWriter();
		System.out.println("Now start Request filteration...");
		if(req.getSession(false) == null)
		{
			System.out.println("Session has been expired.");
			out.println("<script type=\"text/javascript\">");
			out.println("window.location.href='login.jsp';");
			//out.println("alert('Session Expired');");
			out.println("</script>");
		}
		else
		{
			chain.doFilter(request, response);
			System.out.println("Now start Response for Filter...");
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
