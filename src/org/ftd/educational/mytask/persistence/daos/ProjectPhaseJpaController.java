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
import org.ftd.educational.mytask.persistence.entities.ProjectPhase;

/**
 *
 * @author ftd
 */
public class ProjectPhaseJpaController implements Serializable {

    public ProjectPhaseJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(ProjectPhase projectPhase) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(projectPhase);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(ProjectPhase projectPhase) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            projectPhase = em.merge(projectPhase);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = projectPhase.getId();
                if (findProjectPhase(id) == null) {
                    throw new NonexistentEntityException("The projectPhase with id " + id + " no longer exists.");
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
            ProjectPhase projectPhase;
            try {
                projectPhase = em.getReference(ProjectPhase.class, id);
                projectPhase.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The projectPhase with id " + id + " no longer exists.", enfe);
            }
            em.remove(projectPhase);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<ProjectPhase> findProjectPhaseEntities() {
        return findProjectPhaseEntities(true, -1, -1);
    }

    public List<ProjectPhase> findProjectPhaseEntities(int maxResults, int firstResult) {
        return findProjectPhaseEntities(false, maxResults, firstResult);
    }

    private List<ProjectPhase> findProjectPhaseEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(ProjectPhase.class));
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

    public ProjectPhase findProjectPhase(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(ProjectPhase.class, id);
        } finally {
            em.close();
        }
    }

    public int getProjectPhaseCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<ProjectPhase> rt = cq.from(ProjectPhase.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
