/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import Models.Item;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author lucim
 */
public class ItemDAO extends GenericDAO<Item> {

    public ItemDAO() {
        _type = Item.class;
    }

    @Override
    public List<Item> list() {
        EntityManager entityManager = _entityManagerFactory.createEntityManager();
        Query query = entityManager.createQuery("select e from Item as e");
        return query.getResultList();
    }

}
