package org.ftd.educational.mytask.persistence.daos;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import org.ftd.educational.mytask.persistence.entities.ConfigKey;

/**
 *
 * @author Fabio Tavares Dippold
 * @version 2018-06-13
 * 
 */
public class ConfigKeyDAO extends ConfigKeyJpaController {
    
    public ConfigKeyDAO(EntityManagerFactory emf) {
        super(emf);
    }
    
    public ConfigKey find(Long id) {
        return super.findConfigKey(id);
    }

    public ConfigKey findConfigKey(Long companyId, String name) throws NoResultException {
        EntityManager em = getEntityManager();
        try {
            return (ConfigKey) em.createNamedQuery("ConfigKey.find.by.name")
                    .setParameter("id", companyId)
                    .setParameter("name", name)
                    .getSingleResult();
        } finally {
            em.close();
        }
    }
    
    public List<ConfigKey> findAllByCompany(Long companyId) {
        EntityManager em = getEntityManager();
        try {
            Query q = em.createNamedQuery("ConfigKey.find.all");
            q.setParameter("id", companyId);
            return q.getResultList();
        } finally {
            em.close();
        }
    }     
        
    public List<ConfigKey> findAll() {
        return super.findConfigKeyEntities();
    }
    
}
