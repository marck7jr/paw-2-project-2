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
@SequenceGenerator(name = "department_seq", sequenceName = "department_id_seq", allocationSize = 1)
public class Department implements Serializable, IEntity {
    @Id
    @Column
    @GeneratedValue(generator = "department_seq", strategy = GenerationType.SEQUENCE)
    private long id;
    @Column(unique = true)
    private String name;
    
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
}
