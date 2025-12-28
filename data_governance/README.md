%md
# Documentação do Projeto: Governança de Dados e Métricas

## Visão Geral
Este projeto tem como objetivo estruturar e monitorar o ambiente Databricks, promovendo governança de dados e rastreabilidade das atividades dos usuários e do uso de recursos de IA. As tabelas criadas são fundamentais para garantir transparência, controle e auditoria dos acessos e ações realizadas na plataforma.

---

## Tabela: `users`
### Objetivo
Armazenar informações detalhadas dos usuários do ambiente, permitindo identificar perfis, áreas de atuação e períodos de acesso.

### Estrutura
* **email**: Email do usuário (chave primária).
* **user_info**: Struct com dados customizados:
  * `username`: Nome completo
  * `company`: Empresa
  * `area`: Área de atuação
  * `team`: Equipe
* **dt_ini**: Data inicial de acesso
* **dt_end**: Última data de acesso
* **status**: Ativo ou inativo

### Origem dos Dados
- Dados extraídos da tabela sistêmica `system.access.audit`.

### Pipeline
1. Exclui a tabela, se existir.
2. Cria a tabela com a estrutura definida.
3. Define `email` como chave primária.
4. Realiza streaming de dados da origem.
5. Insere dados:
   - Inclui novos usuários apenas se não existirem.
   - Atualiza datas de acesso conforme necessário.

### Boas Práticas
- Garantir unicidade do usuário pelo campo `email`.
- Preservar histórico de acesso para auditoria.
- Atualizar informações customizadas conforme mudanças organizacionais.

---

## Tabela: `users_usage`
### Objetivo
Registrar atividades dos usuários, agrupando por serviço e ação realizada, para rastrear o uso do ambiente.

### Estrutura
* **email**: Email do usuário (chave estrangeira).
* **usage_log**: Struct com detalhes da ação:
  * `service_name`: Nome do serviço
  * `action_name`: Nome da ação
* **event_date**: Data da ocorrência

### Origem dos Dados
- Dados extraídos da tabela sistêmica `system.access.audit`.

### Pipeline
1. Exclui a tabela, se existir.
2. Cria a tabela com a estrutura definida.
3. Define `email` como chave estrangeira.
4. Realiza streaming de dados da origem.
5. Insere registros de atividades conforme capturados.

### Boas Práticas
- Relacionar atividades ao usuário via chave estrangeira.
- Manter granularidade das ações para facilitar auditoria e análise de uso.

---

## Tabela: `ai_usage`
### Objetivo
Monitorar o uso de recursos de IA (Genie e Assistant) no ambiente, permitindo análise de adoção e impacto dessas ferramentas.

### Estrutura
* **email**: Email do usuário
* **service_name**: Serviço de IA utilizado (Genie ou Assistant)
* **event_date**: Data da ocorrência

### Origem dos Dados
- Genie: registros na tabela sistêmica `system.access.audit`.
- Assistant: registros na tabela sistêmica `system.access.assistant_events`.

### Pipeline
1. Exclui a tabela, se existir.
2. Cria a tabela com a estrutura definida.
3. Define `email` como chave estrangeira.
4. Realiza streaming de dados das origens.
5. Insere registros de uso de IA conforme capturados.

### Boas Práticas
- Segregar registros por tipo de serviço para facilitar análises comparativas.
- Garantir integridade referencial com a tabela de usuários.
- Atualizar periodicamente para refletir o uso real dos recursos.

---

## Considerações Gerais
- Todas as tabelas devem ser criadas com atenção à integridade referencial e à atualização dos dados.
- Recomenda-se versionar scripts de criação e ingestão para facilitar manutenção.
- Documentar alterações e evoluções do modelo para garantir rastreabilidade.
- Realizar auditorias periódicas para validar a consistência dos dados.

---

## Dashboard: `resources_monitor`
Visão geral do painel de monitoramento de serviços e utilização de recursos de IA.

<img width="1860" height="761" alt="image" src="https://github.com/user-attachments/assets/8cc0ee3e-3111-4776-86b9-0aa560cf7b71" />

<img width="1860" height="761" alt="image" src="https://github.com/user-attachments/assets/55a98b36-bf34-40be-879e-8514c18bf683" />



Esta documentação serve como referência para implementação, manutenção e auditoria do projeto de governança de dados no ambiente Databricks.
