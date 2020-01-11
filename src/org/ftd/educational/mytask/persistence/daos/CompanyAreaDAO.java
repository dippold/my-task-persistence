package org.ftd.educational.mytask.persistence.daos;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import org.ftd.educational.mytask.persistence.entities.CompanyArea;


/**
 *
 * @author Fabio Tavares Dippold
 * 
 */
public class CompanyAreaDAO extends CompanyAreaJpaController {

    private static final long serialVersionUID = -7857098663583962093L;


    public CompanyAreaDAO(EntityManagerFactory emf) {
        super(emf);
    }

    public CompanyArea find(Long id) {
        return  super.findCompanyArea(id);
    }    
    
    public CompanyArea findByName(Long companyId, String name) throws NoResultException {
        EntityManager em = getEntityManager();
        try {
            return (CompanyArea) em.createNamedQuery("CompanyArea.find.by.name")
                    .setParameter("id", companyId)
                    .setParameter("name", name)
                    .getSingleResult();
        } finally {
            em.close();
        }
    }    
    
    public List<CompanyArea> findAllByCompany(Long companyId) {
        EntityManager em = getEntityManager();
        try {
            Query q = em.createNamedQuery("CompanyArea.find.all");
            q.setParameter("id", companyId);
            return q.getResultList();
        } finally {
            em.close();
        }
    }    
    
}
