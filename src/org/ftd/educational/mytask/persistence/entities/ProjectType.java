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
@Table(name="projecttype")
@NamedQueries({
    @NamedQuery(name = "ProjectType.find.by.name",
            query = "SELECT o FROM ProjectType o WHERE o.companyId = :id AND o.name = :name"),
    @NamedQuery(name = "ProjectType.find.all",
            query = "SELECT o FROM ProjectType o WHERE o.companyId = :id")    
})

public class ProjectType extends AbstractEntity {    
    private static final long serialVersionUID = 9165613710797562909L;
    
    @Column(nullable = false, columnDefinition = "BIGINT(20) default 1")
    private Long companyId;    
    
    public Long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }    
    
}

