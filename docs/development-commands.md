# Comandos de Desenvolvimento

Este projeto usa `Makefile` para automatizar tarefas de desenvolvimento.

## Comandos Principais

### Primeiro uso (configuração inicial)

```bash
make install    # Instala todas as dependências
```

### Desenvolvimento diário

```bash
make start-dev  # Inicia backend + frontend
make stop       # Para todos os processos
```

### Comandos individuais

```bash
make start-backend   # Apenas backend (porta 8080)
make start-frontend  # Apenas frontend (porta 3000)
```

### Build e testes

```bash
make build      # Compila backend e frontend
make test       # Executa todos os testes
make clean      # Limpa arquivos de build
```

### Docker (para deploy)

```bash
make docker-build  # Constrói imagens
make docker-up     # Inicia containers
make docker-down   # Para containers
```

### Ajuda

```bash
make help       # Lista todos os comandos
make            # Comando padrão (mostra ajuda)
```

## URLs do Desenvolvimento

- **Frontend**: http://localhost:3000
- **Backend**: http://localhost:8080
- **API Docs**: http://localhost:8080/swagger-ui.html

## Logs

Os logs dos processos ficam em:

- `backend.log` - Logs do Spring Boot
- `frontend.log` - Logs do React

## Troubleshooting

### Se os processos não pararem

```bash
make stop
# ou manualmente:
pkill -f "mvn spring-boot:run"
pkill -f "npm start"
```

### Se as portas estiverem ocupadas

```bash
# Verificar processos nas portas
lsof -i :3000  # Frontend
lsof -i :8080  # Backend

# Matar processo específico
kill -9 PID
```

### Reinstalar dependências

```bash
make clean
make install
```
