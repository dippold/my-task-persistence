package org.ftd.educational.mytask.persistence.daos;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import org.ftd.educational.mytask.persistence.entities.Passwd;

/**
 *
 * @author Fabio Tavares Dippold
 * @version 2018-06-13 - 1.0.0
 * 
 */
public class PasswdDAO extends PasswdJpaController {

    private static final long serialVersionUID = 2569126490823921035L;
    
    public PasswdDAO(EntityManagerFactory emf) {
        super(emf);
    }
    
    public Passwd findByUser(Long userId) throws NoResultException {
        EntityManager em = getEntityManager();
        try {
            return (Passwd) em.createNamedQuery("Passwd.find.by.user")
                    .setParameter("userId", userId)
                    .setParameter("passwdStatusId", 1L)
                    .getSingleResult();
        } finally {
            em.close();
        }
    }    
    
    public List<Passwd> findAllByUser(Long userId) {
        EntityManager em = getEntityManager();
        try {
            Query q = em.createNamedQuery("Passwd.find.all.by.user");
            q.setParameter("userId", userId);
            return q.getResultList();
        } finally {
            em.close();
        }
    }    
    
}
