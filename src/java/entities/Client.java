/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.util.Date;
import java.util.Objects;
import java.util.logging.Logger;

/**
 *
 * @author Walid
 */
//henry會員類
public class Client
{
  //henry 登入帳號
  private String login ;
  //henry 登入密碼
  private String mdp ;
  //henry 會員姓
  private String nom ;
  //henry 會員名
  private String prenom ;
  //henry 註冊日期
  private Date dtNaissance;
  //henry 狀態
  private int etat;
  //vince 連絡地址
  private String address;
  //vince 連絡電話
  private String phone_number;
    //henry 建構式(無參)
    public Client()
    {
    }
    //henry 建構式(傳入參數:帳號,密碼,姓,名,生日)
    public Client(String login, String mdp, String nom, String prenom, Date dtNaissance)
    {
        this.login = login;
        this.mdp = mdp;
        this.nom = nom;
        this.prenom = prenom;
        this.dtNaissance = dtNaissance;
    }

    //henry 建構式(傳入參數:帳號,密碼,名,姓,生日,狀態)
          public Client(String login, String mdp, String nom, String prenom, Date dtNaissance,int etat)
    {
        this.login = login;
        this.mdp = mdp;
        this.nom = nom;
        this.prenom = prenom;
        this.dtNaissance = dtNaissance;
        this.etat=etat;
    }
          public Client(String login, String mdp, String nom, String prenom, Date dtNaissance,String phone_number,String address)
    {
        this.login = login;
        this.mdp = mdp;
        this.nom = nom;
        this.prenom = prenom;
        this.dtNaissance = dtNaissance;
        this.etat=etat;
        this.phone_number = phone_number;
        this.address = address;
    }

    //henry 取得狀態      
    public int getEtat()
    {
        return etat;
    }
    //henry 設定狀態   
    public void setEtat(int etat)
    {
        this.etat = etat;
    }

    
    //henry 取得帳號
    public String getLogin()
    {
        return login;
    }
    //henry 取得密碼
    public String getMdp()
    {
        return mdp;
    }
    //henry 取得名
    public String getNom()
    {
        return nom;
    }
    //henry 取得姓
    public String getPrenom()
    {
        return prenom;
    }
    //henry 取得註冊日期
    public Date getDtNaissance()
    {
        return dtNaissance;
    }
     public String getaddress()
    {
        return address;
    }         
    public String getphone_number()
    {
        return phone_number;
    }
    //henry 設定帳號
    public void setLogin(String login)
    {
        this.login = login;
    }
    //henry 設定密碼
    public void setMdp(String mdp)
    {
        this.mdp = mdp;
    }
    //henry 設定名
    public void setNom(String nom)
    {
        this.nom = nom;
    }
    //henry 設定姓
    public void setPrenom(String prenom)
    {
        this.prenom = prenom;
    }
    //henry 設定生日
    public void setDtNaissance(Date dtNaissance)
    {
        this.dtNaissance = dtNaissance;
    }
    public void setaddress(String address)
    {
        this.address = address;
    }         
       
    public void setphone_number(String phone_number)
    {
        this.phone_number =phone_number;
    }  
    //henry 覆寫java原生方法 設定帳號密碼加密並回傳
    @Override
    public int hashCode()
    {
        int hash = 7;
        hash = 83 * hash + Objects.hashCode(this.login);
        hash = 83 * hash + Objects.hashCode(this.mdp);
        return hash;
    }
    //henry 覆寫java原生方法 判斷帳號密碼是否正確
    @Override
    public boolean equals(Object obj)
    {
        if (obj == null)
        {
            return false;
        }
        if (getClass() != obj.getClass())
        {
            return false;
        }
        final Client other = (Client) obj;
        if (!Objects.equals(this.login, other.login))
        {
            return false;
        }
        if (!Objects.equals(this.mdp, other.mdp))
        {
            return false;
        }
        return true;
    }
    //henry 覆寫java原生方法 回傳格式化字串
    @Override
    public String toString()
    {
        return "Client{" + "login=" + login + ", mdp=" + mdp + ", nom=" + nom + ", prenom=" + prenom + ", dtNaissance=" + dtNaissance + '}';
    }
  
    
    
}
