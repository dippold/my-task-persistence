package org.ftd.educational.mytask.persistence.daos;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import org.ftd.educational.mytask.persistence.entities.ProjectGroup;


/**
 *
 * @author Fabio Tavares Dippold
 * 
 */
public class ProjectGroupDAO extends ProjectGroupJpaController {

    private static final long serialVersionUID = -6280113188589378295L;

    public ProjectGroupDAO(EntityManagerFactory emf) {
        super(emf);
    }

    public ProjectGroup find(Long id) {
        return  super.findProjectGroup(id);
    }    
    
    public ProjectGroup findByName(Long companyId, String name) throws NoResultException {
        EntityManager em = getEntityManager();
        try {
            return (ProjectGroup) em.createNamedQuery("ProjectGroup.find.by.name")
                    .setParameter("id", companyId)
                    .setParameter("name", name)
                    .getSingleResult();
        } finally {
            em.close();
        }
    }    
    
    public List<ProjectGroup> findAllByCompany(Long companyId) {
        EntityManager em = getEntityManager();
        try {
            Query q = em.createNamedQuery("ProjectGroup.find.all");
            q.setParameter("id", companyId);
            return q.getResultList();
        } finally {
            em.close();
        }
    }    
    
}
