package org.ftd.educational.mytask.persistence.daos;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import org.ftd.educational.mytask.persistence.entities.ProjectGroup;
import org.ftd.educational.mytask.persistence.entities.ProjectType;


/**
 *
 * @author Fabio Tavares Dippold
 * 
 */
public class ProjectTypeDAO extends ProjectTypeJpaController {

    private static final long serialVersionUID = -3616609237190856660L;


    public ProjectTypeDAO(EntityManagerFactory emf) {
        super(emf);
    }

    public ProjectType find(Long id) {
        return  super.findProjectType(id);
    }    
    
    public ProjectType findByName(Long companyId, String name) throws NoResultException {
        EntityManager em = getEntityManager();
        try {
            return (ProjectType) em.createNamedQuery("ProjectType.find.by.name")
                    .setParameter("id", companyId)
                    .setParameter("name", name)
                    .getSingleResult();
        } finally {
            em.close();
        }
    }    
    
    public List<ProjectType> findAllByCompany(Long companyId) {
        EntityManager em = getEntityManager();
        try {
            Query q = em.createNamedQuery("ProjectType.find.all");
            q.setParameter("id", companyId);
            return q.getResultList();
        } finally {
            em.close();
        }
    }    
    
}
