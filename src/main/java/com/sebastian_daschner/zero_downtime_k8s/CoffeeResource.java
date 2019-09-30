package com.sebastian_daschner.zero_downtime_k8s;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.WebApplicationException;
import java.util.Random;

@Path("coffee")
public class CoffeeResource {

    @GET
    public String getCoffee() {
        if (new Random().nextDouble() < 0.9)
            throw new WebApplicationException();
        return "Coffee!\n";
    }

}
