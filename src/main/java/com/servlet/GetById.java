package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.GetId;
import com.luv2code.springsecurity.entity.TuThien;

@WebServlet("/GetById")
public class GetById extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tuThienId = request.getParameter("tuThien_id");
        if (tuThienId != null && !tuThienId.isEmpty()) {
            try {
                Long id = Long.parseLong(tuThienId);
                TuThien tuThien = GetId.getEntityById(id);
                if (tuThien != null) {
                    request.setAttribute("tuThien", tuThien);
                    request.getRequestDispatcher("/updateTuThien").forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "TuThien with id " + id + " not found");
                }
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid id");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing id");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
