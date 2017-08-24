/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package admin;
//henry 引入 會員控制類
import dao.ClientDao;
//henry 引入會員類
import entities.Client;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author islem
 */
//henry 後台更新會員servlet類
public class ModifierClientServlet extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
         
            //henry 接收 request 各參數
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String login = request.getParameter("login");
            String mdp = request.getParameter("mdp");
            String address = request.getParameter("address");
            String phone_number = request.getParameter("phone_number");
            
            int a = Integer.parseInt(request.getParameter("date_a"));
            int m = Integer.parseInt(request.getParameter("date_m"));;
            int j = Integer.parseInt(request.getParameter("date_j"));;
                
            Date dt = new Date(a, m, j);
            
            
            int age = 2014 - a ;
            
            
            Client d = new Client(login, mdp, nom, prenom, null,address,phone_number);
            
            ClientDao dao = new ClientDao();
            
            
            if(dao.modifier(d))
            {
                //henry更新成功後跳轉
                
                response.sendRedirect("Admin/CompteListe.jsp?add=success");
            }else
            {
                //henry更新失敗後跳轉
                
                response.sendRedirect("Admin/CompteListe.jsp?add=fail");
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
            throws ServletException, IOException {
        processRequest(request, response);
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
