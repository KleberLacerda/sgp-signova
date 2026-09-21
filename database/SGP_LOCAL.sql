ALTER TABLE T_VENDA DROP CONSTRAINT CK_T_VENDA_PRECO;
 
ALTER TABLE T_VENDA ADD CONSTRAINT CK_T_VENDA_PRECO
CHECK (vl_certificado_vendido >= 0 );

-- Testando tabela certificado
INSERT INTO T_CERTIFICADO (id_certificado, tp_modelo, dt_validade, tp_pessoa)
VALUES(1, 'A1', 12, 'F');
INSERT INTO T_CERTIFICADO (id_certificado, tp_modelo, dt_validade, tp_pessoa)
VALUES (2, 'A3', 36, 'J');
INSERT INTO T_CERTIFICADO (id_certificado, tp_modelo, dt_validade, tp_pessoa)
VALUES (3, 'SYN', 12, 'F');

-- Testando tbl cliente
INSERT INTO T_CLIENTE (id_cliente, nr_cpf, nm_cliente, dt_nascimento, ds_email, nm_telefone, nr_conta_syn)
VALUES (1, '12345678901', 'João Silva', TO_DATE('1990-05-10','YYYY-MM-DD'), 'joao@teste.com', '11988887777', 'SYN001');
INSERT INTO T_CLIENTE (id_cliente, nr_cpf, nm_cliente, dt_nascimento, ds_email, nm_telefone, nr_conta_syn)
VALUES (2, '98765432100', 'Maria Souza', TO_DATE('1985-03-22','YYYY-MM-DD'), 'maria@teste.com', '11977776666', 'SYN002');

-- Testando 4 modelos de parceiros
INSERT INTO T_PARCEIRO (id_parceiro, ds_chave_pix, ds_endereço, nm_telefonel, nr_cpf_cnpj, nm_parceiro, ds_email, tp_parceria, st_ativo)
VALUES (1, 'lazzarini@pix.com', 'Rua A, 100', '11911112222', '45858457000188', 'Lazzarini Contabilidade', 'lazzarini@contab.com', 'COMISSAO', 'S');
INSERT INTO T_PARCEIRO (id_parceiro, ds_chave_pix, ds_endereço, nm_telefonel, nr_cpf_cnpj, nm_parceiro, ds_email, tp_parceria, st_ativo)
VALUES (2, 'mello@pix.com', 'Rua B, 200', '11922223333', '84777541000199', 'Mello Contabilidade', 'mello@contab.com', 'REVENDA', 'S');
INSERT INTO T_PARCEIRO (id_parceiro, ds_chave_pix, ds_endereço, nm_telefonel, nr_cpf_cnpj, nm_parceiro, ds_email, tp_parceria, st_ativo)
VALUES (3, '12333345500', 'Rua C, 300', '11933334444', '12333345500', 'WM Contabilidade', 'wm@contab.com', 'REPASSE', 'S');
INSERT INTO T_PARCEIRO (id_parceiro, ds_chave_pix, ds_endereço, nm_telefonel, nr_cpf_cnpj, nm_parceiro, ds_email, tp_parceria, st_ativo)
VALUES (4, 'agm@pix.com', 'Rua D, 400', '11944445555', '12345678000191', 'AGM Contabilidade', 'agm@contab.com', 'LOTE', 'S');

-- Testando tbl empresa
INSERT INTO T_EMPRESA (id_empresa, id_cliente, nr_cnpj, nm_razao_social)
VALUES (1, 2, '11222333000181', 'Maria Souza ME');

-- Testando subtbl parceria
INSERT INTO T_PARCERIA_COMISSAO (id_parceiro, vl_percentual_comissao)
VALUES (1, 40);
 
INSERT INTO T_PARCERIA_REVENDA (id_parceiro, vl_revenda)
VALUES (2, 75.00);
 
INSERT INTO T_PARCERIA_REPASSE (id_parceiro, frequencia_repasse)
VALUES (3, 'SEMANAL');
 
INSERT INTO T_PARCERIALOTE (id_lote, id_parceiro, dt_compra_lote, qt_certificado_comprado, qt_certificado_disponivel)
VALUES (1, 4, TO_DATE('2026-08-01','YYYY-MM-DD'), 20, 18);

-- Testando tbl fechamento já processado da Lazzarini
INSERT INTO T_FECHAMENTO (id_fechamento, id_parceiro, dt_pagamento_comissao, vl_pago, tp_parceria)
VALUES (1, 1, TO_DATE('2026-08-31','YYYY-MM-DD'), 360.00, 'COMISSAO');

-- Testando tbl venda
 
-- Venda já finalizada e fechada (Lazzarini, comissão)
INSERT INTO T_VENDA (id_protocolo_syngular, id_parceiro, id_cliente, id_certificado, id_fechamento, id_empresa, id_lote,
                      nr_pedido_venda, dt_pedido, vl_certificado_vendido, ds_forma_de_pagamento, tp_atendimento, st_venda)
VALUES ('PROT-0001', 1, 1, 1, 1, NULL, NULL,
        'PED-0001', TO_DATE('2026-08-15','YYYY-MM-DD'), 180.00, 'PIX', 'VIDEO', 'FINALIZADA');
 
-- Venda pendente (Mello, revenda) — cliente pessoa jurídica
INSERT INTO T_VENDA (id_protocolo_syngular, id_parceiro, id_cliente, id_certificado, id_fechamento, id_empresa, id_lote,
                      nr_pedido_venda, dt_pedido, vl_certificado_vendido, ds_forma_de_pagamento, tp_atendimento, st_venda)
