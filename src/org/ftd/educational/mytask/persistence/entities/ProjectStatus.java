package org.ftd.educational.mytask.persistence.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author Fabio Tavares Dippold
 * @version 1.0.1 - 24/05/2016
 *
 */
@Entity
@Table(name="projectstatus")
@NamedQueries({
    @NamedQuery(name = "ProjectStatus.find.by.name",
            query = "SELECT o FROM ProjectStatus o WHERE o.companyId = :id AND o.name = :name"),
    @NamedQuery(name = "ProjectStatus.find.all",
            query = "SELECT o FROM ProjectStatus o WHERE o.companyId = :id")    
})

public class ProjectStatus extends AbstractEntity {    

    private static final long serialVersionUID = -6561884461245116150L;
    
    @Column(nullable = false, columnDefinition = "BIGINT(20) default 1")
    private Long companyId;    
    
    public Long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }    
    
}

