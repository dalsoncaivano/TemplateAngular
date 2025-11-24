package com.example.backend.courses.dto;

import java.time.LocalDateTime;

public record CourseResponse(
        Long id,
        String nome,
        String descricao,
        String imagem,
        Boolean ativo,
        LocalDateTime dataCadastro) {
}
