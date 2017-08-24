package panier;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Walid
 */
//henry 引入商品類
import entities.Article;
import java.util.ArrayList;
import java.util.Collections;
//henry 購物車類與產品的中間控制類
public class Panier
{
    //henry 宣告泛型List 資料型態為 購物車實體
    ArrayList<LignePanier> lignesPanier;
    //henry 建構式
    public Panier()
    {
        //henry 建立List實體 (LignePanier)
        lignesPanier = new ArrayList<LignePanier>();
    }
    //henry 覆寫java原生方法toString() 回傳購物車資料(字串) return s
    @Override
    public String toString()
    {
        String s = "Panier : \n";
        for (LignePanier l : lignesPanier)
        {
            s += l.toString() + "\n";
        }

        return s;

    }

    
    //henry 購物車新增 +1
    public void addArticle(Article art)
    {
        for (LignePanier lignePanier : lignesPanier)
        {
            if (lignePanier.getArticle().getIdArticle() == art.getIdArticle())
            {
                lignePanier.setQuantite(lignePanier.getQuantite() + 1);
                return;
            }
        }
        //henry 新增產品到購物車並新增各產品在購物車中的數量
        lignesPanier.add(new LignePanier(art, 1));
    }
    //henry 購物車減少產品 -1
    public void sousArticle(Article art)
    {
        for (LignePanier lignePanier : lignesPanier)
        {
            if (lignePanier.getArticle().getIdArticle() == art.getIdArticle())
            {
                if (lignePanier.getQuantite() > 1)
                {
                    lignePanier.setQuantite(lignePanier.getQuantite() - 1);
                } else
                {
                    lignesPanier.remove(lignePanier);
                    return ;
                }
            }
        }


    }
    //henry 取得目前購物車中的產品數量
    public int getNumberArticle()
    {
        return lignesPanier.size();
    }
    //henry 取得目前購物車明細
    public ArrayList<LignePanier> getLignesPanier()
    {
        return lignesPanier;
    }
    //henry 移除目前購物車中的特定產品
    public void removeArticle(Article art)
    {
        for (LignePanier lignePanier : lignesPanier)
        {
            if (lignePanier.getArticle().getIdArticle() == art.getIdArticle())
            {
                lignesPanier.remove(lignePanier);
                return ;
            }
        }

    }
    //henry 清空購物車
    public void vider()
    {
        try
        {

            while (lignesPanier.get(0) != null)
            {
                lignesPanier.remove(lignesPanier.get(0));
            }

        } catch (Exception e)
        {
        }
               
    }
    
    public void directBuyArticle(Article art,int qte)
    {
        for (LignePanier lignePanier : lignesPanier)
        {
            if (lignePanier.getArticle().getIdArticle() == art.getIdArticle())
            {
                lignePanier.setQuantite(lignePanier.getQuantite() + qte);
                return;
            }
        }
        //henry 新增產品到購物車並新增各產品在購物車中的數量
        lignesPanier.add(new LignePanier(art, qte));
    }
    
    
}
