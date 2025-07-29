# Especificações Técnicas do Sistema

## Baseado na Planilha de Desfazimento de Bens

### Campos Obrigatórios para Equipamentos Eletrônicos

#### Informações Básicas

- **Número de Patrimônio**: Campo único identificador
- **Descrição do Bem**: Descrição detalhada do equipamento
- **Data de Aquisição**: Data de compra/aquisição
- **Valor de Aquisição**: Valor pago pelo equipamento
- **Estado de Conservação**: (Bom, Regular, Ruim, Inservível)

#### Especificações Técnicas (Computadores)

- **Marca do Computador**: Dell, HP, Lenovo, etc.
- **Modelo**: Modelo específico do equipamento
- **Processador**:
  - Marca (Intel, AMD)
  - Modelo (Core i5, Ryzen 5, etc.)
  - Clock (GHz)
- **Memória RAM**: Quantidade em GB
- **Armazenamento**:
  - Tipo (HDD, SSD)
  - Capacidade (GB/TB)
- **Sistema Operacional**: Windows, Linux, macOS

#### Especificações para Monitores

- **Marca**: Samsung, LG, Dell, etc.
- **Tamanho**: Polegadas
- **Resolução**: 1920x1080, 4K, etc.
- **Tipo de Painel**: LCD, LED, OLED

#### Especificações para Periféricos

- **Tipo**: Mouse, Teclado, Impressora, etc.
- **Marca**: Logitech, Microsoft, etc.
- **Modelo**: Modelo específico
- **Conectividade**: USB, Bluetooth, etc.

#### Informações de Descarte

- **Motivo do Descarte**:
  - Obsolescência
  - Defeito irreparável
  - Substituição
  - Fim da vida útil
- **Data do Descarte**: Data de retirada/descarte
- **Responsável**: Nome do colaborador responsável
- **Observações**: Comentários adicionais

### Funcionalidades do Sistema

#### 1. Interface de Cadastro

- Formulário dinâmico baseado no tipo de equipamento
- Validação de campos obrigatórios
- Upload de documentos/fotos (opcional)

#### 2. Geração de Relatórios

- **Excel (.xlsx)**: Planilha formatada com todos os dados
- **PDF**: Relatório profissional para arquivo/impressão
- Filtros por período, tipo de equipamento, responsável

#### 3. Sistema de Usuários

- Autenticação com JWT
- Níveis de acesso (Admin, Operador)
- Histórico de ações por usuário

#### 4. Dashboard

- Resumo de equipamentos descartados
- Gráficos por tipo, valor, período
- Estatísticas de descarte

### Banco de Dados (SQLite)

#### Tabela: users

- id (PK)
- username
- password (hash)
- role
- created_at

#### Tabela: equipments

- id (PK)
- patrimony_number
- description
- acquisition_date
- acquisition_value
- conservation_state
- brand
- model
- specifications (JSON)
- disposal_reason
- disposal_date
- responsible_user
- observations
- created_by (FK)
- created_at

#### Tabela: disposal_reports

- id (PK)
- file_name
- file_type (excel/pdf)
- equipment_ids (JSON)
- generated_by (FK)
- generated_at

### APIs REST

#### Autenticação

- POST /api/auth/login
- POST /api/auth/register

#### Equipamentos

- GET /api/equipments
- POST /api/equipments
- PUT /api/equipments/{id}
- DELETE /api/equipments/{id}

#### Relatórios

- POST /api/reports/excel
- POST /api/reports/pdf
- GET /api/reports/history
