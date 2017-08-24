/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
//henry 引入產品類
import entities.Article;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

/**
 *
 * @author Walid
 */
//henry 產品控制器類
public class ArticleDao
{
    //henry 建立連線實體
    Connection con = DBConnexion.getInstance();
    //henry 新增產品(方法) 傳入產品實體
    public boolean add(Article a)
    {
        try
        {
            String req = "INSERT INTO article(`idarticle`, `libelle`, `desc`, `prix`, `img`, `qte`,dateajout)"
                    + " VALUES (NULL , '" + a.getLibelle() + "', '" + a.getDesc() + "', '" + a.getPrix() + "', '" + a.getImg() + "', '" + a.getQte() + "', '" + a.getDateAjout() + "');";

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
    //henry 移除產品(方法) 傳入產品實體
    public boolean remove(int idArticle)
    {
        try
        {
            String req = "DELETE FROM article " + "WHERE idarticle = " + idArticle;

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
    //henry 修改產品(方法) 傳入產品實體
    public boolean update(Article a)
    {
        try
        {   //vince 加了更新日期
            String req = "UPDATE `article` "
                    + "SET `libelle`='" + a.getLibelle() + "', "
                    + "`desc`='" + a.getDesc() + "', "
                    + "`prix`='" + a.getPrix() + "', "
                    + "`img`='" + a.getImg() + "', "
                    + "`qte`='" + a.getQte() + "', "
                    + "`dateajout`='" + a.getDateAjout() + "' "
                    + "WHERE `idarticle`='" + a.getIdArticle() + "';";

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
    //henry 查找特定產品(方法) 傳入id參數
    public Article findByID(int id)
    {
        String req = "SELECT* " + " FROM article " + " WHERE idArticle = " + id;

        try
        {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(req);

            Article e = null;

            if (rs.next())
            {
                //Article(int idArticle, String libelle, String desc, double prix, String img, int qte, Date dateAjout)

                e = new Article(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getDouble(4), rs.getString(5), rs.getInt(6),
                        rs.getDate(7));
            }
            return e;

        } catch (Exception e)
        {
            e.printStackTrace();
        }

        return null;
    }
    //henry 搜尋所有產品(方法) 並回傳 Vector資料型態 不帶參數
    public Vector<Article> findAll()
    {
        String req = "SELECT* " + " FROM article ";

        Vector<Article> vect = null;

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

                Article e = new Article(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getDouble(4), rs.getString(5), rs.getInt(6),
                        rs.getDate(7));

                vect.add(e);
            }

            return vect;
        } catch (Exception e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return null;
    }

    //henry 搜尋所有產品(方法) 並回傳 Vector資料型態  搜尋功能使用 (帶入搜尋關鍵字)
    public Vector<Article> findAll(String key)
    {
        String req = "SELECT* " + " FROM article WHERE libelle like '%"+key+"%'";

        Vector<Article> vect = null;

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

                Article e = new Article(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getDouble(4), rs.getString(5), rs.getInt(6),
                        rs.getDate(7));

                vect.add(e);
            }

            return vect;
        } catch (Exception e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return null;
    }

    //henry 搜尋產品(隨機) 帶入隨機數值
     public Vector<Article> findRandom(int nbMax)
    {
        String req = "SELECT* " + " FROM article ORDER BY RAND() LIMIT " + nbMax;

        Vector<Article> vect = null;

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

                Article e = new Article(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getDouble(4), rs.getString(5), rs.getInt(6),
                        rs.getDate(7));

                vect.add(e);
            }

            return vect;
        } catch (Exception e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return null;
    }



}
        
