package org.ftd.educational.mytask.persistence.daos;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import org.ftd.educational.mytask.persistence.entities.Stakeholder;



/**
 *
 * @author Fabio Tavares Dippold
 * @version 2018-06-22 - 2.0.0
 * 
 */
public class StakeholderDAO extends StakeholderJpaController {

    private static final long serialVersionUID = -4935688879996705123L;


    public StakeholderDAO(EntityManagerFactory emf) {
        super(emf);
    }

    public Stakeholder find(Long id) {
        return super.findStakeholder(id);
    }    
    
    public Stakeholder findUserByName(Long companyId, String name) throws NoResultException {
        EntityManager em = getEntityManager();
        try {
            return (Stakeholder) em.createNamedQuery("Stakeholder.find.by.name")
                    .setParameter("id", companyId)
                    .setParameter("name", name)
                    .getSingleResult();
        } finally {
            em.close();
        }
    }         

    public List<Stakeholder> findAllByCompany(Long companyId) {
        EntityManager em = getEntityManager();
        try {
            Query q = em.createNamedQuery("Stakeholder.find.by.company");
            q.setParameter("companyId", companyId);
            return q.getResultList();
        } finally {
            em.close();
        }
    }
  
}
