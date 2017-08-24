/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package admin;
//henry 引入產品控制器類
import dao.ArticleDao;
//henry 引入產品類
import entities.Article;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
/**
 *
 * @author islem
 */
//henry後臺管理servlet (產品新增)  
public class AjouterArticleServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        //henry 上傳檔案開始
        MultipartRequest multi = new MultipartRequest(request, "D:/teamProject/MiniProjet-JEE/web/produitImages");
            String fname = multi.getFilesystemName("fname");
            fname="produitImages/"+fname;            
        //henry 上傳檔案結束
        
        try
        {    
            
            //henry 取得接收request到的各參數 並分別給予變數
            String libelle = multi.getParameter("libelle");
            libelle = new String(libelle.getBytes("ISO-8859-1"), "UTF-8");//vince 多這句可以直接在後台顯示(打)中文
            String desc = new String(multi.getParameter("desc").getBytes("ISO-8859-1"),"UTF-8");
            Double prix = Double.parseDouble(multi.getParameter("prix"));
            int quantite=Integer.parseInt(multi.getParameter("quantite"));
            
            int a = Integer.parseInt(multi.getParameter("date_a"))-1900;//vince 輸出莫名都多1900年 於是在這減1900
            int m = Integer.parseInt(multi.getParameter("date_m"))-1;
            int j = Integer.parseInt(multi.getParameter("date_j"));
            //vince 同訂單的時間顯示    
            java.util.Date dt = new java.util.Date(a, m, j);
            java.sql.Timestamp sqlDate = new java.sql.Timestamp(dt.getTime());
            //String img = multi.getParameter("urlImage");
            //henry 將年齡格式化為西元格式
            int age = 2014 - a ;
            //henry 建立產品實體
            Article act = new Article(-1, libelle, desc, prix,fname, quantite,sqlDate);
            ArticleDao dao = new ArticleDao();
            //執行新增產品
            if(dao.add(act))
            {   //vince 延遲2秒後跳頁
                Thread.sleep(2000);
                //如新增成功則跳轉成功頁面
                response.sendRedirect("Admin/ProduitListe.jsp?add=success");
            }else
            {
                //如新增成功則跳轉失敗頁面
                response.sendRedirect("Admin/ProduitListe.jsp?add=fail");
            }
            
        }catch( Exception ex)
        {
            //henry 如捕獲異常則跳轉到錯誤頁面
            response.sendRedirect("Admin/ProduitListe.jsp?add=fail");
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
