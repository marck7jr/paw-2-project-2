/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Contracts.IDAO;
import Contracts.IEntity;
import java.io.Serializable;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author lucim
 * @param <T>
 */
public abstract class GenericDAO<T extends IEntity & Serializable> implements IDAO<T> {

    /**
     *
     */
    protected Class<T> _type;

    /**
     *
     */
    @Inject
    protected EntityManagerFactory _entityManagerFactory;

    @Override
    public void save(T t) {
        EntityManager entityManager = _entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        if (t.getId() > 0) {
            entityManager.merge(t);
        } else {
            entityManager.persist(t);
        }
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @Override
    public void delete(T t) {
        EntityManager entityManager = _entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        if (!entityManager.contains(t)) {
            t = entityManager.merge(t);
        }
        entityManager.remove(t);
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @Override
    public T find(long id) {
        EntityManager entityManager = _entityManagerFactory.createEntityManager();
        return entityManager.find(_type, id);
    }
}
