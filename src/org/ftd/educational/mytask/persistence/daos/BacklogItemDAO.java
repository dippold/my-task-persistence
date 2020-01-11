package org.ftd.educational.mytask.persistence.daos;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import org.ftd.educational.mytask.persistence.entities.BacklogItem;



/**
 *
 * @author Fabio Tavares Dippold
 * @version 2018-06-22 - 2.0.0
 * 
 */
public class BacklogItemDAO extends BacklogItemJpaController {

    private static final long serialVersionUID = -4935688879996705123L;


    public BacklogItemDAO(EntityManagerFactory emf) {
        super(emf);
    }

    public BacklogItem find(Long id) {
        return super.findBacklogItem(id);
    }    
    
    public BacklogItem findUserByName(Long companyId, String name) throws NoResultException {
        EntityManager em = getEntityManager();
        try {
            return (BacklogItem) em.createNamedQuery("BacklogItem.find.by.name")
                    .setParameter("companyId", companyId)
                    .setParameter("name", name)
                    .getSingleResult();
        } finally {
            em.close();
        }
    }         

    public List<BacklogItem> findAllByCompany(Long companyId) {
        EntityManager em = getEntityManager();
        try {
            Query q = em.createNamedQuery("BacklogItem.find.by.company");
            q.setParameter("companyId", companyId);
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public List<Object[]> countByStatus(Long companyId) {
        EntityManager em = getEntityManager();
        try {
            // "SELECT o.statusId, COUNT(o) FROM BacklogItem o WHERE o.companyId = :companyId GROUP BY o.statusId"
            Query q = em.createNamedQuery("BacklogItem.find.by.status");
            q.setParameter("companyId", companyId);
            return q.getResultList();
        } finally {
            em.close();
        }
    }    
    
}
