/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import CDI.DataAccessObject;
import Models.Cart;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author lucim
 */
@DataAccessObject
public class CartDAO extends GenericDAO<Cart> {

    public CartDAO() {
        _type = Cart.class;
    }

    @Override
    public List<Cart> list() {
        EntityManager entityManager = _entityManagerFactory.createEntityManager();
        Query query = entityManager.createQuery("select e from Cart as e");
        return query.getResultList();
    }

}
