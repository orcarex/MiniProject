/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author h
 */
//henry 訪客留言類
public class Msg {
    int msgGuestId;
    String msgGuestName;
    String guestGuestEmail;
    String guestGuestMsgContent;
    //henry 建構式 (無參數)
    public Msg()
    {
    }
    public Msg(int msgGuestId, String msgGuestName, String guestGuestEmail, String guestGuestMsgContent) {
        this.msgGuestId = msgGuestId;
        this.msgGuestName = msgGuestName;
        this.guestGuestEmail = guestGuestEmail;
        this.guestGuestMsgContent = guestGuestMsgContent;
    }
    //henry 新增訪客留言
    public Msg( String msgGuestName, String guestGuestEmail, String guestGuestMsgContent) {
        this.msgGuestName = msgGuestName;
        this.guestGuestEmail = guestGuestEmail;
        this.guestGuestMsgContent = guestGuestMsgContent;
    }
    
    public int getMsgGuestId() {
        return msgGuestId;
    }

    public void setMsgGuestId(int msgGuestId) {
        this.msgGuestId = msgGuestId;
    }

    public String getMsgGuestName() {
        return msgGuestName;
    }

    public void setMsgGuestName(String msgGuestName) {
        this.msgGuestName = msgGuestName;
    }

    public String getGuestGuestEmail() {
        return guestGuestEmail;
    }

    public void setGuestGuestEmail(String guestGuestEmail) {
        this.guestGuestEmail = guestGuestEmail;
    }

    public String getGuestGuestMsgContent() {
        return guestGuestMsgContent;
    }

    public void setGuestGuestMsgContent(String guestGuestMsgContent) {
        this.guestGuestMsgContent = guestGuestMsgContent;
    }
    
   
    
}
