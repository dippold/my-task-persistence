package org.ftd.educational.mytask.persistence.entities;

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
@Table(name="rule")
@NamedQueries({
    @NamedQuery(name = "Rule.find.by.name",
            query = "SELECT o FROM Rule o WHERE o.name = :name"),
    @NamedQuery(name = "Rule.find.all",
            query = "SELECT o FROM Rule o")    
})

public class Rule extends AbstractEntity {    
    private static final long serialVersionUID = 9165613710797562909L;
           
}

