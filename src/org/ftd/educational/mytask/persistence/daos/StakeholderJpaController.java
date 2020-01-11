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
import org.ftd.educational.mytask.persistence.entities.Stakeholder;

/**
 *
 * @author ftd
 */
public class StakeholderJpaController implements Serializable {

    public StakeholderJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Stakeholder stakeholder) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(stakeholder);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Stakeholder stakeholder) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            stakeholder = em.merge(stakeholder);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = stakeholder.getId();
                if (findStakeholder(id) == null) {
                    throw new NonexistentEntityException("The stakeholder with id " + id + " no longer exists.");
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
            Stakeholder stakeholder;
            try {
                stakeholder = em.getReference(Stakeholder.class, id);
                stakeholder.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The stakeholder with id " + id + " no longer exists.", enfe);
            }
            em.remove(stakeholder);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Stakeholder> findStakeholderEntities() {
        return findStakeholderEntities(true, -1, -1);
    }

    public List<Stakeholder> findStakeholderEntities(int maxResults, int firstResult) {
        return findStakeholderEntities(false, maxResults, firstResult);
    }

    private List<Stakeholder> findStakeholderEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Stakeholder.class));
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

    public Stakeholder findStakeholder(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Stakeholder.class, id);
        } finally {
            em.close();
        }
    }

    public int getStakeholderCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Stakeholder> rt = cq.from(Stakeholder.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
