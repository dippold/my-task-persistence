package org.ftd.educational.mytask.persistence.daos;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import org.ftd.educational.mytask.persistence.entities.UserStatus;


/**
 *
 * @author Fabio Tavares Dippold
 * 
 */
public class UserStatusDAO extends UserStatusJpaController {

    private static final long serialVersionUID = -8727414887498914839L;

    public UserStatusDAO(EntityManagerFactory emf) {
        super(emf);
    }

    public UserStatus find(Long id) {
        return  super.findUserStatus(id);
    }    
    
    public UserStatus findByName(String name) throws NoResultException {
        EntityManager em = getEntityManager();
        try {
            return (UserStatus) em.createNamedQuery("UserStatus.findby.name")
                    .setParameter("name", name)
                    .getSingleResult();
        } finally {
            em.close();
        }
    }        
    
    public List<UserStatus> findAll() {
        return super.findUserStatusEntities();
    }
    
}
