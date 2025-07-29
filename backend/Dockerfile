# Dockerfile para o backend Spring Boot
FROM openjdk:17-jdk-slim

WORKDIR /app

# Copiar arquivos de configuração do Maven
COPY pom.xml .
COPY src ./src

# Instalar Maven
RUN apt-get update && apt-get install -y maven

# Build da aplicação
RUN mvn clean package -DskipTests

# Expor porta
EXPOSE 8080

# Comando para executar a aplicação
CMD ["java", "-jar", "target/descarte-eletronico-0.0.1-SNAPSHOT.jar"]
