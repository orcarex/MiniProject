package dao ;

//henry 引入java.sql相關類
import java.sql.*;

import com.mysql.jdbc.Connection;
//henry 資料庫連線類
public class DBConnexion 
{   
    //henry 建立連線實體 con
    private static Connection con=null;
    //henry 資料庫連線方法 DBConnection
    private DBConnexion()
    {
        try
        {
            //henry 引入 mysql 的jdbc 之Driver類
            Class.forName("com.mysql.jdbc.Driver");
            //henry 建立連線 並給予 連線字串參數 伺服器位置,資料庫名稱,mysql帳號,密碼 等參數
            con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost/wshop","root","root");
        }
        catch(ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        catch(SQLException e1)
        {
            e1.printStackTrace();
        }
    }
    //henry 靜態取的連線實體方法
    public static Connection getInstance()
    {
        if(con==null)
            new DBConnexion();
        return con;
            
        
    }
}