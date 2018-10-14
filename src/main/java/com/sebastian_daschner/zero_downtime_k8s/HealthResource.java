package com.sebastian_daschner.zero_downtime_k8s;

import javax.ejb.Singleton;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.concurrent.atomic.AtomicBoolean;

@Path("health")
@Produces(MediaType.TEXT_PLAIN)
@Singleton
public class HealthResource {

    private final AtomicBoolean shutdown = new AtomicBoolean(false);

    @GET
    public String health() {
        if (shutdown.get())
            throw new ServiceUnavailableException();

        return "OK";
    }

    // just an example; don't make this publicly accessible :-)
    @DELETE
    public void shutdown() {
        shutdown.set(true);
    }

}
