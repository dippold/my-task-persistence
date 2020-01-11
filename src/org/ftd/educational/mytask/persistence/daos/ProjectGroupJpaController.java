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
import org.ftd.educational.mytask.persistence.entities.ProjectGroup;

/**
 *
 * @author ftd
 */
public class ProjectGroupJpaController implements Serializable {

    public ProjectGroupJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(ProjectGroup projectGroup) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(projectGroup);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(ProjectGroup projectGroup) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            projectGroup = em.merge(projectGroup);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = projectGroup.getId();
                if (findProjectGroup(id) == null) {
                    throw new NonexistentEntityException("The projectGroup with id " + id + " no longer exists.");
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
            ProjectGroup projectGroup;
            try {
                projectGroup = em.getReference(ProjectGroup.class, id);
                projectGroup.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The projectGroup with id " + id + " no longer exists.", enfe);
            }
            em.remove(projectGroup);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<ProjectGroup> findProjectGroupEntities() {
        return findProjectGroupEntities(true, -1, -1);
    }

    public List<ProjectGroup> findProjectGroupEntities(int maxResults, int firstResult) {
        return findProjectGroupEntities(false, maxResults, firstResult);
    }

    private List<ProjectGroup> findProjectGroupEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(ProjectGroup.class));
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

    public ProjectGroup findProjectGroup(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(ProjectGroup.class, id);
        } finally {
            em.close();
        }
    }

    public int getProjectGroupCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<ProjectGroup> rt = cq.from(ProjectGroup.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
