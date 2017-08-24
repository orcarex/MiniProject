/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package admin;
//henry 引入產品控制器類
import dao.MsgDao;
//henry 引入產品類
import entities.Msg;
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
//henry後臺管理servlet (產品新增)  
public class AddMsgServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    //henry 預設請求處理方法
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try
        {   
            //henry 取得接收request到的各參數 並分別給予變數
            String msgGuestName = request.getParameter("msgGuestName");
            msgGuestName =  new String(msgGuestName.getBytes("ISO-8859-1"), "utf-8"); //vince 多這句可以直接在後台顯示(打)中文
            String guestGuestEmail = request.getParameter("guestGuestEmail");
            String guestGuestMsgContent = request.getParameter("guestGuestMsgContent");
            guestGuestMsgContent =  new String(guestGuestMsgContent.getBytes("ISO-8859-1"), "utf-8");//vince 多這句可以直接在後台顯示(打)中文
          
        
            //henry 建立產品實體
            Msg act = new Msg(msgGuestName, guestGuestEmail, guestGuestMsgContent);
            MsgDao dao = new MsgDao();
            //執行新增產品
            if(dao.add(act))
            {
                //如新增成功則跳轉成功頁面
                response.sendRedirect("contactez-nous.jsp?MsgAddStatus=success");
            }else
            {
                //如新增成功則跳轉失敗頁面
                response.sendRedirect("contactez-nous.jsp?MsgAddStatus=failed");
            }
            
        }catch( Exception ex)
        {
            //henry 如捕獲異常則跳轉到錯誤頁面
            response.sendRedirect("MiniProjet-JEE/");
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
