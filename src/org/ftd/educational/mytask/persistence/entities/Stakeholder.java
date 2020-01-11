package org.ftd.educational.mytask.persistence.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author Fabio Tavares Dippold
 * @version 2018-06-22 - 2.0.0
 *
 */
@Entity
@Table(name="stakeholder")
@NamedQueries({
    @NamedQuery(name = "Stakeholder.find.by.company",
            query = "SELECT o FROM Stakeholder o WHERE o.companyId = :companyId ORDER BY o.name"),
    @NamedQuery(name = "Stakeholder.find.by.name",
            query = "SELECT o FROM Stakeholder o WHERE o.companyId = :companyId AND o.name = :name"),
})
public class Stakeholder extends AbstractEntity {

    private static final long serialVersionUID = -50497158183988259L;   
    
    @Column(nullable = false, columnDefinition = "BIGINT(20) default 1")
    private Long companyId = 1L;
    
    @Column(nullable = false, columnDefinition = "BIGINT(20) default 1")
    private Long stakeholderGroupId = 1L;    
    
    @Column(unique = true, nullable = true, length = 45)
    private String email;

    @Column(unique = true, nullable = true, length = 255)
    private String observation;

    public Long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    public Long getStakeholderGroupId() {
        return stakeholderGroupId;
    }

    public void setStakeholderGroupId(Long stakeholderGroupId) {
        this.stakeholderGroupId = stakeholderGroupId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getObservation() {
        return observation;
    }

    public void setObservation(String observation) {
        this.observation = observation;
    }
      
    
    
}
