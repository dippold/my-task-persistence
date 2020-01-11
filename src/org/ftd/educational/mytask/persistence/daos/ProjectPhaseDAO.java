package org.ftd.educational.mytask.persistence.daos;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import org.ftd.educational.mytask.persistence.entities.ProjectPhase;


/**
 *
 * @author Fabio Tavares Dippold
 * 
 */
public class ProjectPhaseDAO extends ProjectPhaseJpaController {

    private static final long serialVersionUID = -7857098663583962093L;


    public ProjectPhaseDAO(EntityManagerFactory emf) {
        super(emf);
    }

    public ProjectPhase find(Long id) {
        return  super.findProjectPhase(id);
    }    
    
    public ProjectPhase findByName(Long companyId, String name) throws NoResultException {
        EntityManager em = getEntityManager();
        try {
            return (ProjectPhase) em.createNamedQuery("ProjectPhase.find.by.name")
                    .setParameter("id", companyId)
                    .setParameter("name", name)
                    .getSingleResult();
        } finally {
            em.close();
        }
    }    
    
    public List<ProjectPhase> findAllByCompany(Long companyId) {
        EntityManager em = getEntityManager();
        try {
            Query q = em.createNamedQuery("ProjectPhase.find.all");
            q.setParameter("id", companyId);
            return q.getResultList();
        } finally {
            em.close();
        }
    }    
    
}
