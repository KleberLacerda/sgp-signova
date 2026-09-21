package br.com.signova.calculadora;

public class CalculadoraComissao implements CalculadoraFechamento{
    private final double percentualComissao;

    public CalculadoraComissao(double percentualComissao) {
        this.percentualComissao = percentualComissao;
    }

    @Override
    public double calcular(double totalVendido, int qtdCertificados) {
        return totalVendido * percentualComissao;
    }
}
