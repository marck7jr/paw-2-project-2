/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contracts;

import java.util.List;

/**
 *
 * @author lucim
 * @param <T>
 */
public interface IDAO<T> {

    void save(T t);

    void delete(T t);

    T find(long id);

    List<T> list();
}
