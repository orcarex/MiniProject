/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dao.ClientDao;
import entities.Client;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Walid
 */
//henry 前台 會員更新資料動作處理 servlet類
public class CompteServlet extends HttpServlet
{
    
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
            throws ServletException, IOException
    {
        request.setCharacterEncoding("UTF-8");
        //henry 取得個接收request 參數
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String address = request.getParameter("address");
        String phone_number = request.getParameter("phone_number");
        String login = request.getParameter("login");
        String mdp = request.getParameter("mdp");
        
        Client d = new Client(login, mdp, nom, prenom, null,address,phone_number);
        ClientDao dao = new ClientDao();
        if(request.getParameter("msg").equals("update")){
        if (dao.update(d))
        {   
            //henry 更新成功後
            response.sendRedirect("mon_compte.jsp?update=success");
            
            request.getSession().setAttribute("client", d);
        }
        }
        
        else if(request.getParameter("msg").equals("add"))
        {
            if(dao.add(d))
                {
                response.sendRedirect("mon_compte.jsp?add=success");
            
                request.getSession().setAttribute("client", d);    
                }
        }else
                {
                //henry 更新失敗後
                response.sendRedirect("mon_compte.jsp?update=fail");
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
            throws ServletException, IOException
    {
        processRequest(request, response);
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
            throws ServletException, IOException
    {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo()
    {
        return "Short description";
    }// </editor-fold>

}
