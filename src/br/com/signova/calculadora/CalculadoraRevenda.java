package br.com.signova.calculadora;

public class CalculadoraRevenda implements CalculadoraFechamento {
    private final double valorFixo;

    public CalculadoraRevenda(double valorFixo) {
        this.valorFixo = valorFixo;
    }

    @Override
    public double calcular(double totalVendido, int qtdCertificados) {
        return qtdCertificados * valorFixo;
    }
}
