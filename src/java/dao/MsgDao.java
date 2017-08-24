/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;


import entities.Msg;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;
/**
 *
 * @author h
 */
public class MsgDao {
     //henry 建立連線實體
    Connection con = DBConnexion.getInstance();
    //henry 新增訪客訊息(方法)
    public boolean add(Msg m)
    {
        try
        {
              String req = "INSERT INTO msg(`msgGuestId`, `msgGuestName`, `guestGuestEmail`, `guestGuestMsgContent`)"
                    + " VALUES (NULL, '" +m.getMsgGuestName() + "', '" + m.getGuestGuestEmail()+ "', '" + m.getGuestGuestMsgContent()+ "');";

            Statement st = con.createStatement();

            int rs = st.executeUpdate(req);

            if (rs > 0)
            {
                return true;
            }

        } catch (Exception e1)
        {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }

        return false;
    }
      //henry 查詢所有訪客留言 並回傳Vector資料型態 
    public Vector<Msg> findAll()
    {
        String req = "SELECT* " + " FROM msg ";

        Vector<Msg> vect = null;

        try
        {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(req);

            while (rs.next())
            {

                if (vect == null)
                {
                    vect = new Vector<>();
                }

                Msg m = new Msg(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));

                vect.add(m);
            }

            return vect;
        } catch (Exception e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return null;
    }
      //henry 查找特定產品(方法) 傳入id參數
    public Msg findByID(int id)
    {
        String req = "SELECT * " + " FROM msg " + " WHERE msgGuestId = " + id;

        try
        {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(req);

            Msg m = null;

            if (rs.next())
            {
                //Article(int idArticle, String libelle, String desc, double prix, String img, int qte, Date dateAjout)

                m = new Msg(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4));
            }
            return m;

        } catch (Exception e)
        {
            e.printStackTrace();
        }

        return null;
    }
      //henry 修改訪客留言(方法) 傳入留言實體
    public boolean update(Msg m)
    {
        try
        {
            String req = "UPDATE `msg` "
                    + "SET `msgGuestName`='" + m.getMsgGuestName() + "', "
                    + "`guestGuestEmail`='" + m.getGuestGuestEmail() + "', "
                    + "`guestGuestMsgContent`='" + m.getGuestGuestMsgContent()+ "' "
                    + "WHERE `msgGuestId`='" + m.getMsgGuestId() + "';";

            Statement st = con.createStatement();

            int rs = st.executeUpdate(req);

            if (rs > 0)
            {
                return true;
            }

        } catch (Exception e1)
        {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }

        return false;
    }
      //henry 移除留言(方法) 傳入產品實體
    public boolean remove(int msgGuestId)
    {
        try
        {
            String req = "DELETE FROM msg " + "WHERE msgGuestId = " + msgGuestId;

            Statement st = con.createStatement();

            int rs = st.executeUpdate(req);

            if (rs > 0)
            {
                return true;
            }

        } catch (Exception e1)
        {
            e1.printStackTrace();
        }

        return false;
    }
}
