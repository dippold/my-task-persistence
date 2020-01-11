package org.ftd.educational.mytask.persistence.daos;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import org.ftd.educational.mytask.persistence.entities.ProjectStatus;


/**
 *
 * @author Fabio Tavares Dippold
 * 
 */
public class ProjectStatusDAO extends ProjectStatusJpaController {

    private static final long serialVersionUID = -6280113188589378295L;

    public ProjectStatusDAO(EntityManagerFactory emf) {
        super(emf);
    }

    public ProjectStatus find(Long id) {
        return  super.findProjectStatus(id);
    }    
    
    public ProjectStatus findByName(Long companyId, String name) throws NoResultException {
        EntityManager em = getEntityManager();
        try {
            return (ProjectStatus) em.createNamedQuery("ProjectStatus.find.by.name")
                    .setParameter("id", companyId)
                    .setParameter("name", name)
                    .getSingleResult();
        } finally {
            em.close();
        }
    }    
    
    public List<ProjectStatus> findAllByCompany(Long companyId) {
        EntityManager em = getEntityManager();
        try {
            Query q = em.createNamedQuery("ProjectStatus.find.all");
            q.setParameter("id", companyId);
            return q.getResultList();
        } finally {
            em.close();
        }
    }    
    
}
