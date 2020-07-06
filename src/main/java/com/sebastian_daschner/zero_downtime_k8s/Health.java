package com.sebastian_daschner.zero_downtime_k8s;

import org.eclipse.microprofile.health.HealthCheck;
import org.eclipse.microprofile.health.HealthCheckResponse;
import org.eclipse.microprofile.health.Readiness;

import javax.enterprise.context.ApplicationScoped;

@Readiness
@ApplicationScoped
public class Health implements HealthCheck {

    @Override
    public HealthCheckResponse call() {
        return HealthCheckResponse.up("coffee-shop");
    }

}
