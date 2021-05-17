/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.icinbank.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Cheq {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length = 10, name = "cheq_id")
    private int cheqId;
   @Column(name="cheq_status")
    private int cheqStatus;
    @ManyToOne
    private User cheqt;
    @Column(name="cheq_add")
    private String cheqAdd;
    @Column(name="cheq_connum")
    private String cheqConnum;

    public Cheq(int cheqId, int cheqStatus, User cheqt,String cheqAdd) {
        this.cheqId = cheqId;
        this.cheqStatus = cheqStatus;
        this.cheqt = cheqt;
         this.cheqAdd = cheqAdd;
    }

    public Cheq() {
    }

    public Cheq(int cheqStatus, User cheqt,String cheqAdd) {
        this.cheqStatus = cheqStatus;
        this.cheqt = cheqt;
        this.cheqAdd = cheqAdd;
    }

    public String getCheqConnum() {
        return cheqConnum;
    }

    public Cheq(int cheqStatus, User cheqt, String cheqAdd, String cheqConnum) {
        this.cheqStatus = cheqStatus;
        this.cheqt = cheqt;
        this.cheqAdd = cheqAdd;
        this.cheqConnum = cheqConnum;
    }

    public void setCheqConnum(String cheqConnum) {
        this.cheqConnum = cheqConnum;
    }

    public Cheq(int cheqId, int cheqStatus, User cheqt, String cheqAdd, String cheqConnum) {
        this.cheqId = cheqId;
        this.cheqStatus = cheqStatus;
        this.cheqt = cheqt;
        this.cheqAdd = cheqAdd;
        this.cheqConnum = cheqConnum;
    }

    public String getCheqAdd() {
        return cheqAdd;
    }

    public void setCheqAdd(String cheqAdd) {
        this.cheqAdd = cheqAdd;
    }

    public int getCheqId() {
        return cheqId;
    }

    public void setCheqId(int cheqId) {
        this.cheqId = cheqId;
    }

    public int getCheqStatus() {
        return cheqStatus;
    }

    public void setCheqStatus(int cheqStatus) {
        this.cheqStatus = cheqStatus;
    }

    

    public User getCheqt() {
        return cheqt;
    }

    public void setCheqt(User cheqt) {
        this.cheqt = cheqt;
    }

    @Override
    public String toString() {
        return "Cheq{" + "cheqId=" + cheqId + ", cheqStatus=" + cheqStatus + ", cheqt=" + cheqt + ", cheqAdd=" + cheqAdd + ", cheqConnum=" + cheqConnum + '}';
    }

  

    
    

    
    
    
    
}
