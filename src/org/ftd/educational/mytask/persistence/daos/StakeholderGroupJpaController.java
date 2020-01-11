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
import org.ftd.educational.mytask.persistence.entities.StakeholderGroup;

/**
 *
 * @author ftd
 */
public class StakeholderGroupJpaController implements Serializable {

    public StakeholderGroupJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(StakeholderGroup stakeholderGroup) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(stakeholderGroup);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(StakeholderGroup stakeholderGroup) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            stakeholderGroup = em.merge(stakeholderGroup);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = stakeholderGroup.getId();
                if (findStakeholderGroup(id) == null) {
                    throw new NonexistentEntityException("The stakeholderGroup with id " + id + " no longer exists.");
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
            StakeholderGroup stakeholderGroup;
            try {
                stakeholderGroup = em.getReference(StakeholderGroup.class, id);
                stakeholderGroup.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The stakeholderGroup with id " + id + " no longer exists.", enfe);
            }
            em.remove(stakeholderGroup);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<StakeholderGroup> findStakeholderGroupEntities() {
        return findStakeholderGroupEntities(true, -1, -1);
    }

    public List<StakeholderGroup> findStakeholderGroupEntities(int maxResults, int firstResult) {
        return findStakeholderGroupEntities(false, maxResults, firstResult);
    }

    private List<StakeholderGroup> findStakeholderGroupEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(StakeholderGroup.class));
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

    public StakeholderGroup findStakeholderGroup(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(StakeholderGroup.class, id);
        } finally {
            em.close();
        }
    }

    public int getStakeholderGroupCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<StakeholderGroup> rt = cq.from(StakeholderGroup.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
