/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Contracts.IEntity;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 *
 * @author lucim
 */
@Entity
@Table
@SequenceGenerator(name = "offer_seq", sequenceName = "offer_id_seq", allocationSize = 1)
public class Offer implements Serializable, IEntity {

    @Id
    @Column
    @GeneratedValue(generator = "offer_seq", strategy = GenerationType.SEQUENCE)
    private long id;
    private String code;
    private double discount;
    private long units;

    /**
     *
     * @return
     */
    @Override
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public long getUnits() {
        return units;
    }

    public void setUnits(long units) {
        this.units = units;
    }

}
