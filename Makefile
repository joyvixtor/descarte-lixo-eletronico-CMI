# Makefile para o Sistema de Descarte de Lixo Eletrônico - CMI

.PHONY: help install check-deps start-backend start-frontend start-dev stop clean build test docker-build docker-up docker-down

# Variáveis
BACKEND_DIR = backend
FRONTEND_DIR = frontend
BACKEND_JAR = $(BACKEND_DIR)/target/descarte-eletronico-0.0.1-SNAPSHOT.jar

# Ajuda - comando padrão
help:
	@echo "Sistema de Descarte de Lixo Eletrônico - CMI"
	@echo ""
	@echo "Comandos disponíveis:"
	@echo "  make install       - Instala todas as dependências"
	@echo "  make check-deps    - Verifica se as dependências estão instaladas"
	@echo "  make start-dev     - Inicia ambiente de desenvolvimento completo"
	@echo "  make start-backend - Inicia apenas o backend"
	@echo "  make start-frontend- Inicia apenas o frontend"
	@echo "  make build         - Faz build de backend e frontend"
	@echo "  make test          - Executa testes"
	@echo "  make clean         - Limpa arquivos de build"
	@echo "  make docker-build  - Constrói imagens Docker"
	@echo "  make docker-up     - Inicia containers Docker"
	@echo "  make docker-down   - Para containers Docker"
	@echo "  make stop          - Para todos os processos"

# Verificar dependências
check-deps:
	@echo "📋 Verificando dependências..."
	@command -v java >/dev/null 2>&1 || (echo "❌ Java não encontrado. Instale Java 17+" && exit 1)
	@command -v mvn >/dev/null 2>&1 || (echo "❌ Maven não encontrado. Instale Maven" && exit 1)
	@command -v node >/dev/null 2>&1 || (echo "❌ Node.js não encontrado. Instale Node.js 18+" && exit 1)
	@command -v npm >/dev/null 2>&1 || (echo "❌ npm não encontrado. Instale npm" && exit 1)
	@echo "✅ Todas as dependências encontradas"

# Instalar dependências
install: check-deps
	@echo "📦 Instalando dependências do frontend..."
	@cd $(FRONTEND_DIR) && npm install
	@echo "✅ Dependências instaladas com sucesso"

# Compilar backend
$(BACKEND_JAR): $(BACKEND_DIR)/pom.xml $(shell find $(BACKEND_DIR)/src -name "*.java")
	@echo "🔨 Compilando backend..."
	@cd $(BACKEND_DIR) && mvn clean package -DskipTests
	@echo "✅ Backend compilado"

# Build completo
build: $(BACKEND_JAR)
	@echo "🔨 Fazendo build do frontend..."
	@cd $(FRONTEND_DIR) && npm run build
	@echo "✅ Build completo finalizado"

# Iniciar backend
start-backend: check-deps $(BACKEND_JAR)
	@echo "🔧 Iniciando backend Spring Boot..."
	@cd $(BACKEND_DIR) && mvn spring-boot:run

# Iniciar frontend
start-frontend: check-deps install
	@echo "🎨 Iniciando frontend React..."
	@cd $(FRONTEND_DIR) && npm start

# Iniciar ambiente de desenvolvimento completo
start-dev: check-deps install
	@echo "🚀 Iniciando ambiente de desenvolvimento completo..."
	@echo "🔧 Iniciando backend..."
	@cd $(BACKEND_DIR) && mvn spring-boot:run > backend.log 2>&1 & echo $$! > backend.pid
	@echo "⏳ Aguardando backend inicializar..."
	@sleep 30
	@echo "🎨 Iniciando frontend..."
	@cd $(FRONTEND_DIR) && npm start > frontend.log 2>&1 & echo $$! > frontend.pid
	@echo ""
	@echo "🎉 Ambiente de desenvolvimento iniciado!"
	@echo "📱 Frontend: http://localhost:3000"
	@echo "🔧 Backend: http://localhost:8080"
	@echo "📖 API Docs: http://localhost:8080/swagger-ui.html"
	@echo ""
	@echo "Para parar o ambiente, execute: make stop"

# Parar processos
stop:
	@echo "🛑 Parando ambiente de desenvolvimento..."
	@if [ -f backend.pid ]; then \
		kill `cat backend.pid` 2>/dev/null || true; \
		rm -f backend.pid; \
	fi
	@if [ -f frontend.pid ]; then \
		kill `cat frontend.pid` 2>/dev/null || true; \
		rm -f frontend.pid; \
	fi
	@pkill -f "mvn spring-boot:run" 2>/dev/null || true
	@pkill -f "npm start" 2>/dev/null || true
	@echo "✅ Processos parados"

# Executar testes
test: check-deps
	@echo "🧪 Executando testes do backend..."
	@cd $(BACKEND_DIR) && mvn test
	@echo "🧪 Executando testes do frontend..."
	@cd $(FRONTEND_DIR) && npm test -- --coverage --watchAll=false

# Limpar arquivos de build
clean:
	@echo "🧹 Limpando arquivos de build..."
	@cd $(BACKEND_DIR) && mvn clean
	@cd $(FRONTEND_DIR) && rm -rf build node_modules
	@rm -f *.pid *.log
	@echo "✅ Limpeza concluída"

# Docker - Build das imagens
docker-build:
	@echo "🐳 Construindo imagens Docker..."
	@docker-compose build
	@echo "✅ Imagens Docker construídas"

# Docker - Iniciar containers
docker-up:
	@echo "🐳 Iniciando containers Docker..."
	@docker-compose up -d
	@echo "✅ Containers iniciados"
	@echo "📱 Aplicação: http://localhost"
	@echo "🔧 Backend: http://localhost:8080"

# Docker - Parar containers
docker-down:
	@echo "🐳 Parando containers Docker..."
	@docker-compose down
	@echo "✅ Containers parados"

# Desenvolvimento rápido (instala deps + inicia dev)
dev: install start-dev

# Deploy em produção
deploy: build docker-build
	@echo "Executando deploy..."
	@echo "📋 Verifique o arquivo docs/deploy-guide.md para instruções completas"
