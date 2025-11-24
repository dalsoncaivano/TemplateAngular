## Backend (Spring Boot + MySQL)

### Requisitos

- Java 17+
- Maven (opcional, pois o wrapper `mvnw` já está incluído)
- Banco MySQL acessível localmente (ou ajuste as variáveis conforme necessário)

### Variáveis de ambiente

As credenciais possuem valores padrão iguais aos informados, mas podem ser sobrescritas usando variáveis de ambiente ou um arquivo `.env` na pasta `backend/`.

```properties
DB_HOST=localhost
DB_PORT=3306
DB_NAME=fourtalentsacademy
DB_USER=root
DB_PASSWORD=!K27Zf49
DB_CONNECTION_LIMIT=10
DB_TIMEZONE=UTC
```

> O arquivo `.env` é carregado automaticamente graças à diretiva `spring.config.import=optional:file:.env[.properties]`.

### Executando localmente

1. Entre na pasta `backend/`.
2. (Opcional) Crie/ajuste o `.env` com as credenciais desejadas.
3. Execute `./mvnw spring-boot:run` (Linux/macOS) ou `mvnw.cmd spring-boot:run` (Windows).

O endpoint `GET http://localhost:8080/api/health/db` tenta executar `SELECT VERSION()` e retorna o status da conexão com o MySQL.
