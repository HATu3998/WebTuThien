package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.InfoDAO;
import com.luv2code.springsecurity.entity.Info;

@WebServlet("/searchServlet")
public class searchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public searchServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");

        InfoDAO infoDAO = new InfoDAO();
        List<Info> searchResults = infoDAO.search(keyword);

        request.setAttribute("searchResults", searchResults);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/searchUser");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
