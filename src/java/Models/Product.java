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
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 *
 * @author lucim
 */
@Entity
@Table
@SequenceGenerator(name = "product_seq", sequenceName = "product_id_seq", allocationSize = 1)
public class Product implements Serializable, IEntity {
    @Id
    @Column
    @GeneratedValue(generator = "product_seq", strategy = GenerationType.SEQUENCE)
    private long id;
    private String name;
    private double price;
    private long units;
    @OneToOne(targetEntity = Department.class)
    private Department department;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public long getUnits() {
        return units;
    }

    public void setUnits(long units) {
        this.units = units;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }
}
