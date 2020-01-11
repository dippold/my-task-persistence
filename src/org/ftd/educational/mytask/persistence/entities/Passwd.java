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
 * @version 1.0.1 - 24/05/2016
 *
 */
@Entity
@Table(name="passwd")
@NamedQueries({
    @NamedQuery(name = "Passwd.find.by.user",
            query = "SELECT o FROM Passwd o WHERE o.userId = :userId AND o.passwdStatusId = :passwdStatusId"),
    @NamedQuery(name = "Passwd.find.all.by.user",
            query = "SELECT o FROM Passwd o WHERE o.userId = :userId ORDER BY o.createdOn DESC")    
})

public class Passwd extends AbstractEntity {    
    private static final long serialVersionUID = 9165613710797562909L;
    
    @Column(nullable = false, columnDefinition = "BIGINT(20)")
    private Long userId;    
    
    @Column(nullable = false, columnDefinition = "BIGINT(20) default 1")
    private Long passwdStatusId;     
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdOn;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getPasswdStatusId() {
        return passwdStatusId;
    }

    public void setPasswdStatusId(Long passwdStatusId) {
        this.passwdStatusId = passwdStatusId;
    }

    public Date getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(Date createdOn) {
        this.createdOn = createdOn;
    }    
    
}

