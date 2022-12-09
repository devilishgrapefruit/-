package com.projects.CoffeeWorld.models;

import lombok.Data;

import javax.persistence.*;
import java.util.Map;

@Entity
@Data
public class RealOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long idOrder;
    @ElementCollection(fetch = FetchType.EAGER)
    private Map<Long, Integer> orderMeal;
    private Long clientId;
    private Double costOrder;
    private String addressOrder;
    private String timeOrder;
    private boolean pickup;
    private boolean isDone;
}