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
//henry 產品類
public class Article
{   
    //henry 產品id (對應資料表 article中的idArticle欄位) 
    private int idArticle ;
    //henry 產品名稱   (對應資料表 article中的libelle欄位) 
    private String libelle ;
    //henry 產品描述   (對應資料表 article中的desc欄位) 
    private String desc ;
    //henry 產品價格   (對應資料表 article中的prix欄位) 
    private double prix ; 
    //henry 產品圖片(路徑與圖片名)   (對應資料表 article中的img欄位) 
    private String img ;
    //henry 產品數量   (對應資料表 article中的qte欄位) 
    private int qte ;
    //henry 產品新增日期   (對應資料表 article中的dateAjout欄位) 
    private Date dateAjout ;
    //henry 建構式 (無參數)
    public Article()
    {
    }
    //henry 建構式 (需傳入4個形參產品名稱,描述,價格,圖片,數量)
    public Article(String libelle, String desc, double prix, String img, int qte)
    {
        this.libelle = libelle;
        this.desc = desc;
        this.prix = prix;
        this.img = img;
        this.qte = qte;
    }

    
    
    //henry 建構式 (需傳入7個形參:編號,產品名稱,描述,價格,圖片,數量,日期)
    public Article(int idArticle, String libelle, String desc, double prix, String img, int qte, Date dateAjout)
    {
        this.idArticle = idArticle;
        this.libelle = libelle;
        this.desc = desc;
        this.prix = prix;
        this.img = img;
        this.qte = qte;
        this.dateAjout = dateAjout;
    }

    
    //henry 取得產品id
    public int getIdArticle()
    {
        return idArticle;
    }
    //henry 取得產品名稱
    public String getLibelle()
    {
        return libelle;
    }
    //henry 取得產品描述
    public String getDesc()
    {
        return desc;
    }
    //henry 取得產品價格
    public double getPrix()
    {
        return prix;
    }
    //henry 取得產品圖片
    public String getImg()
    {
        return img;
    }
    //henry 取的產品數量
    public int getQte()
    {
        return qte;
    }
    //henry 取得產品新增日期
    public Date getDateAjout()
    {
        return dateAjout;
    }
    //henry 設定產品id
    public void setIdArticle(int idArticle)
    {
        this.idArticle = idArticle;
    }
    //henry 設定產品名稱
    public void setLibelle(String libelle)
    {
        this.libelle = libelle;
    }
    //henry 設定產品描述
    public void setDesc(String desc)
    {
        this.desc = desc;
    }
    //henry 設定產品價格
    public void setPrix(double prix)
    {
        this.prix = prix;
    }
    //henry 設定產品圖片
    public void setImg(String img)
    {
        this.img = img;
    }
    //henry 設定產品數量
    public void setQte(int qte)
    {
        this.qte = qte;
    }
    //henry 設定產品新增日期
    public void setDateAjout(Date dateAjout)
    {
        this.dateAjout = dateAjout;
    }
    //henry 覆寫java原生方法 toString() 並回傳格式化產品字串
    @Override
    public String toString()
    {
        return "Article{" + "idArticle=" + idArticle + ", libelle=" + libelle + ", desc=" + desc + ", prix=" + prix + ", img=" + img + ", qte=" + qte + ", dateAjout=" + dateAjout + '}';
    }
    
    
    
}
