/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Commande;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

/**
 *
 * @author Walid
 */
public class CommandeDao
{

    Connection con = DBConnexion.getInstance();

    public boolean add(Commande a,String address,String phone_number)
    {
        try
        {   //vince 建立訂單時可以把當下時間顯示出來並寫入DB裡
            java.util.Date now = new java.util.Date();
            java.sql.Timestamp sqlDate = new java.sql.Timestamp(now.getTime());

            
            String req = "INSERT INTO wshop.commande (login,datecmd, prixtotale,address,phone_number) "
                    + "VALUES ('"+a.getLogin()+"', '"+sqlDate+"', '"+a.getPrixTotale()+"', '"+address+"', '"+phone_number+"');";
            
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

    public boolean remove(int idCmd)
    {
        try
        {
            String req = "DELETE FROM commande " + "WHERE idcommande = " + idCmd;

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

    public boolean validerCommande(int idCommande)
    {
        try
        {
            String req = "UPDATE `wshop`.`commande` SET "
                    + "`etat`='1' "
                    + "WHERE `idcommande`='"+idCommande+"';";

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

     public boolean refuserCommande(int idCommande)
    {
        try
        {
            String req = "UPDATE `wshop`.`commande` SET "
                    + "`etat`='2' "
                    + "WHERE `idcommande`='"+idCommande+"';";

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

//     orcarex 根據帳號名稱搜尋訂單
    public Vector<Commande> findByLogin(String login)
    {
        String req = "SELECT* " + " FROM commande WHERE login like '%" +login+"%'";

        Vector<Commande> vect = null;

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

                Commande e = new Commande(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDouble(4), rs.getInt(5),
					  rs.getString(6),rs.getString(7));
                

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
    
    public Vector<Commande> findAll()
    {
        String req = "SELECT* " + " FROM commande ";

        Vector<Commande> vect = null;

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

                Commande e = new Commande(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDouble(4), rs.getInt(5),
					  rs.getString(6),rs.getString(7));
                

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


    
    public int getLastID()
    {
        String req = "SELECT max(idcommande) FROM commande ";

        try
        {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(req);

            if (rs.next())
            {
                return rs.getInt(1);
            }

        } catch (Exception e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return -1;
    }

    
    public Vector<Commande> findEnAttente()
    {
        String req = "SELECT* " + " FROM commande ";

        Vector<Commande> vect = null;

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

                Commande e = new Commande(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDouble(4), rs.getInt(5),
					  rs.getString(6),rs.getString(7));
                

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
    
    //orcarex 搜尋用 根據用戶帳號搜尋訂單資訊
    public Vector<Commande> findEnAttente(String key)
    {
        String req = "SELECT * " + " FROM commande where login like '%"+key+"%'";

        Vector<Commande> vect = null;

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

                Commande e = new Commande(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDouble(4), rs.getInt(5),
					  rs.getString(6),rs.getString(7));
                

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
    public Vector<Commande> findEnAttente(String key,int state)
    {
        String req = "SELECT* " + " FROM commande where etat"+state+" intersept select * from commande where login like'%"+key+"'";

        Vector<Commande> vect = null;

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

                Commande e = new Commande(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDouble(4), rs.getInt(5),
					  rs.getString(6),rs.getString(7));
                

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
    
    public Vector<Commande> findEnAttente(int state)
    {
        String req = "SELECT* " + " FROM commande where etat="+state;

        Vector<Commande> vect = null;

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

                Commande e = new Commande(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDouble(4), rs.getInt(5),
					  rs.getString(6),rs.getString(7));
                

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
    //vince 透過訂單編號搜尋客戶訂單
    public Vector<Commande> findByIdCommande(int id)
    {
        String req = "SELECT* " + " FROM commande WHERE idcommande=" +id;

        Vector<Commande> vect = null;

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

                Commande e = new Commande(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDouble(4), rs.getInt(5),
					  rs.getString(6),rs.getString(7));
                

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
