package br.com.signova.model;

public class ParceriaRevenda extends Parceiro{
    private double valorFixo;

    public double getValorFixo() {
        return valorFixo;
    }

    public ParceriaRevenda(String nome, String cnpjOuCpf, double valorFixo) {
        super(nome, cnpjOuCpf, TipoParceria.REVENDA);
        this.valorFixo = valorFixo;
    }

}
