package org.ftd.educational.mytask.persistence.entities;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 *
 * @author Fabio Tavares Dippold
 * @version 2018-06-22 - 2.0.0
 *
 */
@Entity
@Table(name="backlogitem")
@NamedQueries({
    @NamedQuery(name = "BacklogItem.find.by.company",
            query = "SELECT o FROM BacklogItem o WHERE o.companyId = :companyId ORDER BY o.name"),
    @NamedQuery(name = "BacklogItem.find.by.name",
            query = "SELECT o FROM BacklogItem o WHERE o.companyId = :companyId AND o.name = :name"),
    @NamedQuery(name = "BacklogItem.find.by.status",
            query = "SELECT o.statusId, COUNT(o) FROM BacklogItem o WHERE o.companyId = :companyId GROUP BY o.statusId")
})
public class BacklogItem extends AbstractEntity {

    private static final long serialVersionUID = -8415447428214986995L; 
    
    @Column(nullable = false, columnDefinition = "BIGINT(20)")
    private Long companyId = 1L;
    
    @Column(nullable = false, columnDefinition = "BIGINT(20)")
    private Long companyAreaId = 1L;    
    
    @Column(nullable = false, columnDefinition = "BIGINT(20)")
    private Long statusId = 1L;    
    
    @Column(nullable = false, columnDefinition = "BIGINT(20)")
    private Long stakeholderId = 1L;     

    @Column(nullable = true, length = 255)
    private String description;    

    @Column(nullable = true, length = 255)
    private String estimatedResources;      
    
    private int estimatedWork;
    
    private int estimatedDuration;

    private int estimatedCost;    
    
    @Temporal(javax.persistence.TemporalType.DATE)
    @Column(nullable = false)
    private Date requestDate;    
    
    @Temporal(javax.persistence.TemporalType.DATE)
    @Column(nullable = false)
    private Date wishDate;
            
    @Temporal(javax.persistence.TemporalType.DATE)
    @Column(nullable = false)
    private Date plannedDate;
    
    @Temporal(javax.persistence.TemporalType.DATE)
    @Column(nullable = false)
    private Date dateDelivered;
    
    @Column(nullable = false, length = 255)
    private String observation;

    @Column(nullable = false, length = 255)
    private String stakeholderConcern;

    @Column(nullable = false, length = 255)
    private String readyConcept;        
    
    
    public Long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    public Long getStatusId() {
        return statusId;
    }

    public void setStatusId(Long statusId) {
        this.statusId = statusId;
    }

    public Long getStakeholderId() {
        return stakeholderId;
    }

    public void setStakeholderId(Long stakeholderId) {
        this.stakeholderId = stakeholderId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getEstimatedWork() {
        return estimatedWork;
    }

    public void setEstimatedWork(int estimatedWork) {
        this.estimatedWork = estimatedWork;
    }

    public Date getWishDate() {
        return wishDate;
    }

    public void setWishDate(Date wishDate) {
        this.wishDate = wishDate;
    }

    public Date getPlannedDate() {
        return plannedDate;
    }

    public void setPlannedDate(Date plannedDate) {
        this.plannedDate = plannedDate;
    }

    public Date getDateDelivered() {
        return dateDelivered;
    }

    public void setDateDelivered(Date dateDelivered) {
        this.dateDelivered = dateDelivered;
    }

    public String getObservation() {
        return observation;
    }

    public void setObservation(String observation) {
        this.observation = observation;
    }

    public Date getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(Date requestDate) {
        this.requestDate = requestDate;
    }    

    public Long getCompanyAreaId() {
        return companyAreaId;
    }

    public void setCompanyAreaId(Long companyAreaId) {
        this.companyAreaId = companyAreaId;
    }    

    public int getEstimatedDuration() {
        return estimatedDuration;
    }

    public void setEstimatedDuration(int estimatedDuration) {
        this.estimatedDuration = estimatedDuration;
    }

    public String getStakeholderConcern() {
        return stakeholderConcern;
    }

    public void setStakeholderConcern(String stakeholderConcern) {
        this.stakeholderConcern = stakeholderConcern;
    }

    public String getReadyConcept() {
        return readyConcept;
    }

    public void setReadyConcept(String readyConcept) {
        this.readyConcept = readyConcept;
    }

    public String getEstimatedResources() {
        return estimatedResources;
    }

    public void setEstimatedResources(String estimatedResources) {
        this.estimatedResources = estimatedResources;
    }

    public int getEstimatedCost() {
        return estimatedCost;
    }

    public void setEstimatedCost(int estimatedCost) {
        this.estimatedCost = estimatedCost;
    }

    

    
}
