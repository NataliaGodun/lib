package by.htp.library.service;

import java.util.ArrayList;

import by.htp.library.domain.Book;
import by.htp.library.service.exception.ServiceException;

/**
 * �hecks the parameters and passes control to the dao layer
 * @author Godun Natalia
 * @version 1.0
 */
public interface BookService {
	ArrayList<Book> showBooks() throws ServiceException;

	Book addBook(Book book) throws ServiceException;

	Book viewBook(int id) throws ServiceException;

	Book deleteBook(int id) throws ServiceException;

	Book searchBook(String nameBook) throws ServiceException;

}
