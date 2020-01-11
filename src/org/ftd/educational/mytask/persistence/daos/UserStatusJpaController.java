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
import org.ftd.educational.mytask.persistence.entities.UserStatus;

/**
 *
 * @author fdippold
 */
public class UserStatusJpaController implements Serializable {

    public UserStatusJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(UserStatus userStatus) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(userStatus);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(UserStatus userStatus) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            userStatus = em.merge(userStatus);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = userStatus.getId();
                if (findUserStatus(id) == null) {
                    throw new NonexistentEntityException("The userStatus with id " + id + " no longer exists.");
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
            UserStatus userStatus;
            try {
                userStatus = em.getReference(UserStatus.class, id);
                userStatus.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The userStatus with id " + id + " no longer exists.", enfe);
            }
            em.remove(userStatus);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<UserStatus> findUserStatusEntities() {
        return findUserStatusEntities(true, -1, -1);
    }

    public List<UserStatus> findUserStatusEntities(int maxResults, int firstResult) {
        return findUserStatusEntities(false, maxResults, firstResult);
    }

    private List<UserStatus> findUserStatusEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(UserStatus.class));
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

    public UserStatus findUserStatus(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(UserStatus.class, id);
        } finally {
            em.close();
        }
    }

    public int getUserStatusCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<UserStatus> rt = cq.from(UserStatus.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
