package com.learn.icinbank.dao;

import com.learn.icinbank.entities.SaveAcc;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class SaveAccDao {
    
    private SessionFactory factory;
    
    public SaveAccDao(SessionFactory factory){
    this.factory=factory;
    }
    
    public boolean saveSaveAcc(SaveAcc sh){
        boolean f=false;
        try{Session session=this.factory.openSession();
    Transaction tx = session.beginTransaction();
    session.save(sh);
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
    
    public List<SaveAcc> getSaveAcc()
{
    Session sa=this.factory.openSession();
    Query query = sa.createQuery("from SaveAcc");
    List<SaveAcc> list = query.list();
    return list;
}
    
}
