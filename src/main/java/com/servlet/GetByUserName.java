package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.GetId;
import com.luv2code.springsecurity.entity.*;

/**
 * Servlet implementation class GetByUserName
 */
@WebServlet("/GetByUserName")
public class GetByUserName extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetByUserName() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String tuThienId = request.getParameter("name");
        if (tuThienId != null && !tuThienId.isEmpty()) {
            try {
               
              Info tuThien = GetId.getEntityByInfo(tuThienId);
                if (tuThien != null) {
                    request.setAttribute("infoList", tuThien);
                    request.getRequestDispatcher("/updateUser").forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "TuThien with id " + tuThienId + " not found");
                }
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid id");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing id");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
