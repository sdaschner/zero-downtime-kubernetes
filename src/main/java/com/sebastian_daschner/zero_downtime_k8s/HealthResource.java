package com.sebastian_daschner.zero_downtime_k8s;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("health")
@Produces(MediaType.TEXT_PLAIN)
public class HealthResource {

    @GET
    public String health() {
        return "OK";
    }

}
