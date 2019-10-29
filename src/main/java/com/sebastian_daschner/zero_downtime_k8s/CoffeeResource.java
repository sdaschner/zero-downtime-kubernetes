package com.sebastian_daschner.zero_downtime_k8s;

import javax.ws.rs.GET;
import javax.ws.rs.Path;

@Path("coffee")
public class CoffeeResource {

    @GET
    public String getCoffee() {
        return "Кофе\n";
    }

}
