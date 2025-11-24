package com.example.backend.courses.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.backend.courses.domain.Course;

public interface CourseRepository extends JpaRepository<Course, Long> {
}
