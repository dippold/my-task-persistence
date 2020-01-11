package org.ftd.educational.mytask.persistence.daos;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import org.ftd.educational.mytask.persistence.entities.User;



/**
 *
 * @author Fabio Tavares Dippold
 * @version 2018-05-17 - 2.0.0
 * 
 */
public class UserDAO extends UserJpaController {

    private static final long serialVersionUID = -6826496889996209566L;

    public UserDAO(EntityManagerFactory emf) {
        super(emf);
    }

    public User find(Long id) {
        return super.findUser(id);
    }    
    
    public User findUserByName(Long companyId, String name) throws NoResultException {
        EntityManager em = getEntityManager();
        try {
            return (User) em.createNamedQuery("User.find.by.name")
                    .setParameter("id", companyId)
                    .setParameter("name", name)
                    .getSingleResult();
        } finally {
            em.close();
        }
    }    
    
    public User findUserByEmail(String email) throws NoResultException {
        EntityManager em = getEntityManager();
        try {
            return (User) em.createNamedQuery("User.find.by.email")
                    .setParameter("email", email)
                    .getSingleResult();
        } finally {
            em.close();
        }
    }   

    public List<User> findAllByCompany(Long companyId) {
        EntityManager em = getEntityManager();
        try {
            Query q = em.createNamedQuery("User.find.by.company");
            q.setParameter("companyId", companyId);
            return q.getResultList();
        } finally {
            em.close();
        }
    }
    
    public List<User> findAll() {
        return super.findUserEntities();
    }
  
}
