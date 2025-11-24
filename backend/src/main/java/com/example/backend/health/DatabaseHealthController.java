package com.example.backend.health;

import java.util.HashMap;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Simple endpoint to quickly verify whether the application is able to talk to
 * MySQL using the configured DataSource.
 */
@RestController
@RequestMapping("/api/health")
public class DatabaseHealthController {

    private final JdbcTemplate jdbcTemplate;

    public DatabaseHealthController(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @GetMapping("/db")
    public ResponseEntity<Map<String, Object>> checkDatabase() {
        Map<String, Object> payload = new HashMap<>();
        try {
            String version = jdbcTemplate.queryForObject("select version()", String.class);
            payload.put("database", "mysql");
            payload.put("status", "UP");
            payload.put("version", version);
            return ResponseEntity.ok(payload);
        } catch (DataAccessException ex) {
            payload.put("database", "mysql");
            payload.put("status", "DOWN");
            payload.put("message", ex.getMostSpecificCause().getMessage());
            return ResponseEntity.status(HttpStatus.SERVICE_UNAVAILABLE).body(payload);
        }
    }
}
