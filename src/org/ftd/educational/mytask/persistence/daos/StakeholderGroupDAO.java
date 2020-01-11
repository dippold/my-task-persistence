package org.ftd.educational.mytask.persistence.daos;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import org.ftd.educational.mytask.persistence.entities.StakeholderGroup;


/**
 *
 * @author Fabio Tavares Dippold
 * 
 */
public class StakeholderGroupDAO extends StakeholderGroupJpaController {

    private static final long serialVersionUID = -7857098663583962093L;


    public StakeholderGroupDAO(EntityManagerFactory emf) {
        super(emf);
    }

    public StakeholderGroup find(Long id) {
        return  super.findStakeholderGroup(id);
    }    
    
    public StakeholderGroup findByName(Long companyId, String name) throws NoResultException {
        EntityManager em = getEntityManager();
        try {
            return (StakeholderGroup) em.createNamedQuery("StakeholderGroup.find.by.name")
                    .setParameter("id", companyId)
                    .setParameter("name", name)
                    .getSingleResult();
        } finally {
            em.close();
        }
    }    
    
    public List<StakeholderGroup> findAllByCompany(Long companyId) {
        EntityManager em = getEntityManager();
        try {
            Query q = em.createNamedQuery("StakeholderGroup.find.all");
            q.setParameter("id", companyId);
            return q.getResultList();
        } finally {
            em.close();
        }
    }    
    
}
