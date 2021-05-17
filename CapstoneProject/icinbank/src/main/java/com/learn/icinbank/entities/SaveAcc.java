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
public class SaveAcc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length = 10, name = "sacc_id")
    private int saccId;
   @Column(length = 10, name = "sacc_bal")
    private int saccBal;
    @ManyToOne
    private User sacct;

    @Column(name="sacc_status")
    private int saccStatus;

    public SaveAcc(int saccId, int saccBal, User sacct, int saccStatus) {
        this.saccId = saccId;
        this.saccBal = saccBal;
        this.sacct = sacct;
        this.saccStatus = saccStatus;
    }

    public SaveAcc(int saccBal, User sacct, int saccStatus) {
        this.saccBal = saccBal;
        this.sacct = sacct;
        this.saccStatus = saccStatus;
    }

    public SaveAcc() {
    }

    

    public int getSaccId() {
        return saccId;
    }

    public void setSaccId(int saccId) {
        this.saccId = saccId;
    }

    public int getSaccBal() {
        return saccBal;
    }

    public void setSaccBal(int saccBal) {
        this.saccBal = saccBal;
    }

    public User getSacct() {
        return sacct;
    }

    public void setSacct(User sacct) {
        this.sacct = sacct;
    }

    public int getSaccStatus() {
        return saccStatus;
    }

    public void setSaccStatus(int saccStatus) {
        this.saccStatus = saccStatus;
    }

    @Override
    public String toString() {
        return "PrimAcc{" + "saccId=" + saccId + ", saccBal=" + saccBal + ", sacct=" + sacct + ", saccStatus=" + saccStatus + '}';
    }

    

    
}
