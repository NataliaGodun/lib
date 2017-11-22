package by.htp.library.command.impl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import by.htp.library.command.Command;
import by.htp.library.domain.User;
import by.htp.library.service.UserService;
import by.htp.library.service.exception.ServiceException;
import by.htp.library.service.factory.ServiceFactory;

/**
 * @author Godun Natalia
 * @version 1.0
 */
public class EditProfileName implements Command {
	private static final String LOGIN= "login";
	private static final String USER = "user";
	private static final String ERROR_MESSAGE= "errorMessage";
	private static final String MESSAGE_LOGIN_EXISTS = "The user with such login already exists";
	private static final String MESSAGE_ABOUT_PROBLEM = "Sorry,technical problem";
	private static final String MAIN_JSP = "WEB-INF/jsp/main.jsp";
	private static final String EDIT_PROFILE_JSP = "WEB-INF/jsp/EditProfile.jsp";
	private static final String NAME_USER = "name";
	private static final String MESSAGE_ERROR_EDITION_PROFILE_NAME = "Error at editing profile name";
	
	private static final Logger LOGGER = LogManager.getRootLogger();
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name=request.getParameter(NAME_USER);
	
		HttpSession session=request.getSession(true);
		String login=(String) session.getAttribute(LOGIN);
		
		ServiceFactory factory=ServiceFactory.getInstance();
		UserService userService=factory.getUserService();
		
		String page;
		User user = null;
		try {
			user = userService.editProfileName(name,login);
			if (user!=null){
				String Name=user.getName();
				session.removeAttribute(NAME_USER);
				session.setAttribute(NAME_USER, Name);
				
				request.setAttribute(USER, user);
				page=MAIN_JSP;
			}else{
				request.setAttribute(ERROR_MESSAGE, MESSAGE_LOGIN_EXISTS);
				page=EDIT_PROFILE_JSP;
				
			}
		} catch (ServiceException e) {
			
			LOGGER.log(Level.ERROR,MESSAGE_ERROR_EDITION_PROFILE_NAME, e);	
			
			request.setAttribute( ERROR_MESSAGE, MESSAGE_ABOUT_PROBLEM);
			page=MAIN_JSP;
		}
				
		RequestDispatcher dispatcher=request.getRequestDispatcher(page);
		
			dispatcher.forward(request, response);
			
	}


}
