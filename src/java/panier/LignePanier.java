package panier;

//henry 引入產品類
import entities.Article;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Walid
 */
//henry 購物車類
public class LignePanier
{
        //henry 宣告產品變數 Article
        private Article article;
        //henry 宣告產品數量變數 quantite
        private int quantite;
        //henry 建構式 LignePanier 並預設定義 型式參數 art(產品) qte(數量) 
        public LignePanier(Article art, int qte) 
        {    
                this.article = art;
                this.quantite = qte;
        }
        //henry 取得產品(方法)
        public Article getArticle() {
                return article;
        }
        //henry 賦予產品(方法)
        public void setArticle(Article article) {
                this.article = article;
        }
        //henry 取得產品數量(方法)
        public int getQuantite() {
                return quantite;
        }
        //henry 設置產品數量(方法)
        public void setQuantite(int quantite) {
                this.quantite = quantite;
        }
        //henry 覆寫java原生方法 equals()
        @Override
        public boolean equals(Object arg0) 
        {
                //henry 判斷購物車數量是否與目前產品數量相等
                if(arg0 instanceof LignePanier){
                        if(this.article.equals(((LignePanier) arg0).article) && this.quantite ==((LignePanier) arg0).quantite)
                                return true;
                        else
                                return false;
                }else
                        return false;
        }
        //henry 覆寫java原生方法 hashCode()
        @Override
        public int hashCode() 
        {
                return article.hashCode();
        }
        //henry 覆寫java原生方法 toString()
        @Override
        public String toString() {
                return "LigneCommande : "+article.toString()+" | "+this.quantite;
        }



}

