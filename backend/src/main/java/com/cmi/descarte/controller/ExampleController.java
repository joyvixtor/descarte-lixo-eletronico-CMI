package com.cmi.descarte.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class ExampleController {

    @GetMapping("/hello")
    public String hello() {
        return "Hello from Descarte Eletrônico API!";
    }
}
