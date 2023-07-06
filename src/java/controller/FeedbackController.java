/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.FeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDate;
import model.Account;
import model.Feedback;

/**
 *
 * @author dmngh
 */
public class FeedbackController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FeedbackController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FeedbackController at asdaskndn"
                    + "asd" + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mod = request.getParameter("mod");
        int id = Integer.parseInt(request.getParameter("id"));
        String pid = request.getParameter("pid");
        String url = request.getParameter("url");
        if (mod.equals("denine")) {
            FeedbackDAO fd = new FeedbackDAO();
            fd.delete(id);
            response.sendRedirect(url + "?id=" + pid);
        } else {
            FeedbackDAO fd = new FeedbackDAO();
            Feedback f = fd.getFeedbackByid(id);
            fd.changeStatus(f);
            response.sendRedirect(url + "?id=" + pid);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String category = request.getParameter("category");
        int id = Integer.parseInt(request.getParameter("id"));
        if (session.getAttribute("account") == null) {
            request.getRequestDispatcher("login").forward(request, response);
        } else {
            FeedbackDAO fd = new FeedbackDAO();
            Account a = (Account) session.getAttribute("account");
            String feedback = request.getParameter("feedback");
            if (feedback == null || feedback.isEmpty()) {
                if (category.equals("drink")) {
                    request.setAttribute("err", "Not empty!");
                    request.getRequestDispatcher("drink?id=" + id).forward(request, response);
                } else {
                    request.setAttribute("err", "Not empty!");
                    request.getRequestDispatcher("food?id=" + id).forward(request, response);
                }
            } else {
                LocalDate d = LocalDate.now();
                Date date = Date.valueOf(d);
                Feedback f = new Feedback(a.getUsername(), feedback, id, date);
                fd.insert(f);
                if (category.equals("drink")) {
                    response.sendRedirect("drink?id=" + id);
                } else {
                    response.sendRedirect("food?id=" + id);
                }
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
