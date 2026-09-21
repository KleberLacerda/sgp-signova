package br.com.signova.model;

import java.time.LocalDate;

public class Venda {
    private String protocoloSyngular;
    private Long idParceiro;
    private Long idCliente;
    private Long idFechamento;
    private Long idEmpresa;
    private Long idCertificado;
    private Long idLote;
    private String pedidoVenda;
    private double valorVenda;
    private FormaDePagamento formaDePagamento;
    private LocalDate dataCompra;
    private TipoAtendimento tipoAtendimento;
    private StatusVenda statusVenda = StatusVenda.PENDENTE;
            ;

    public enum StatusVenda{
        PENDENTE, FINALIZADA, CANCELADA;
    }

    public enum FormaDePagamento{
        PIX, CREDITO, BOLETO;
    }

    public enum TipoAtendimento{
        VIDEO, ONLINE, PRESENCIAL;
    }

    public String getProtocoloSyngular() {
        return protocoloSyngular;
    }

    public void setProtocoloSyngular(String protocoloSyngular) {
        this.protocoloSyngular = protocoloSyngular;
    }

    public Long getIdParceiro() {
        return idParceiro;
    }


    public Long getIdCliente() {
        return idCliente;
    }


    public Long getIdFechamento() {
        return idFechamento;
    }


    public Long getIdEmpresa() {
        return idEmpresa;
    }

    public Long getIdCertificado() {
        return idCertificado;
    }

    public Long getIdLote() {
        return idLote;
    }


    public String getPedidoVenda() {
        return pedidoVenda;
    }

    public void setPedidoVenda(String pedidoVenda) {
        this.pedidoVenda = pedidoVenda;
    }

    public double getValorVenda() {
        return valorVenda;
    }

    public void setValorVenda(double valorVenda) {
        this.valorVenda = valorVenda;
    }

    public FormaDePagamento getFormaDePagamento() {
        return formaDePagamento;
    }

    public void setFormaDePagamento(FormaDePagamento formaDePagamento) {
        this.formaDePagamento = formaDePagamento;
    }

    public LocalDate getDataCompra() {
        return dataCompra;
    }

    public void setDataCompra(LocalDate dataCompra) {
        this.dataCompra = dataCompra;
    }

    public TipoAtendimento getTipoAtendimento() {
        return tipoAtendimento;
    }

    public void setTipoAtendimento(TipoAtendimento tipoAtendimento) {
        this.tipoAtendimento = tipoAtendimento;
    }

    public void setIdParceiro(Long idParceiro) {
        this.idParceiro = idParceiro;
    }

    public void setIdCliente(Long idCliente) {
        this.idCliente = idCliente;
    }

    public void setIdFechamento(Long idFechamento) {
        this.idFechamento = idFechamento;
    }

    public void setIdEmpresa(Long idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public void setIdCertificado(Long idCertificado) {
        this.idCertificado = idCertificado;
    }

    public void setIdLote(Long idLote) {
        this.idLote = idLote;
    }

    public StatusVenda getStatusVenda() {
        return statusVenda;
    }

    public void setStatusVenda(StatusVenda statusVenda) {
        this.statusVenda = statusVenda;
    }

    public void criarVenda(String protocoloSyngular, double valorVenda, StatusVenda statusVenda ) {
        this.protocoloSyngular = protocoloSyngular;
        this.statusVenda = statusVenda;
        this.valorVenda = valorVenda;

    }

    public Venda(){

    }

    public Venda(String protocoloSyngular, Long idParceiro, Long idCliente, Long idFechamento, Long idEmpresa, Long idCertificado, Long idLote, String pedidoVenda, double valorVenda, FormaDePagamento formaDePagamento, LocalDate dataCompra, TipoAtendimento tipoAtendimento, StatusVenda status) {
        this.protocoloSyngular = protocoloSyngular;
        this.idParceiro = idParceiro;
        this.idCliente = idCliente;
        this.idFechamento = idFechamento;
        this.idEmpresa = idEmpresa;
        this.idCertificado = idCertificado;
        this.idLote = idLote;
        this.pedidoVenda = pedidoVenda;
        this.valorVenda = valorVenda;
        this.formaDePagamento = formaDePagamento;
        this.dataCompra = dataCompra;
        this.tipoAtendimento = tipoAtendimento;
        this.statusVenda = status;

    }

    public void finalizarVenda(){
        if (this.statusVenda != StatusVenda.PENDENTE){
            throw new IllegalStateException("Só é possivel finalizar uma venda pendente.");
        }
        this.statusVenda = StatusVenda.FINALIZADA;
        }


    public void cancelarVenda(){
        if (this.statusVenda == StatusVenda.CANCELADA){
            throw new IllegalStateException("Venda já está cancelada.");
        }
        this.statusVenda = StatusVenda.CANCELADA;
    }
}




