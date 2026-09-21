
Readme · MD
# SGP — Sistema de Gestão de Pedidos (Signova Soluções Digitais)
 
Sistema de back-end para gestão de pedidos de certificado digital, parcerias comerciais com contabilidades e cálculo automatizado de fechamentos financeiros — desenvolvido para substituir um controle manual em planilha de uma operação real de certificação digital.
 
## Sobre o projeto
 
A Signova Soluções Digitais, foi fundada por mim em meados de 2023 e é um ponto de atendimento/revenda de certificados digitais (e-CPF, e-CNPJ) em parceria com contabilidades, que indicam clientes em troca de comissão, revenda, repasse ou compra em lote. Esse sistema resolve o problema real de controle, com integridade de dados, quatro modelos de parceria diferentes — cada um com sua própria fórmula de cálculo de fechamento financeiro.
 
## O que este projeto demonstra
 
- **Modelagem de dados relacional** (MER → DDL Oracle), com normalização, herança de tabelas (Class Table Inheritance) para os 4 modelos de parceria, constraints de integridade (CHECK, UNIQUE, FK) e views para consultas legíveis sem duplicação de dado.
- **Modelagem orientada a objetos em Java**: herança real (subclasses de parceria), composição (Empresa/Cliente), enums para estado controlado, o padrão Strategy (interface `CalculadoraFechamento` com 3 implementações), e máquina de estados simples para o ciclo de vida de uma venda (PENDENTE → FINALIZADA / CANCELADA).
- **Regras de negócio não-triviais**, descobertas e refinadas ao longo do desenvolvimento a partir de casos reais da operação — não assumidas de forma abstrata (ver seção abaixo).
## Regras de negócio principais
 
- **4 modelos de parceria**, cada um com fórmula própria de cálculo de fechamento:
  - *Comissão*: percentual sobre o total vendido no período.
  - *Revenda*: valor fixo por certificado emitido.
  - *Repasse*: o parceiro recebe o valor total menos um valor retido por certificado; frequência de pagamento (semanal/mensal) configurável por parceiro.
  - *Lote*: a contabilidade compra um volume de certificados adiantado; o saldo é controlado e decrementado à medida que certificados são consumidos.
- **Uma venda só entra no cálculo de fechamento quando seu status é `FINALIZADA`** — o cliente pagar não é suficiente; o processo de emissão precisa estar concluído. Essa regra evita pagar comissão sobre vendas ainda em andamento ou canceladas.
- **Cancelamento dentro do prazo não é contabilizado**: se o cliente cancela e reemite um certificado gratuitamente dentro do prazo acordado com o fornecedor, a venda original não gera cobrança nem comissão.
## Stack
 
- **Java** (modelo de domínio, orientação a objetos)
- **Oracle Database** (modelagem relacional, PL/SQL, views)
- *(Em andamento)* Spring Boot + Spring Data JPA, para expor a lógica como API REST
## Como foi desenvolvido — sobre o uso de IA
 
Este projeto foi construído com apoio de IA (Claude, Anthropic) atuando estritamente como **mentor técnico sênior** — revisando código linha a linha, apontando erros de design antes de eu perceber sozinho, explicando o "porquê" por trás de cada correção, e me devolvendo a tarefa pra eu tentar de novo. A IA não escreveu o código de produção do projeto: toda classe, toda query, toda decisão de modelagem foi escrita por mim. O papel da IA foi o de um revisor exigente — apontando bugs sutis (ex: uma FK invertida, uma condição de `CHECK` malformada, uma lógica de negócio que eu tinha esquecido de tratar), e me forçando a justificar cada decisão de design antes de seguir em frente.
 
Considero esse processo parte relevante do meu aprendizado: aprendi tanto errando e sendo corrigido quanto acertando de primeira.
 
## Roadmap
 
- [x] Modelagem de dados (MER + DDL, Oracle)
- [x] Modelo de domínio em Java (entidades, herança, enums, Strategy)
- [x] Banco de dados local funcional, com dados de teste validando as regras
- [ ] Camada Spring Boot (Repository, Service, Controller)
- [ ] Front-end
- [ ] Testes automatizados (JUnit)
## Autor
 
Kleber — em transição de carreira para Back-End Java, estudando Análise e Desenvolvimento de Sistemas (FIAP), fundador da Signova Soluções Digitais.
 
