/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import Models.Offer;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author lucim
 */
public class OfferDAO extends GenericDAO<Offer> {
    
    public OfferDAO(){
        _type = Offer.class;
    }

    @Override
    public List<Offer> list() {
        EntityManager entityManager = _entityManagerFactory.createEntityManager();
        Query query = entityManager.createQuery("select e from Offer as e");
        return query.getResultList();
    }
    
}
