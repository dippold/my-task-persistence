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
@Table(name="company")
@NamedQueries({
    @NamedQuery(name = "Company.find.by.group",
            query = "SELECT o FROM Company o WHERE o.groupId = :groupId ORDER BY o.name"),
    @NamedQuery(name = "CompanyUser.find.by.name",
            query = "SELECT o FROM Company o WHERE o.name = :name"),
    @NamedQuery(name = "Company.find.by.cnpj",
            query = "SELECT o FROM Company o WHERE o.cnpj = :cnpj")    
})
public class Company extends AbstractEntity {
   
    @Column(nullable = false, columnDefinition = "BIGINT(20) default 1")
    private Long groupId = 1L;   
    
    @Column(unique = true, nullable = false, length = 18)
    private String cnpj;

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public Long getGroupId() {
        return groupId;
    }

    public void setGroupId(Long groupId) {
        this.groupId = groupId;
    }

}
