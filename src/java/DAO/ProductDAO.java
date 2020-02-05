/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import Models.Product;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author lucim
 */
public class ProductDAO extends GenericDAO<Product> {
    
    public ProductDAO(){
        _type = Product.class;
    }

    @Override
    public List<Product> list() {
        EntityManager entityManager = _entityManagerFactory.createEntityManager();
        Query query = entityManager.createQuery("select e from Product as e");
        return query.getResultList();
    }
    
}
