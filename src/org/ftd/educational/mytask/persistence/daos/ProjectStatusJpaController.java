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
import org.ftd.educational.mytask.persistence.entities.ProjectStatus;

/**
 *
 * @author ftd
 */
public class ProjectStatusJpaController implements Serializable {

    public ProjectStatusJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(ProjectStatus projectStatus) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(projectStatus);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(ProjectStatus projectStatus) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            projectStatus = em.merge(projectStatus);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = projectStatus.getId();
                if (findProjectStatus(id) == null) {
                    throw new NonexistentEntityException("The projectStatus with id " + id + " no longer exists.");
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
            ProjectStatus projectStatus;
            try {
                projectStatus = em.getReference(ProjectStatus.class, id);
                projectStatus.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The projectStatus with id " + id + " no longer exists.", enfe);
            }
            em.remove(projectStatus);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<ProjectStatus> findProjectStatusEntities() {
        return findProjectStatusEntities(true, -1, -1);
    }

    public List<ProjectStatus> findProjectStatusEntities(int maxResults, int firstResult) {
        return findProjectStatusEntities(false, maxResults, firstResult);
    }

    private List<ProjectStatus> findProjectStatusEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(ProjectStatus.class));
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

    public ProjectStatus findProjectStatus(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(ProjectStatus.class, id);
        } finally {
            em.close();
        }
    }

    public int getProjectStatusCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<ProjectStatus> rt = cq.from(ProjectStatus.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
