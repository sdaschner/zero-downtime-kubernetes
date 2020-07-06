package com.sebastian_daschner.zero_downtime_k8s;

import java.util.stream.Stream;

public enum CoffeeType {

    ESPRESSO,
    LATTE,
    POUR_OVER;

    public static CoffeeType fromString(String string) {
        return Stream.of(CoffeeType.values())
                .filter(t -> t.name().equalsIgnoreCase(string))
                .findAny().orElse(null);
    }

}
