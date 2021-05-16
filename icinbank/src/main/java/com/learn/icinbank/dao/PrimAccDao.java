
package com.learn.icinbank.dao;


import com.learn.icinbank.entities.PrimAcc;

import com.learn.icinbank.entities.User;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


public class PrimAccDao {
    
    
    private SessionFactory factory;
    
    public PrimAccDao(SessionFactory factory){
    this.factory=factory;
    }
    
    
   
    
    public boolean savePrimAcc(PrimAcc ch){
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
    
    public List<PrimAcc> getPrimAcc()
{
    Session pa=this.factory.openSession();
    Query query = pa.createQuery("from PrimAcc");
    List<PrimAcc> list = query.list();
    return list;
}
    
}
