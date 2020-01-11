package org.ftd.educational.mytask.persistence.daos;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import org.ftd.educational.mytask.persistence.entities.BacklogItemStatus;
import org.ftd.educational.mytask.persistence.entities.ProjectStatus;


/**
 *
 * @author Fabio Tavares Dippold
 * 
 */
public class BacklogItemStatusDAO extends BacklogItemStatusJpaController {

    private static final long serialVersionUID = -6280113188589378295L;

    public BacklogItemStatusDAO(EntityManagerFactory emf) {
        super(emf);
    }

    public BacklogItemStatus find(Long id) {
        return  super.findBacklogItemStatus(id);
    }    
    
    public BacklogItemStatus findByName(Long companyId, String name) throws NoResultException {
        EntityManager em = getEntityManager();
        try {
            return (BacklogItemStatus) em.createNamedQuery("BacklogItemStatus.find.by.name")
                    .setParameter("id", companyId)
                    .setParameter("name", name)
                    .getSingleResult();
        } finally {
            em.close();
        }
    }    
    
    public List<BacklogItemStatus> findAllByCompany(Long companyId) {
        EntityManager em = getEntityManager();
        try {
            Query q = em.createNamedQuery("BacklogItemStatus.find.all");
            q.setParameter("id", companyId);
            return q.getResultList();
        } finally {
            em.close();
        }
    }    
    
}
