package org.ftd.educational.mytask.persistence.daos;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import org.ftd.educational.mytask.persistence.entities.Rule;


/**
 *
 * @author Fabio Tavares Dippold
 * 
 */
public class RuleDAO extends RuleJpaController {

    private static final long serialVersionUID = 7533835727240916207L;

    public RuleDAO(EntityManagerFactory emf) {
        super(emf);
    }

    public Rule find(Long id) {
        return  super.findRule(id);
    }    
    
    public Rule findByName(String name) throws NoResultException {
        EntityManager em = getEntityManager();
        try {
            return (Rule) em.createNamedQuery("Rule.findby.name")
                    .setParameter("name", name)
                    .getSingleResult();
        } finally {
            em.close();
        }
    }    
    
    public List<Rule> findAll() {
        return findRuleEntities();
    }
    
}
