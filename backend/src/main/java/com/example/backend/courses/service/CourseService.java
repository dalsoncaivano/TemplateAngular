package com.example.backend.courses.service;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.backend.courses.domain.Course;
import com.example.backend.courses.dto.CourseResponse;
import com.example.backend.courses.repository.CourseRepository;

@Service
public class CourseService {

    private final CourseRepository repository;

    public CourseService(CourseRepository repository) {
        this.repository = repository;
    }

    public List<CourseResponse> listAll() {
        return repository.findAll(Sort.by(Sort.Direction.ASC, "nome"))
                .stream()
                .map(CourseService::toResponse)
                .toList();
    }

    private static CourseResponse toResponse(Course course) {
        return new CourseResponse(
                course.getId(),
                course.getNome(),
                course.getDescricao(),
                course.getImagem(),
                course.getAtivo(),
                course.getDataCadastro());
    }
}
