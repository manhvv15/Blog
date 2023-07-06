/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DrinkDAO;
import dal.FoodDAO;
import dal.PostDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Drink;
import model.Food;
import model.Post;

/**
 *
 * @author dmngh
 */
public class PostController extends HttpServlet {

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
            out.println("<title>Servlet PostController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PostController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("post.jsp").forward(request, response);
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
        String title = request.getParameter("title");
        String image = request.getParameter("image");
        String vote_raw = request.getParameter("vote");
        String content = request.getParameter("content");
        String op = request.getParameter("op");

        try {
            int vote = Integer.parseInt(vote_raw);
            if (vote < 1 || vote > 5) {
                throw new NumberFormatException();
            } else {
                if (op.equals("drink")) {
                    PostDAO pd = new PostDAO();
                    Post d = new Post(title, content, image, "drink", vote);
                    pd.insert(d);
                    request.getRequestDispatcher("home").forward(request, response);
                } else {
                    PostDAO pd = new PostDAO();
                    Post d = new Post(title, content, image, "food", vote);
                    pd.insert(d);
                    request.getRequestDispatcher("home").forward(request, response);
                }
            }
        } catch (NumberFormatException e) {
            request.setAttribute("title", title);
            request.setAttribute("image", image);
            request.setAttribute("vote", vote_raw);
            request.setAttribute("content", content);
            request.setAttribute("err", "Enter vote is a integer number greater than 0 and less than 6");
            request.getRequestDispatcher("post.jsp").forward(request, response);
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
