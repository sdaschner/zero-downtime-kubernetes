package com.sebastian_daschner.zero_downtime_k8s;

import io.quarkus.hibernate.orm.panache.PanacheEntityBase;

import javax.json.bind.annotation.JsonbTransient;
import javax.json.bind.annotation.JsonbTypeAdapter;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.UUID;

import static com.sebastian_daschner.zero_downtime_k8s.OrderStatus.PREPARING;

@Entity
@Table(name = "orders")
public class CoffeeOrder extends PanacheEntityBase {

    @Id
    @GeneratedValue
    @JsonbTransient
    public UUID id;

    @NotNull
    @JsonbTypeAdapter(CoffeeTypeDeserializer.class)
    @Column(name = "coffee_type")
    public CoffeeType type;

    // temporary duplicate field for data migration
    @Basic(optional = false)
    @Column(name = "type")
    private CoffeeType tmpCoffeeType;

    public OrderStatus status = PREPARING;

    @PrePersist
    @PreUpdate
    private void setTemporaryCoffeeType() {
        tmpCoffeeType = type;
    }

}
