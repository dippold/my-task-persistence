package org.ftd.educational.mytask.persistence.entities;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Fabio Tavares Dippold
 * @version 1.0.0 - 2018-06-21
 * 
 */
@Entity
@Table(name="log")
@NamedQueries({
    @NamedQuery(name = "Log.find.all",
            query = "SELECT o FROM Log o WHERE o.companyId = :id ORDER BY o.createdOn ASC")    
})
public class Log extends AbstractEntity { 
    
    @Column(nullable = false, columnDefinition = "BIGINT(20)")
    private Long companyId = 1L;  
    
    @Column(nullable = false, length = 45)
    private String userId;        
    
    @Column(nullable = false, length = 45)
    private String entityId;  
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdOn;
    
    @Column(length = 45)
    private String fieldName;

    @Column(length = 100)
    private String oldValue;

    @Column(length = 100)
    private String newValue;    

    public Long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getEntityId() {
        return entityId;
    }

    public void setEntityId(String entityId) {
        this.entityId = entityId;
    }

    public Date getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(Date createdOn) {
        this.createdOn = createdOn;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public String getOldValue() {
        return oldValue;
    }

    public void setOldValue(String oldValue) {
        this.oldValue = oldValue;
    }

    public String getNewValue() {
        return newValue;
    }

    public void setNewValue(String newValue) {
        this.newValue = newValue;
    }
  
    
    
}
