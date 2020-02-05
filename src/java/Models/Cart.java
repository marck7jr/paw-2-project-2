/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Contracts.IEntity;
import java.io.Serializable;
import java.util.ArrayList;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 *
 * @author lucim
 */
@Entity
@Table
@SequenceGenerator(name = "cart_seq", sequenceName = "cart_id_seq", allocationSize = 1)
public class Cart implements Serializable, IEntity {
    @Id
    @Column
    @GeneratedValue(generator = "cart_seq", strategy = GenerationType.SEQUENCE)
    private long id;
    @OneToOne
    private Account account;
    @OneToMany(targetEntity = Item.class)
    private ArrayList<Item> items;
    @OneToOne
    private Offer offer;
    
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

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public ArrayList<Item> getItems() {
        return items;
    }

    public void setItems(ArrayList<Item> products) {
        this.items = products;
    }

    public Offer getOffer() {
        return offer;
    }

    public void setOffer(Offer offer) {
        this.offer = offer;
    }
}
