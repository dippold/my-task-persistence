package org.ftd.educational.mytask.persistence.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author Fabio Tavares Dippold
 * @version 2018-05-17 - 2.0.0
 *
 */
@Entity
@Table(name="user")
@NamedQueries({
    @NamedQuery(name = "User.find.by.company",
            query = "SELECT o FROM User o WHERE o.companyId = :companyId ORDER BY o.name"),
    @NamedQuery(name = "User.find.by.name",
            query = "SELECT o FROM User o WHERE o.companyId = :companyId AND o.name = :name"),
    @NamedQuery(name = "User.find.by.email",
            query = "SELECT o FROM User o WHERE o.email = :email")    
})
public class User extends AbstractEntity {
    
    private static final long serialVersionUID = -6520061242222657623L;    
    
    @Column(nullable = false, columnDefinition = "BIGINT(20) default 1")
    private Long companyId = 1L;
    
    @Column(nullable = false, columnDefinition = "BIGINT(20) default 1")
    private Long ruleId = 1L;    
    
    @Column(unique = true, nullable = false, length = 45)
    private String email;

    @Column(nullable = false, columnDefinition = "BIGINT(20) default 1")
    private Long userStatusId;

    public Long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    public Long getRuleId() {
        return ruleId;
    }

    public void setRuleId(Long ruleId) {
        this.ruleId = ruleId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Boolean isBlocked() {
        boolean blocked = false;
        // 2L=Inativo 3L=Bloqueado
        if (getUserStatusId() == 2L || getUserStatusId() == 3L) {
            blocked = true;
        }
        
        return blocked;
    }

    public Long getUserStatusId() {
        return userStatusId;
    }

    public void setUserStatusId(Long userStatusId) {
        this.userStatusId = userStatusId;
    }

  
}
