-- Gerado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   em:        2026-09-17 22:55:19 BRT
--   site:      Oracle Database 21c
--   tipo:      Oracle Database 21c



DROP TABLE T_CERTIFICADO CASCADE CONSTRAINTS 
;

DROP TABLE T_CLIENTE CASCADE CONSTRAINTS 
;

DROP TABLE T_EMPRESA CASCADE CONSTRAINTS 
;

DROP TABLE T_FECHAMENTO CASCADE CONSTRAINTS 
;

DROP TABLE T_PARCEIRO CASCADE CONSTRAINTS 
;

DROP TABLE T_PARCERIA_COMISSAO CASCADE CONSTRAINTS 
;

DROP TABLE T_PARCERIA_REPASSE CASCADE CONSTRAINTS 
;

DROP TABLE T_PARCERIA_REVENDA CASCADE CONSTRAINTS 
;

DROP TABLE T_PARCERIALOTE CASCADE CONSTRAINTS 
;

DROP TABLE T_VENDA CASCADE CONSTRAINTS 
;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE T_CERTIFICADO 
    ( 
     id_certificado NUMBER (5)  NOT NULL , 
     tp_modelo      VARCHAR2 (10)  NOT NULL , 
     dt_validade    NUMBER (3)  NOT NULL , 
     tp_pessoa      CHAR (1 CHAR)  NOT NULL 
    ) 
;

COMMENT ON COLUMN T_CERTIFICADO.id_certificado IS 'ID' 
;

COMMENT ON COLUMN T_CERTIFICADO.tp_modelo IS 'Tipo do modelo do certificado A1 ou A3' 
;

COMMENT ON COLUMN T_CERTIFICADO.dt_validade IS 'Duração da validade em meses' 
;

COMMENT ON COLUMN T_CERTIFICADO.tp_pessoa IS 'Tipo ECPF ou ECNPJ' 
;

ALTER TABLE T_CERTIFICADO 
    ADD CONSTRAINT CK_TIPO_CERTIFICADO 
    CHECK (tp_pessoa IN ('F','J'))
;


ALTER TABLE T_CERTIFICADO 
    ADD CONSTRAINT CK_MODELO_CERTIFICADO 
    CHECK (tp_modelo IN ('A1','A3','SYN'))
;
ALTER TABLE T_CERTIFICADO 
    ADD CONSTRAINT T_CERTIFICADO_PK PRIMARY KEY ( id_certificado ) ;

CREATE TABLE T_CLIENTE 
    ( 
     id_cliente    NUMBER (5)  NOT NULL , 
     nr_cpf        VARCHAR2 (11)  NOT NULL , 
     nm_cliente    VARCHAR2 (100)  NOT NULL , 
     dt_nascimento DATE  NOT NULL , 
     ds_email      VARCHAR2 (100)  NOT NULL , 
     nm_telefone   VARCHAR2 (20)  NOT NULL , 
     nr_conta_syn  VARCHAR2 (20)  NOT NULL 
    ) 
;

COMMENT ON COLUMN T_CLIENTE.id_cliente IS 'Identificado padrão' 
;

COMMENT ON COLUMN T_CLIENTE.nr_cpf IS 'Número do CPF' 
;

COMMENT ON COLUMN T_CLIENTE.nm_cliente IS 'Nome completo' 
;

COMMENT ON COLUMN T_CLIENTE.dt_nascimento IS 'Data de nascimento' 
;

COMMENT ON COLUMN T_CLIENTE.ds_email IS 'endereço de email' 
;

COMMENT ON COLUMN T_CLIENTE.nm_telefone IS 'Número de telefone' 
;

COMMENT ON COLUMN T_CLIENTE.nr_conta_syn IS 'Conta syn para emissão online' 
;

ALTER TABLE T_CLIENTE 
    ADD CONSTRAINT CK_T_CLIENTE_CPF 
    CHECK (REGEXP_LIKE(nr_cpf, '^([0-9]{11})$'))
;


