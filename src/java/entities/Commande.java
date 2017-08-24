/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.util.Date;

/**
 *
 * @author Walid
 */
public class Commande
{
    private int idCommande ;
    private String login ;
    private Date dateCmd ;
    private double prixTotale ;
    private String address;
    private String phone_number;
    private int etat ;

    public Commande(int idCommande, String login, Date dateCmd, double prixTotale, int etat,String address,String phone_number)
    {
        this.idCommande = idCommande;
        this.login = login;
        this.dateCmd = dateCmd;
        this.prixTotale = prixTotale;
        this.etat = etat;
        this.address = address;
        this.phone_number = phone_number;
    }

    public Commande(String login, double prixTotale)
    {
        this.login = login;
        this.dateCmd = dateCmd;
        this.prixTotale = prixTotale;
        this.etat = etat;
        this.address = address;
        this.phone_number = phone_number;
    }

    
    
    public int getIdCommande()
    {
        return idCommande;
    }

    public String getLogin()
    {
        return login;
    }

    public Date getDateCmd()
    {
        return dateCmd;
    }

    public double getPrixTotale()
    {
        return prixTotale;
    }
  
    public int getEtat()
    {
        return etat;
    }
      public String getaddress()
    {
        return address;
    }         
   public String getphone_number()
    {
        return phone_number;
    }         

    public void setIdCommande(int idCommande)
    {
        this.idCommande = idCommande;
    }

    public void setLogin(String login)
    {
        this.login = login;
    }

    public void setDateCmd(Date dateCmd)
    {
        this.dateCmd = dateCmd;
    }

    public void setPrixTotale(double prixTotale)
    {
        this.prixTotale = prixTotale;
    }

    public void setEtat(int etat)
    {
        this.etat = etat;
    }
       public void setaddress(String address)
    {
        this.address = address;
    }         
       
   public void setphone_number(String phone_number)
    {
        this.phone_number =phone_number;
    }         
    
    
    
}
