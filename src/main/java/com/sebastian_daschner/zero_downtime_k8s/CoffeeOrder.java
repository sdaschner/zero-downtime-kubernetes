package com.sebastian_daschner.zero_downtime_k8s;

import io.quarkus.hibernate.orm.panache.PanacheEntityBase;

import javax.json.bind.annotation.JsonbTransient;
import javax.json.bind.annotation.JsonbTypeAdapter;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
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
    public CoffeeType type;

    public OrderStatus status = PREPARING;

}
