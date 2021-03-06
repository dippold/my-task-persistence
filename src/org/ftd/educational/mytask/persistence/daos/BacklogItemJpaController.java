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
import org.ftd.educational.mytask.persistence.entities.BacklogItem;

/**
 *
 * @author fdippold
 */
public class BacklogItemJpaController implements Serializable {

    public BacklogItemJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(BacklogItem backlogItem) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(backlogItem);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(BacklogItem backlogItem) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            backlogItem = em.merge(backlogItem);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = backlogItem.getId();
                if (findBacklogItem(id) == null) {
                    throw new NonexistentEntityException("The backlogItem with id " + id + " no longer exists.");
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
            BacklogItem backlogItem;
            try {
                backlogItem = em.getReference(BacklogItem.class, id);
                backlogItem.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The backlogItem with id " + id + " no longer exists.", enfe);
            }
            em.remove(backlogItem);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<BacklogItem> findBacklogItemEntities() {
        return findBacklogItemEntities(true, -1, -1);
    }

    public List<BacklogItem> findBacklogItemEntities(int maxResults, int firstResult) {
        return findBacklogItemEntities(false, maxResults, firstResult);
    }

    private List<BacklogItem> findBacklogItemEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(BacklogItem.class));
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

    public BacklogItem findBacklogItem(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(BacklogItem.class, id);
        } finally {
            em.close();
        }
    }

    public int getBacklogItemCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<BacklogItem> rt = cq.from(BacklogItem.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
