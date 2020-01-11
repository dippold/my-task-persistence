package org.ftd.educational.mytask.persistence.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author Fabio Tavares Dippold
 * @version 1.0.0 - 13/03/2018
 *
 */
@Entity
@Table(name="configkey")
@NamedQueries({
    @NamedQuery(name = "ConfigKey.find.by.name",
            query = "SELECT o FROM ConfigKey o WHERE o.companyId = :id AND o.name = :name"),
    @NamedQuery(name = "ConfigKey.find.all",
            query = "SELECT o FROM ConfigKey o WHERE o.companyId = :id")    
})
public class ConfigKey extends AbstractEntity {

    private static final long serialVersionUID = 9165613710797562909L;

    @Column(nullable = false, columnDefinition = "BIGINT(20) default 1")
    private Long companyId;
    
    @Column(nullable = false, length = 255)
    private String keyValue;

    public Long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }    
    
    public String getKeyValue() {
        return keyValue;
    }

    public void setKeyValue(String keyValue) {
        this.keyValue = keyValue;
    }
    
    @Override
    public String toString() {
        return this.getClass().getSimpleName()
                + " [ " + super.getName() + " = " + keyValue + " ]";
    }    
    
}
