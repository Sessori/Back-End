-- Criar ENUM para status da Reserva
CREATE TYPE status_reserva AS ENUM ('Ativa', 'Cancelada');

-- Criar ENUM para status da Solicitação de Recurso
CREATE TYPE status_solicitacao AS ENUM ('Pendente', 'Concluída', 'Rejeitada');

-- Tabela de Usuário
CREATE TABLE usuario (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    ativo BOOLEAN DEFAULT TRUE,
    realizar_reservas_fixas BOOLEAN DEFAULT FALSE,
    administrador BOOLEAN DEFAULT FALSE,
    foto TEXT,        
    fotoPath TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now() 
);

-- Tabela de Espaço
CREATE TABLE espaco (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    andar VARCHAR(10),
    capacidade INT NOT NULL,
    disponibilidade_reserva_fixa BOOLEAN DEFAULT TRUE,
    ativo BOOLEAN DEFAULT TRUE
);

-- Tabela de Recurso
CREATE TABLE recurso (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela associativa entre Espaco e Recurso
CREATE TABLE espaco_recurso (
    espaco_codigo INT NOT NULL,
    recurso_codigo INT NOT NULL,
    PRIMARY KEY (espaco_codigo, recurso_codigo),
    FOREIGN KEY (espaco_codigo) REFERENCES espaco(codigo) ON DELETE CASCADE,
    FOREIGN KEY (recurso_codigo) REFERENCES recurso(codigo) ON DELETE CASCADE
);

-- Tabela de Reserva
CREATE TABLE reserva (
    codigo SERIAL PRIMARY KEY,
    data DATE NOT NULL,
    horario TIME NOT NULL,
    status status_reserva DEFAULT 'Ativa',
    usuario_codigo INT NOT NULL,
    espaco_codigo INT NOT NULL,
    FOREIGN KEY (usuario_codigo) REFERENCES usuario(codigo) ON DELETE CASCADE,
    FOREIGN KEY (espaco_codigo) REFERENCES espaco(codigo) ON DELETE CASCADE
);

-- Tabela de Notificação
CREATE TABLE notificacao (
    codigo SERIAL PRIMARY KEY,
    mensagem TEXT NOT NULL,
    grupo_whatsapp VARCHAR(255),
    reserva_codigo INT,
    FOREIGN KEY (reserva_codigo) REFERENCES reserva(codigo) ON DELETE SET NULL
);

-- Tabela de Solicitação de Recurso
CREATE TABLE solicitacao_recurso (
    codigo SERIAL PRIMARY KEY,
    status status_solicitacao DEFAULT 'Pendente',
    recurso_codigo INT NOT NULL,
    usuario_codigo INT NOT NULL,
    espaco_codigo INT NOT NULL,
    FOREIGN KEY (recurso_codigo) REFERENCES recurso(codigo) ON DELETE CASCADE,
    FOREIGN KEY (usuario_codigo) REFERENCES usuario(codigo) ON DELETE CASCADE,
    FOREIGN KEY (espaco_codigo) REFERENCES espaco(codigo) ON DELETE CASCADE
);

-- Tabela de Aula
CREATE TABLE aula (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    usuario_codigo INT NOT NULL,
    FOREIGN KEY (usuario_codigo) REFERENCES usuario(codigo) ON DELETE CASCADE
);