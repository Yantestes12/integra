-- ============================================================
-- SCRIPT DE CRIAÇÃO DA TABELA COMPLETA: GASCTPNA_matricula
-- Compatível com MySQL / MariaDB / phpMyAdmin (Campos de texto como TEXT)
-- Mapeia 100% dos campos do formulário matricula_aluno.html + campo TURMA
-- ============================================================

CREATE TABLE IF NOT EXISTS `GASCTPNA_matricula` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `status` TEXT NOT NULL,
  `origem_cadastro` TEXT DEFAULT NULL,
  `validation_token` TEXT DEFAULT NULL,

  -- IDs de Relacionamento
  `projeto_id` INT UNSIGNED DEFAULT NULL,
  `cidade_id` INT DEFAULT NULL,
  `bairro_id` INT DEFAULT NULL,
  `modalidade_id` INT DEFAULT NULL,
  `nucleo_id` INT UNSIGNED DEFAULT NULL,
  `portal_usuario_id` INT DEFAULT NULL,

  -- Alocação (Turma e Turno)
  `turma` TEXT DEFAULT NULL COMMENT 'Turma definida no n8n para alocação do aluno',
  `turno` TEXT DEFAULT NULL COMMENT 'Manhã, Tarde, Noite',

  -- Dados de Identificação do Aluno
  `aluno_cpf` TEXT NOT NULL,
  `aluno_nome` TEXT NOT NULL,
  `chk_usar_nome_social` TINYINT(1) DEFAULT '0',
  `nome_social` TEXT DEFAULT NULL,
  `data_nascimento` DATE DEFAULT NULL,
  `sexo` TEXT DEFAULT NULL,
  `idade` INT DEFAULT NULL,

  -- Medidas Físicas e Uniforme
  `altura` SMALLINT UNSIGNED DEFAULT NULL COMMENT 'Altura em cm',
  `peso` DECIMAL(5,2) DEFAULT NULL COMMENT 'Peso em kg',
  `tamanho_calcado` TEXT DEFAULT NULL COMMENT 'Número do calçado',
  `tamanho_camisa` TEXT DEFAULT NULL COMMENT 'Tamanho da camisa (10, 14, M, GG...)',
  `tamanho_calca` TEXT DEFAULT NULL COMMENT 'Tamanho da bermuda/calça',

  -- Dados Pessoais e Acadêmicos
  `raca` TEXT DEFAULT NULL,
  `naturalidade` TEXT DEFAULT NULL,
  `escolaridade` TEXT DEFAULT NULL,

  -- Endereço
  `cep` TEXT DEFAULT NULL,
  `endereco` TEXT DEFAULT NULL,
  `numero` TEXT DEFAULT NULL,
  `complemento` TEXT DEFAULT NULL,
  `bairro` TEXT DEFAULT NULL,
  `cidade` TEXT DEFAULT NULL,
  `uf` TEXT DEFAULT NULL,

  -- Renda Familiar e Contatos do Aluno
  `faixa_salarial` TEXT DEFAULT NULL,
  `whatsapp` TEXT DEFAULT NULL,
  `profissao` TEXT DEFAULT NULL,
  `email` TEXT DEFAULT NULL,

  -- Responsável Legal (Alunos menores de idade)
  `resp_cpf` TEXT DEFAULT NULL,
  `resp_nome` TEXT DEFAULT NULL,
  `resp_nome_social` TEXT DEFAULT NULL,
  `resp_data_nasc` DATE DEFAULT NULL,
  `resp_sexo` TEXT DEFAULT NULL,
  `resp_raca` TEXT DEFAULT NULL,
  `resp_email` TEXT DEFAULT NULL,
  `resp_whatsapp` TEXT DEFAULT NULL,
  `resp_escolaridade` TEXT DEFAULT NULL,
  `resp_profissao` TEXT DEFAULT NULL,

  -- Questionário de Saúde (Perguntas 1 a 6 + Detalhes)
  `uso_medicacao` TEXT DEFAULT NULL,
  `uso_medicacao_detalhes` TEXT DEFAULT NULL,

  `possui_alergias` TEXT DEFAULT NULL,
  `possui_alergias_detalhes` TEXT DEFAULT NULL,

  `plano_saude` TEXT DEFAULT NULL,
  `plano_saude_detalhes` TEXT DEFAULT NULL,

  `acompan_medico` TEXT DEFAULT NULL,
  `acompan_medico_detalhes` TEXT DEFAULT NULL,

  `restricao_fisica` TEXT DEFAULT NULL,
  `restricao_fisica_detalhes` TEXT DEFAULT NULL,

  `necessidade_especial` TEXT DEFAULT NULL,
  `necessidade_especial_detalhes` TEXT DEFAULT NULL,

  -- Documentos / Laudos
  `deseja_laudo` TEXT DEFAULT NULL,
  `documentos_urls` TEXT DEFAULT NULL,

  -- Redes Sociais
  `rede_social_tipo` TEXT DEFAULT NULL,
  `rede_social_link` TEXT DEFAULT NULL,
  `instagram` TEXT DEFAULT NULL,
  `tiktok` TEXT DEFAULT NULL,
  `facebook` TEXT DEFAULT NULL,
  `youtube` TEXT DEFAULT NULL,
  `twitter_x` TEXT DEFAULT NULL,

  -- Termos e LGPD
  `lgpd_aceite` TINYINT(1) NOT NULL DEFAULT '0',
  `lgpd_aceite_em` DATETIME DEFAULT NULL,
  `lgpd_versao` TEXT DEFAULT NULL,
  `aceite_veracidade` TINYINT(1) NOT NULL DEFAULT '0',
  `aceite_veracidade_em` DATETIME DEFAULT NULL,
  `aceite_veracidade_versao` TEXT DEFAULT NULL,

  PRIMARY KEY (`id`),
  KEY `idx_aluno_cpf` (`aluno_cpf`(50)),
  KEY `idx_projeto_id` (`projeto_id`),
  KEY `idx_cidade_id` (`cidade_id`),
  KEY `idx_bairro_id` (`bairro_id`),
  KEY `idx_modalidade_id` (`modalidade_id`),
  KEY `idx_nucleo_id` (`nucleo_id`),
  KEY `idx_turma` (`turma`(50))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
