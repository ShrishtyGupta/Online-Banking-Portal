/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.icinbank.entities;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Trans {
   @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length = 10, name = "trans_id")
    private int transId;
   @Column(length = 10, name = "trans_Amt")
    private int transAmt;
    @Column( name = "trans_Date")
    private java.util.Date transDate;
    
    @Column(length = 100, name = "acc_tobank")
    private String accTobank;
     @Column(length = 100, name = "acc_toacc")
    private String accToacc;
    @ManyToOne
    private User transt;

    @Column(name="trans_status")
    private boolean transStatus;
    @Column(length = 100, name = "trans_name")
    private String transName;
     @Column(length = 100, name = "trans_ifsc")
    private String transIFSC;

    public Trans(int transId, int transAmt, Date transDate, String accTobank, String accToacc, User transt, boolean transStatus, String transName, String transIFSC) {
        this.transId = transId;
        this.transAmt = transAmt;
        this.transDate = transDate;
        this.accTobank = accTobank;
        this.accToacc = accToacc;
        this.transt = transt;
        this.transStatus = transStatus;
        this.transName=transName;
        this.transIFSC=transIFSC;
    }

    public Trans() {
    }

    public Trans(int transAmt, Date transDate, String accTobank, String accToacc, User transt, boolean transStatus, String transName, String transIFSC) {
        this.transAmt = transAmt;
        this.transDate = transDate;
        this.accTobank = accTobank;
        this.accToacc = accToacc;
        this.transt = transt;
        this.transStatus = transStatus;
        this.transName=transName;
        this.transIFSC=transIFSC;
    }

    public String getTransIFSC() {
        return transIFSC;
    }

    public void setTransIFSC(String transIFSC) {
        this.transIFSC = transIFSC;
    }

    public String getTransName() {
        return transName;
    }

    public void setTransName(String transName) {
        this.transName = transName;
    }

    public int getTransId() {
        return transId;
    }

    public void setTransId(int transId) {
        this.transId = transId;
    }

    public int getTransAmt() {
        return transAmt;
    }

    public void setTransAmt(int transAmt) {
        this.transAmt = transAmt;
    }

    public Date getTransDate() {
        return transDate;
    }

    public void setTransDate(Date transDate) {
        this.transDate = transDate;
    }

    public String getAccTobank() {
        return accTobank;
    }

    public void setAccTobank(String accTobank) {
        this.accTobank = accTobank;
    }

    public String getAccToacc() {
        return accToacc;
    }

    public void setAccToacc(String accToacc) {
        this.accToacc = accToacc;
    }

    public User getTranst() {
        return transt;
    }

    public void setTranst(User transt) {
        this.transt = transt;
    }

    public boolean isTransStatus() {
        return transStatus;
    }

    public void setTransStatus(boolean transStatus) {
        this.transStatus = transStatus;
    }

    @Override
    public String toString() {
        return "Trans{" + "transId=" + transId + ", transAmt=" + transAmt + ", transDate=" + transDate + ", accTobank=" + accTobank + ", accToacc=" + accToacc + ", transt=" + transt + ", transStatus=" + transStatus + ", transName=" + transName + ", transIFSC=" + transIFSC + '}';
    }

   

    

    
    
    
    
}
