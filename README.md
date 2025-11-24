## Centro de Formação – Monorepo

Este repositório agora contém as duas camadas do projeto:

- `frontend/`: aplicativo Angular (LandingPrimeng) com todos os assets, configs e scripts originais.
- `backend/`: API Spring Boot configurada para acessar o MySQL local usando o pool informado anteriormente.

### Como executar

1. **Frontend**
   - `cd frontend`
   - `npm install` (apenas na primeira vez).
   - `npm start` para subir `http://localhost:4200/`.
2. **Backend**
   - `cd backend`
   - Configure um `.env` se precisar alterar host/usuário/senha (os valores padrão apontam para MySQL local).
   - `mvnw.cmd spring-boot:run` (Windows) ou `./mvnw spring-boot:run` (Linux/macOS) para iniciar `http://localhost:8080/`.

Cada pasta possui um README com mais detalhes específicos. Ajuste os dois serviços conforme necessário para integrar Angular ↔ Spring ↔ MySQL.
