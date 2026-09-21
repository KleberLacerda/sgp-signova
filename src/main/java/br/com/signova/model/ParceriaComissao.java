package br.com.signova.model;

public class ParceriaComissao extends Parceiro{
    private final double percentualComissao;

    public double getPercentualComissao() {
        return percentualComissao;
    }


    public ParceriaComissao(String nome, String cnpjOuCpf, double percentualComissao) {
        super(nome, cnpjOuCpf, TipoParceria.COMISSAO);
        this.percentualComissao = percentualComissao;
    }
}
