/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.icinbank.dao;

import com.learn.icinbank.entities.Trans;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


public class ReqMDao {
    private SessionFactory factory;
    
    public ReqMDao(SessionFactory factory){
    this.factory=factory;
    }
    
    public boolean saveTrans(Trans ch){
        boolean f=false;
        try{Session session=this.factory.openSession();
    Transaction tx = session.beginTransaction();
    session.save(ch);
    tx.commit();
    session.close();
f=true;
    
    
    }
catch (Exception e) {
                e.printStackTrace();
                f=false;
             
            } 
        return f;
}
    
    public List<Trans> getAllTrans()
{
    Session t=this.factory.openSession();
    Query query = t.createQuery("from Trans");
    List<Trans> list = query.list();
    return list;
}
    
}
