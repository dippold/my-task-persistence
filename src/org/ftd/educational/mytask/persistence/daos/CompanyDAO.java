package org.ftd.educational.mytask.persistence.daos;

import javax.persistence.EntityManagerFactory;
import org.ftd.educational.mytask.persistence.entities.Company;

/**
 *
 * @author Fabio Tavares Dippold
 * @version 1.0.0 - 2018-07-11
 * 
 */
public class CompanyDAO extends CompanyJpaController {
    
    public CompanyDAO(EntityManagerFactory emf) {
        super(emf);
    }
    
    public Company find(Long id) {
        return super.findCompany(id);
    }
    
}
