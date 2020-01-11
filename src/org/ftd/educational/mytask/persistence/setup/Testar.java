/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.ftd.educational.mytask.persistence.setup;

import java.util.List;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import org.ftd.educational.mytask.persistence.daos.UserDAO;
import org.ftd.educational.mytask.persistence.entities.User;

/**
 *
 * @author fdippold
 */
public class Testar {

    public static final String PERSISTENCE_UNIT = "my-task-PU";

    public static void main(String[] args) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
        UserDAO dao = new UserDAO(factory);
        List<User> lst = dao.findAll();
        
        for (User o:lst) {
            System.out.println(o);
        }
        
        
    }
}
