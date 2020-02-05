/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CDI;

import javax.enterprise.inject.Produces;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author lucim
 */
public class Utils {
    @Produces
    public EntityManagerFactory producesEntityManagerFactory(){
        return Persistence.createEntityManagerFactory("pawPU");
    }
}
