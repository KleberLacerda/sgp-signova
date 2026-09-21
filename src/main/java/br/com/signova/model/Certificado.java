package br.com.signova.model;

public class Certificado {
    private String idCertificado;
    private TipoModelo tipoModelo;
    private int validade;
    private TipoPessoa tipoPessoa;

    public enum TipoModelo{
        A1, A3, SYN;
    }

    public enum TipoPessoa{
        FISICA, JURIDICA;
    }

    public TipoModelo getTipoModelo() {
        return tipoModelo;
    }

    public void setTipoModelo(TipoModelo tipoModelo) {
        this.tipoModelo = tipoModelo;
    }

    public int getValidade() {
        return validade;
    }

    public void setValidade(int validade) {
        this.validade = validade;
    }

    public TipoPessoa getTipoPessoa() {
        return tipoPessoa;
    }

    public void setTipoPessoa(TipoPessoa tipoPessoa) {
        this.tipoPessoa = tipoPessoa;
    }

    public String getIdCertificado() {
        return idCertificado;
    }

    public Certificado(TipoModelo tipoModelo, int validade, TipoPessoa tipoPessoa) {
        this.tipoModelo = tipoModelo;
        this.validade = validade;
        this.tipoPessoa = tipoPessoa;
    }
}

