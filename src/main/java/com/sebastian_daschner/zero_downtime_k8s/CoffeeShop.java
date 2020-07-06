package com.sebastian_daschner.zero_downtime_k8s;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;
import java.util.List;
import java.util.UUID;

@ApplicationScoped
@Transactional
public class CoffeeShop {

    public List<CoffeeOrder> getOrders() {
        return CoffeeOrder.listAll();
    }

    public CoffeeOrder getOrder(UUID id) {
        return CoffeeOrder.findById(id);
    }

    public CoffeeOrder orderCoffee(CoffeeOrder order) {
        CoffeeOrder.persist(order);
        return order;
    }

}