VALUES ('PROT-0002', 2, 2, 2, NULL, 1, NULL,
        'PED-0002', TO_DATE('2026-09-10','YYYY-MM-DD'), 180.00, 'BOLETO', 'ONLINE', 'PENDENTE');
 
-- Venda cancelada (WM, repasse)
INSERT INTO T_VENDA (id_protocolo_syngular, id_parceiro, id_cliente, id_certificado, id_fechamento, id_empresa, id_lote,
                      nr_pedido_venda, dt_pedido, vl_certificado_vendido, ds_forma_de_pagamento, tp_atendimento, st_venda)
VALUES ('PROT-0003', 3, 1, 3, NULL, NULL, NULL,
        'PED-0003', TO_DATE('2026-09-12','YYYY-MM-DD'), 110.00, 'CREDITO', 'PRESENCIAL', 'CANCELADA');
 
-- Venda usando Lote (AGM) — finalizada, consumindo saldo
INSERT INTO T_VENDA (id_protocolo_syngular, id_parceiro, id_cliente, id_certificado, id_fechamento, id_empresa, id_lote,
                      nr_pedido_venda, dt_pedido, vl_certificado_vendido, ds_forma_de_pagamento, tp_atendimento, st_venda)
VALUES ('PROT-0004', 4, 2, 1, NULL, NULL, 1,
        'PED-0004', TO_DATE('2026-09-14','YYYY-MM-DD'), 0.00, 'PIX', 'VIDEO', 'FINALIZADA');
 
COMMIT;

ALTER TABLE T_PARCERIA_REPASSE ADD vl_retido_certificado NUMBER(6,2);
UPDATE T_PARCERIA_REPASSE SET vl_retido_certificado = 70.00 WHERE id_parceiro = 3;
ALTER TABLE T_PARCERIA_REPASSE MODIFY vl_retido_certificado NUMBER(6,2) NOT NULL;

-- Comissão (Lazzarini)
SELECT p.nm_parceiro,
       SUM(v.vl_certificado_vendido) AS total_vendido,
       SUM(v.vl_certificado_vendido) * (pc.vl_percentual_comissao / 100) AS valor_a_receber
FROM T_VENDA v
JOIN T_PARCEIRO p ON p.id_parceiro = v.id_parceiro
JOIN T_PARCERIA_COMISSAO pc ON pc.id_parceiro = v.id_parceiro
WHERE v.st_venda = 'FINALIZADA'
GROUP BY p.nm_parceiro, pc.vl_percentual_comissao;

-- Revenda (Mello)
SELECT p.nm_parceiro,
       COUNT(*) AS qtd_certificados,
       COUNT(*) * pr.vl_revenda AS valor_a_receber
FROM T_VENDA v
JOIN T_PARCEIRO p ON p.id_parceiro = v.id_parceiro
JOIN T_PARCERIA_REVENDA pr ON pr.id_parceiro = v.id_parceiro
WHERE v.st_venda = 'FINALIZADA'
GROUP BY p.nm_parceiro, pr.vl_revenda;


ALTER TABLE T_PARCERIALOTE RENAME TO T_PARCERIA_LOTE;

CREATE VIEW VW_FECHAMENTO AS
SELECT f.id_fechamento, f.id_parceiro, p.nm_parceiro,
       f.dt_pagamento_comissao, f.vl_pago, f.tp_parceria
FROM T_FECHAMENTO f
JOIN T_PARCEIRO p ON p.id_parceiro = f.id_parceiro;

CREATE VIEW VW_PARCERIA_COMISSAO AS
SELECT pc.id_parceiro, p.nm_parceiro, pc.vl_percentual_comissao
FROM T_PARCERIA_COMISSAO pc
JOIN T_PARCEIRO p ON p.id_parceiro = pc.id_parceiro;

CREATE VIEW VW_PARCERIA_REVENDA AS
SELECT pr.id_parceiro, p.nm_parceiro, pr.vl_revenda
FROM T_PARCERIA_REVENDA pr
JOIN T_PARCEIRO p ON p.id_parceiro = pr.id_parceiro;

CREATE VIEW VW_PARCERIA_REPASSE AS
SELECT pp.id_parceiro, p.nm_parceiro, pp.frequencia_repasse, pp.vl_retido_certificado
FROM T_PARCERIA_REPASSE pp
JOIN T_PARCEIRO p ON p.id_parceiro = pp.id_parceiro;

CREATE VIEW VW_PARCERIA_LOTE AS
SELECT pl.id_lote, pl.id_parceiro, p.nm_parceiro,
       pl.dt_compra_lote, pl.qt_certificado_comprado, pl.qt_certificado_disponivel
FROM T_PARCERIA_LOTE pl
JOIN T_PARCEIRO p ON p.id_parceiro = pl.id_parceiro;

CREATE VIEW VW_VENDA AS
SELECT v.id_protocolo_syngular, v.id_parceiro, p.nm_parceiro,
       v.id_cliente, c.nm_cliente,
       v.id_empresa, e.nm_razao_social,
       v.id_certificado, v.nr_pedido_venda, v.dt_pedido,
       v.vl_certificado_vendido, v.ds_forma_de_pagamento,
       v.tp_atendimento, v.st_venda
FROM T_VENDA v
JOIN T_PARCEIRO p ON p.id_parceiro = v.id_parceiro
JOIN T_CLIENTE c ON c.id_cliente = v.id_cliente
LEFT JOIN T_EMPRESA e ON e.id_empresa = v.id_empresa;

SELECT * FROM VW_VENDA