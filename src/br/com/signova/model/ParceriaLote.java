package br.com.signova.model;

import java.time.LocalDate;

public class ParceriaLote extends Parceiro{
    private Long idLote;
    private LocalDate dtCompraLote;
    private int qtdComprada;
    private int qtdDisponivel;

    public Long getIdLote() {
        return idLote;
    }

    public void setIdLote(Long idLote) {
        this.idLote = idLote;
    }

    public LocalDate getDtCompraLote() {
        return dtCompraLote;
    }

    public void setDtCompraLote(LocalDate dtCompraLote) {
        this.dtCompraLote = dtCompraLote;
    }

    public int getQtdComprada() {
        return qtdComprada;
    }

    public void setQtdComprada(int qtdComprada) {
        this.qtdComprada = qtdComprada;
    }

    public int getQtdDisponivel() {
        return qtdDisponivel;
    }


    public ParceriaLote(String nome, String cnpjOuCpf, int qtdComprada, LocalDate dtCompraLote) {
        super(nome, cnpjOuCpf, TipoParceria.LOTE);
        this.qtdComprada = qtdComprada;
        this.qtdDisponivel = qtdComprada;
        this.dtCompraLote = dtCompraLote;
    }


    public void consumirCertificado(){
        if (qtdDisponivel <= 0){
            throw new IllegalStateException("Saldo do lote esgotado.\nPor favor, recarregar.");
        }
    }

}
