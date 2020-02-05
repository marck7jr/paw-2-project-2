/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import Annotations.DataAccessObject;
import Models.Account;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author lucim
 */
@DataAccessObject
public class AccountDAO extends GenericDAO<Account> {
    
    public AccountDAO(){
        _type = Account.class;
    }
    
    @Override
    public List<Account> list() {
        EntityManager entityManager = _entityManagerFactory.createEntityManager();
        Query query = entityManager.createQuery("select e from Account as e");
        return query.getResultList();
    }
}
