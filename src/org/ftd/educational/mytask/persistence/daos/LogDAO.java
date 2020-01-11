package org.ftd.educational.mytask.persistence.daos;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import org.ftd.educational.mytask.persistence.daos.exceptions.NonexistentEntityException;
import org.ftd.educational.mytask.persistence.entities.Log;


/**
 *
 * @author Fabio Tavares Dippold
 * 
 */
public class LogDAO extends LogJpaController {

    public LogDAO(EntityManagerFactory emf) {
        super(emf);
    }    
    
    public List<Log> findAll(Long companyId) {
        EntityManager em = getEntityManager();
        try {
            Query q = em.createNamedQuery("Log.find.all");
            q.setParameter("id", companyId);
            return q.getResultList();
        } finally {
            em.close();
        }
    }    

    public void removeAll(Long companyId) throws NonexistentEntityException {
        List<Log> logs = this.findAll(companyId);
        for (Log o:logs) {
            super.destroy(o.getId());
        }
    }    
    
}