ALTER TABLE T_CLIENTE 
    ADD CONSTRAINT CK_T_CLIENTE_EMAIL 
    CHECK (REGEXP_LIKE(ds_email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'))
;
ALTER TABLE T_CLIENTE 
    ADD CONSTRAINT T_CLIENTE_PK PRIMARY KEY ( id_cliente ) ;

ALTER TABLE T_CLIENTE 
    ADD CONSTRAINT UN_T_CLIENTE_CPF UNIQUE ( nr_cpf ) ;

ALTER TABLE T_CLIENTE 
    ADD CONSTRAINT UN_T_CLIENTE_EMAIL UNIQUE ( ds_email ) ;

CREATE TABLE T_EMPRESA 
    ( 
     id_empresa      NUMBER (5)  NOT NULL , 
     id_cliente      NUMBER (5)  NOT NULL , 
     nr_cnpj         VARCHAR2 (14)  NOT NULL , 
     nm_razao_social VARCHAR2 (100)  NOT NULL 
    ) 
;

COMMENT ON COLUMN T_EMPRESA.id_empresa IS 'Identificador padrão' 
;

COMMENT ON COLUMN T_EMPRESA.nr_cnpj IS 'Número do CNPJ' 
;

COMMENT ON COLUMN T_EMPRESA.nm_razao_social IS 'Nome da empresa na Receita Federal' 
;

ALTER TABLE T_EMPRESA 
    ADD CONSTRAINT CK_T_EMPRESA_CNPJ 
    CHECK (REGEXP_LIKE(nr_cnpj, '^([0-9]{14})$'))
;
ALTER TABLE T_EMPRESA 
    ADD CONSTRAINT T_EMPRESA_PK PRIMARY KEY ( id_empresa ) ;

ALTER TABLE T_EMPRESA 
    ADD CONSTRAINT UN_T_EMPRESA_CNPJ UNIQUE ( nr_cnpj ) ;

CREATE TABLE T_FECHAMENTO 
    ( 
     id_fechamento         NUMBER (5)  NOT NULL , 
     id_parceiro           NUMBER (5)  NOT NULL , 
     dt_pagamento_comissao DATE  NOT NULL , 
     vl_pago               NUMBER (7,2)  NOT NULL , 
     tp_parceria           VARCHAR2 (20)  NOT NULL 
    ) 
;

COMMENT ON COLUMN T_FECHAMENTO.id_fechamento IS 'Identificador de cada fechamento' 
;

COMMENT ON COLUMN T_FECHAMENTO.dt_pagamento_comissao IS 'Dia do pagamento da comissão' 
;

COMMENT ON COLUMN T_FECHAMENTO.vl_pago IS 'Valor pago para contabilidade ' 
;

COMMENT ON COLUMN T_FECHAMENTO.tp_parceria IS 'COMISSÃO; REVENDA; REPASSE; LOTE' 
;

ALTER TABLE T_FECHAMENTO 
    ADD CONSTRAINT CK_T_FECHAMENTO_PARCERIA 
    CHECK (tp_parceria IN ('COMISSAO','REVENDA','REPASSE','LOTE'))
;


ALTER TABLE T_FECHAMENTO 
    ADD CONSTRAINT CK_T_FECHAMENTO_PAGO 
    CHECK (vl_pago >= 0)
;
ALTER TABLE T_FECHAMENTO 
    ADD CONSTRAINT T_FECHAMENTO_PK PRIMARY KEY ( id_fechamento ) ;

CREATE TABLE T_PARCEIRO 
    ( 
     id_parceiro  NUMBER (5)  NOT NULL , 
     ds_chave_pix VARCHAR2 (100)  NOT NULL , 
     ds_endereço  VARCHAR2 (100)  NOT NULL , 
     nm_telefonel VARCHAR2 (15)  NOT NULL , 
     nr_cpf_cnpj  VARCHAR2 (14)  NOT NULL , 
     nm_parceiro  VARCHAR2 (100)  NOT NULL , 
     ds_email     VARCHAR2 (100)  NOT NULL , 
     tp_parceria  VARCHAR2 (10)  NOT NULL , 
     st_ativo     CHAR (1 CHAR)  NOT NULL 
    ) 
;

COMMENT ON COLUMN T_PARCEIRO.id_parceiro IS 'Identificado do parceiro' 
;

COMMENT ON COLUMN T_PARCEIRO.ds_chave_pix IS 'Chave para pagamento das comissões' 
;

COMMENT ON COLUMN T_PARCEIRO.ds_endereço IS 'Endereço da contabilidade' 
;

COMMENT ON COLUMN T_PARCEIRO.nm_telefonel IS 'Número de contato, preferência WhatsApp' 
;

COMMENT ON COLUMN T_PARCEIRO.nr_cpf_cnpj IS 'Número do CNPJ ou CPF' 
;

COMMENT ON COLUMN T_PARCEIRO.nm_parceiro IS 'Nome do parceiro ou contabilidade' 
;

COMMENT ON COLUMN T_PARCEIRO.ds_email IS 'Endereço de email' 
;

COMMENT ON COLUMN T_PARCEIRO.tp_parceria IS 'Modelo de parceria valido pelo check' 
;

ALTER TABLE T_PARCEIRO 
    ADD CONSTRAINT CK_T_PARCEIRO_PARCERIA 
    CHECK (tp_parceria in ('COMISSAO', 'REVENDA', 'REPASSE','LOTE'))
;


ALTER TABLE T_PARCEIRO 
    ADD CONSTRAINT CK_T_PARCEIRO_EMAIL 
    CHECK (REGEXP_LIKE(ds_email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'))
;


ALTER TABLE T_PARCEIRO 
    ADD CONSTRAINT CK_T_PARCEIRO_CPF_CNPJ 
    CHECK (REGEXP_LIKE(nr_cpf_cnpj, '^([0-9]{11}|[0-9]{14})$'))
;


ALTER TABLE T_PARCEIRO 
    ADD CONSTRAINT CK_T_PARCEIRO_ATIVO 
    CHECK (UPPER(st_ativo) IN ('S','N'))
;
ALTER TABLE T_PARCEIRO 
    ADD CONSTRAINT T_PARCEIRO_PK PRIMARY KEY ( id_parceiro ) ;

ALTER TABLE T_PARCEIRO 
    ADD CONSTRAINT UN_T_PARCEIRO_CPF_CNPJ UNIQUE ( nr_cpf_cnpj ) ;

CREATE TABLE T_PARCERIA_COMISSAO 
    ( 
     id_parceiro            NUMBER (5)  NOT NULL , 
     vl_percentual_comissao NUMBER (2)  NOT NULL 
    ) 
;

ALTER TABLE T_PARCERIA_COMISSAO 
    ADD CONSTRAINT T_PARCERIA_COMISSAO_PK PRIMARY KEY ( id_parceiro ) ;

CREATE TABLE T_PARCERIA_REPASSE 
    ( 
     id_parceiro        NUMBER (5)  NOT NULL , 
     frequencia_repasse VARCHAR2 (20)  NOT NULL 
    ) 
;

COMMENT ON COLUMN T_PARCERIA_REPASSE.frequencia_repasse IS 'SEMANAL; MENSAL' 
;

ALTER TABLE T_PARCERIA_REPASSE 
    ADD CONSTRAINT CK_FREQUENCIA_REPASSE 
    CHECK (frequencia_repasse IN ('SEMANAL','MENSAL'))
;
ALTER TABLE T_PARCERIA_REPASSE 
    ADD CONSTRAINT T_PARCERIA_REPASSE_PK PRIMARY KEY ( id_parceiro ) ;

CREATE TABLE T_PARCERIA_REVENDA 
    ( 
     id_parceiro NUMBER (5)  NOT NULL , 
     vl_revenda  NUMBER (7,2)  NOT NULL 
    ) 
;

ALTER TABLE T_PARCERIA_REVENDA 
    ADD CONSTRAINT T_PARCEIRA__REVENDA_PK PRIMARY KEY ( id_parceiro ) ;

CREATE TABLE T_PARCERIALOTE 
    ( 
     id_lote                   NUMBER (5)  NOT NULL , 
     id_parceiro               NUMBER (5)  NOT NULL , 
     dt_compra_lote            DATE  NOT NULL , 
     qt_certificado_comprado   NUMBER (3)  NOT NULL , 
     qt_certificado_disponivel NUMBER (3)  NOT NULL 
    ) 
;

COMMENT ON COLUMN T_PARCERIALOTE.id_lote IS 'Identificador lote' 
;

COMMENT ON COLUMN T_PARCERIALOTE.dt_compra_lote IS 'Data que foi comprado o lote' 
;

COMMENT ON COLUMN T_PARCERIALOTE.qt_certificado_comprado IS 'Quantidade de certificados comprados' 
;

COMMENT ON COLUMN T_PARCERIALOTE.qt_certificado_disponivel IS 'Quantidade de certificado disponivel' 
;

ALTER TABLE T_PARCERIALOTE 
    ADD CONSTRAINT T_PARCERIA_LOTE_PK PRIMARY KEY ( id_lote ) ;

CREATE TABLE T_VENDA 
    ( 
     id_protocolo_syngular  VARCHAR2 (20)  NOT NULL , 
     id_parceiro            NUMBER (5)  NOT NULL , 
     id_cliente             NUMBER (5)  NOT NULL , 
     id_certificado         NUMBER (5)  NOT NULL , 
     id_fechamento          NUMBER (5) , 
     id_empresa             NUMBER (5) , 
     id_lote                NUMBER (5) , 
     nr_pedido_venda        VARCHAR2 (20)  NOT NULL , 
     dt_pedido              DATE  NOT NULL , 
     vl_certificado_vendido NUMBER  NOT NULL , 
     ds_forma_de_pagamento  VARCHAR2 (10)  NOT NULL , 
     tp_atendimento         VARCHAR2 (20)  NOT NULL , 
     st_venda               VARCHAR2 (20)  NOT NULL 
    ) 
;

COMMENT ON COLUMN T_VENDA.id_protocolo_syngular IS 'Protocolo Syngular' 
;

COMMENT ON COLUMN T_VENDA.nr_pedido_venda IS 'Pedido CCN, não será obrigátorio pq se mudar de AR o pedido será de outra AR' 
;

COMMENT ON COLUMN T_VENDA.ds_forma_de_pagamento IS 'Formas de pagamento CREDITO; PIX;  BOLETO' 
;

ALTER TABLE T_VENDA 
    ADD CONSTRAINT CK_FORMA_PAGAMENTO 
    CHECK (ds_forma_de_pagamento IN ('PIX','BOLETO','CREDITO'))
;


ALTER TABLE T_VENDA 
    ADD CONSTRAINT CK_T_VENDA_TP_ATENDIMENTO 
    CHECK (tp_atendimento in ('VIDEO', 'ONLINE', 'PRESENCIAL'))
;


ALTER TABLE T_VENDA 
    ADD CONSTRAINT CK_T_VENDA_STATUS 
    CHECK (st_venda in ('FINALIZADA', 'PENDENTE', 'CANCELADA'))
;


ALTER TABLE T_VENDA 
    ADD CONSTRAINT CK_T_VENDA_PRECO 
    CHECK (vl_certificado_vendido > 0)
;
ALTER TABLE T_VENDA 
    ADD CONSTRAINT T_VENDA_PK PRIMARY KEY ( id_protocolo_syngular ) ;

ALTER TABLE T_VENDA 
    ADD CONSTRAINT UN_T_VENDA_PEDIDO_VENDA UNIQUE ( nr_pedido_venda ) ;

ALTER TABLE T_EMPRESA 
    ADD CONSTRAINT FK_T_EMPRESA_CLIENTE FOREIGN KEY 
    ( 
     id_cliente
    ) 
    REFERENCES T_CLIENTE 
    ( 
     id_cliente
    ) 
;

ALTER TABLE T_FECHAMENTO 
    ADD CONSTRAINT FK_T_FECHAMENTO_PARCEIRO FOREIGN KEY 
    ( 
     id_parceiro
    ) 
    REFERENCES T_PARCEIRO 
    ( 
     id_parceiro
    ) 
;

ALTER TABLE T_PARCERIA_COMISSAO 
    ADD CONSTRAINT FK_T_PARCERIA_COMISSAO_PARCEIRO FOREIGN KEY 
    ( 
     id_parceiro
    ) 
    REFERENCES T_PARCEIRO 
    ( 
     id_parceiro
    ) 
;

ALTER TABLE T_PARCERIALOTE 
    ADD CONSTRAINT FK_T_PARCERIA_LOTE_PARCEIRO FOREIGN KEY 
    ( 
     id_parceiro
    ) 
    REFERENCES T_PARCEIRO 
    ( 
     id_parceiro
    ) 
;

ALTER TABLE T_PARCERIA_REPASSE 
    ADD CONSTRAINT FK_T_PARCERIA_REPASSE_PARCEIRO FOREIGN KEY 
    ( 
     id_parceiro
    ) 
    REFERENCES T_PARCEIRO 
    ( 
     id_parceiro
    ) 
;

ALTER TABLE T_PARCERIA_REVENDA 
    ADD CONSTRAINT FK_T_PARCERIA_REVENDA_PARCEIRO FOREIGN KEY 
    ( 
     id_parceiro
    ) 
    REFERENCES T_PARCEIRO 
    ( 
     id_parceiro
    ) 
;

ALTER TABLE T_VENDA 
    ADD CONSTRAINT FK_T_VENDA_CERTIFICADO FOREIGN KEY 
    ( 
     id_certificado
    ) 
    REFERENCES T_CERTIFICADO 
    ( 
     id_certificado
    ) 
;

ALTER TABLE T_VENDA 
    ADD CONSTRAINT FK_T_VENDA_CLIENTE FOREIGN KEY 
    ( 
     id_cliente
    ) 
    REFERENCES T_CLIENTE 
    ( 
     id_cliente
    ) 
;

ALTER TABLE T_VENDA 
    ADD CONSTRAINT FK_T_VENDA_EMPRESA FOREIGN KEY 
    ( 
     id_empresa
    ) 
    REFERENCES T_EMPRESA 
    ( 
     id_empresa
    ) 
;

ALTER TABLE T_VENDA 
    ADD CONSTRAINT FK_T_VENDA_FECHAMENTO FOREIGN KEY 
    ( 
     id_fechamento
    ) 
    REFERENCES T_FECHAMENTO 
    ( 
     id_fechamento
    ) 
;

ALTER TABLE T_VENDA 
    ADD CONSTRAINT FK_T_VENDA_PARCEIRO FOREIGN KEY 
    ( 
     id_parceiro
    ) 
    REFERENCES T_PARCEIRO 
    ( 
     id_parceiro
    ) 
;

ALTER TABLE T_VENDA 
    ADD CONSTRAINT FK_T_VENDA_PARCERIA_LOTE FOREIGN KEY 
    ( 
     id_lote
    ) 
    REFERENCES T_PARCERIALOTE 
    ( 
     id_lote
    ) 
;



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             43
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
