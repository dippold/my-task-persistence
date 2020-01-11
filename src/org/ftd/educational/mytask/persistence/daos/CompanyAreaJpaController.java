/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.ftd.educational.mytask.persistence.daos;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.ftd.educational.mytask.persistence.daos.exceptions.NonexistentEntityException;
import org.ftd.educational.mytask.persistence.entities.CompanyArea;

/**
 *
 * @author ftd
 */
public class CompanyAreaJpaController implements Serializable {

    public CompanyAreaJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(CompanyArea companyArea) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(companyArea);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(CompanyArea companyArea) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            companyArea = em.merge(companyArea);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = companyArea.getId();
                if (findCompanyArea(id) == null) {
                    throw new NonexistentEntityException("The companyArea with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Long id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            CompanyArea companyArea;
            try {
                companyArea = em.getReference(CompanyArea.class, id);
                companyArea.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The companyArea with id " + id + " no longer exists.", enfe);
            }
            em.remove(companyArea);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<CompanyArea> findCompanyAreaEntities() {
        return findCompanyAreaEntities(true, -1, -1);
    }

    public List<CompanyArea> findCompanyAreaEntities(int maxResults, int firstResult) {
        return findCompanyAreaEntities(false, maxResults, firstResult);
    }

    private List<CompanyArea> findCompanyAreaEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(CompanyArea.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public CompanyArea findCompanyArea(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(CompanyArea.class, id);
        } finally {
            em.close();
        }
    }

    public int getCompanyAreaCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<CompanyArea> rt = cq.from(CompanyArea.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
