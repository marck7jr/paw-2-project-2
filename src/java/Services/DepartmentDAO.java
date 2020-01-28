/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import Models.Department;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author lucim
 */
public class DepartmentDAO extends GenericDAO<Department> {
    
    public DepartmentDAO(){
        _type = Department.class;
    }

    @Override
    public List<Department> list() {
        EntityManager entityManager = _entityManagerFactory.createEntityManager();
        Query query = entityManager.createQuery("select e from Department as e");
        return query.getResultList();
    }
    
}
