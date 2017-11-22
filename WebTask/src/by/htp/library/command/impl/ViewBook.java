package by.htp.library.command.impl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import by.htp.library.command.Command;
import by.htp.library.domain.Book;
import by.htp.library.service.BookService;
import by.htp.library.service.exception.ServiceException;
import by.htp.library.service.factory.ServiceFactory;

/**
 * @author Godun Natalia
 * @version 1.0
 */
public class ViewBook implements Command {
	private static final String ID ="id";
	private static final String BOOK = "book";
	private static final String VIEW_JSP = "WEB-INF/jsp/viewBook.jsp";
	private static final String MAIN_JSP = "WEB-INF/jsp/main.jsp";
	private static final String ERROR_MESSAGE = "ErrorMessage";
	private static final String MESSAGE_ABOUT_PROBLEM= "Sorry,technical problem";
	private static final String MESSAGE ="message";
	private static final String MESSAGE_ERROR_VIEW_BOOK="Error at view book";
	
	private static final Logger LOGGER = LogManager.getRootLogger();
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String idBook=request.getParameter(ID);
		
		int id=Integer.parseInt(idBook);
		
		ServiceFactory factory=ServiceFactory.getInstance();
		BookService bookService=factory.getBookService();
		
		Book book = null;
		String page = null;
		
		
		try {
			book = bookService.viewBook(id);
			if (!(request.getParameter(MESSAGE)==null)){
				String message=request.getParameter(MESSAGE);
				request.setAttribute(MESSAGE,message);
			}
			request.setAttribute(BOOK, book);
			page=VIEW_JSP;
			
		} catch (ServiceException e) {
			
			LOGGER.log(Level.ERROR,MESSAGE_ERROR_VIEW_BOOK, e);	
			
			request.setAttribute(ERROR_MESSAGE, MESSAGE_ABOUT_PROBLEM);
			page=MAIN_JSP;
		}
			
		RequestDispatcher dispatcher=request.getRequestDispatcher(page);
		
			dispatcher.forward(request, response);
			
	}
}
