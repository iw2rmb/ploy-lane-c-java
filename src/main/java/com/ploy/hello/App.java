package com.ploy.hello;

import static spark.Spark.*;

public class App {
  public static void main(String[] args) {
    port(Integer.parseInt(System.getenv().getOrDefault("PORT", "8080")));
    get("/healthz", (req, res) -> "ok");
    get("/", (req, res) -> "hello from ploy");
  }
}
