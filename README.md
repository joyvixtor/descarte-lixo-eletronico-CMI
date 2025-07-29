# Sistema de Descarte de Lixo Eletrônico - CMI

## Descrição

Sistema para gerenciamento e descarte de produtos eletrônicos com interface gráfica, geração de relatórios em Excel e PDF, e sistema de autenticação.

## Tecnologias Utilizadas

- **Backend**: Spring Boot (Java 17)
- **Frontend**: React.js
- **Banco de Dados**: SQLite
- **Autenticação**: JWT
- **Relatórios**: Apache POI (Excel) + iText (PDF)

## Estrutura do Projeto

```
descarte-lixo-eletronico-CMI/
├── backend/                 # API Spring Boot
│   ├── src/main/java/      # Código fonte Java
│   ├── src/main/resources/ # Configurações
│   └── pom.xml            # Dependências Maven
├── frontend/               # Aplicação React
│   ├── src/               # Código fonte React
│   ├── public/            # Arquivos públicos
│   └── package.json       # Dependências npm
├── docs/                  # Documentação
└── README.md
```

## Como Executar Localmente

### Método Recomendado (usando Makefile)

```bash
# Primeiro uso - instalar dependências
make install

# Iniciar ambiente completo de desenvolvimento
make start-dev

# Para parar o ambiente
make stop
```

### URLs de Desenvolvimento

- **Frontend**: http://localhost:3000
- **Backend**: http://localhost:8080
- **API Docs**: http://localhost:8080/swagger-ui.html

### Comandos Úteis

```bash
make help          # Ver todos os comandos disponíveis
make check-deps    # Verificar dependências instaladas
make build         # Compilar backend e frontend
make test          # Executar testes
make clean         # Limpar arquivos de build
```

### Método Manual (alternativo)

```bash
# Backend
cd backend
mvn spring-boot:run

# Frontend (em outro terminal)
cd frontend
npm install
npm start
```

## Funcionalidades Planejadas

- ✅ Estrutura inicial configurada
- ✅ Makefile para automação de desenvolvimento
- ✅ Configuração Docker para deploy
- [ ] Sistema de autenticação de usuários
- [ ] Interface para cadastro de equipamentos eletrônicos
- [ ] Geração de relatórios Excel e PDF
- [ ] Dashboard para visualização de dados
- [ ] Sistema de histórico de descartes
- [ ] Deploy em VM

## Deploy

Instruções de deploy serão adicionadas conforme o desenvolvimento avança.

## Desenvolvimento

Este projeto está em fase inicial de desenvolvimento. Os arquivos de exemplo foram criados para permitir commits iniciais e estruturação do repositório.
