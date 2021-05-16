package com.learn.icinbank.dao;

import com.learn.icinbank.entities.Cheq;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


public class ReqCheqDao {
    private SessionFactory factory;
    
    public ReqCheqDao(SessionFactory factory){
    this.factory=factory;
    }
    
    public boolean saveCheq(Cheq ch){
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

public List<Cheq> getAllCheq()
{
    Session s=this.factory.openSession();
    Query query = s.createQuery("from Cheq");
    List<Cheq> list = query.list();
    return list;
}


}

























