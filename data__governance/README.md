# 1. Databricks - Schema: data_governance
Schema de governança de dados e métricas.

## 1.1. Visão Geral
As tabelas a serem criadas visam a governança do ambiente e serão divididas nas seguintes frentes:
- **users**: Informações dos usuários, cargos e funções.
- **users_usage**: Atividades realizadas no ambiente.
- **ai_usage**: Métricas de uso de recursos *Genie* e *AI Assistant*.

---

## 1.2. Tabela: users
Referência da relação de todos os usuários do ambiente.

### 1.2.1. Descrição das Colunas (users)
- **email**: Email do usuário.
- **user_info**: Struct contendo:
    - **username**: Nome completo.
    - **company**: Empresa.
    - **area**: Área de atuação.
    - **team**: Equipe.
- **dt_ini**: Data inicial de acesso.
- **dt_end**: Última data de acesso.
- **status**: Ativo ou inativo.

---

## 1.3. Tabela: users_usage
Atividades de usuários agrupadas por serviços.

### 1.3.1. Descrição das Colunas (users_usage)
- **email**: Email do usuário.
- **usage_log**: Struct contendo:
    - **service_name**: Nome do serviço.
    - **action_name**: Nome da ação realizada.
- **event_date**: Data da ocorrência.

---

## 1.4. Tabela: ai_usage
Monitoramento de atividades utilizando IA (Genie e Assistant).

### 1.4.1. Descrição das Colunas (ai_usage)
- **email**: Email do usuário.
- **service_name**: Serviço de IA utilizado (Genie ou Assistant).
- **event_date**: Data da ocorrência.
