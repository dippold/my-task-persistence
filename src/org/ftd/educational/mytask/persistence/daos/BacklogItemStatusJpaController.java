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
import org.ftd.educational.mytask.persistence.entities.BacklogItemStatus;

/**
 *
 * @author ftd
 */
public class BacklogItemStatusJpaController implements Serializable {

    public BacklogItemStatusJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(BacklogItemStatus backlogItemStatus) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(backlogItemStatus);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(BacklogItemStatus backlogItemStatus) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            backlogItemStatus = em.merge(backlogItemStatus);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = backlogItemStatus.getId();
                if (findBacklogItemStatus(id) == null) {
                    throw new NonexistentEntityException("The backlogItemStatus with id " + id + " no longer exists.");
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
            BacklogItemStatus backlogItemStatus;
            try {
                backlogItemStatus = em.getReference(BacklogItemStatus.class, id);
                backlogItemStatus.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The backlogItemStatus with id " + id + " no longer exists.", enfe);
            }
            em.remove(backlogItemStatus);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<BacklogItemStatus> findBacklogItemStatusEntities() {
        return findBacklogItemStatusEntities(true, -1, -1);
    }

    public List<BacklogItemStatus> findBacklogItemStatusEntities(int maxResults, int firstResult) {
        return findBacklogItemStatusEntities(false, maxResults, firstResult);
    }

    private List<BacklogItemStatus> findBacklogItemStatusEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(BacklogItemStatus.class));
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

    public BacklogItemStatus findBacklogItemStatus(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(BacklogItemStatus.class, id);
        } finally {
            em.close();
        }
    }

    public int getBacklogItemStatusCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<BacklogItemStatus> rt = cq.from(BacklogItemStatus.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
