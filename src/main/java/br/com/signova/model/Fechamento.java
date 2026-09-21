package br.com.signova.model;

import java.time.LocalDate;

public class Fechamento {
    private Long idFechamento;
    private Long idParceiro;
    private LocalDate dataPagamento;
    private double valorPago;
    private Parceiro.TipoParceria tipoParceria;

    public Long getIdFechamento() {
        return idFechamento;
    }

    public void setIdFechamento(Long idFechamento) {
        this.idFechamento = idFechamento;
    }

    public Long getIdParceiro() {
        return idParceiro;
    }

    public void setIdParceiro(Long idParceiro) {
        this.idParceiro = idParceiro;
    }

    public LocalDate getDataPagamento() {
        return dataPagamento;
    }

    public void setDataPagamento(LocalDate dataPagamento) {
        this.dataPagamento = dataPagamento;
    }

    public double getValorPago() {
        return valorPago;
    }

    public void setValorPago(double valorPago) {
        this.valorPago = valorPago;
    }

    public Parceiro.TipoParceria getTipoParceria() {
        return tipoParceria;
    }

    public void setTipoParceria(Parceiro.TipoParceria tipoParceria) {
        this.tipoParceria = tipoParceria;
    }

    public Fechamento(Long idParceiro, LocalDate dataPagamento, double valorPago, Parceiro.TipoParceria tipoParceria) {
        this.idParceiro = idParceiro;
        this.dataPagamento = dataPagamento;
        this.valorPago = valorPago;
        this.tipoParceria = tipoParceria;
    }
}
