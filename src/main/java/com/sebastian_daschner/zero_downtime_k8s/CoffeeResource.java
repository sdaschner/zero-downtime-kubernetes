package com.sebastian_daschner.zero_downtime_k8s;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("coffee")
public class CoffeeResource {

    @GET
    public String getCoffee() {
        return "Coffee\n";
    }

}
