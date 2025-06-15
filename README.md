# SESSORI - Backend

Este é o backend do SESSORI, uma aplicação web para reservas de espaços e recursos educacionais.

## 🚀 Funcionalidades

- Gerenciamento de usuários (Administrador, Docente)
- Cadastro de espaços (salas, laboratórios, auditórios)
- Sistema de reservas com controle de disponibilidade
- Integração com API de WhatsApp para notificações (até 06/2025 como projeto de melhoria)
- Suporte para integração com fechaduras eletrônicas (até 06/2025 como projeto de melhoria)
- Login seguro com autenticação
- Notificações sobre mudanças nas reservas (até 06/2025 como projeto de melhoria)

## 🏗️ Tecnologias Utilizadas

- 🔗 **Supabase** - Backend as a Service
- 🗄️ **PostgreSQL** - Banco de dados relacional
- 🔐 **Supabase Auth** - Autenticação e autorização
- 🌐 **Supabase Storage** - Armazenamento de arquivos
- 📡 **Supabase Functions** - Funções serverless
- 🔔 **API Externa para WhatsApp** - Notificações (até 06/2025 como projeto de melhoria)

## 🔑 Acesso ao Backend (Supabase)

Toda a configuração do backend é feita via Supabase:

1. Acesse: [https://app.supabase.com/](https://app.supabase.com/)
2. Faça login e acesse o projeto SESSORI.
3. No painel do Supabase você pode gerenciar:
   - **Banco de Dados** (via SQL Editor ou Table Editor)
   - **Regras de Autorização (Policies - RLS)**
   - **Armazenamento de Arquivos**
   - **Funções Serverless (Opcional)**
   - **API REST e GraphQL (Documentação automática)**

### 🔗 API REST:

O Supabase gera automaticamente uma API REST para todas as tabelas.
