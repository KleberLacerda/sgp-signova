package br.com.signova.calculadora;

public class CalculadoraRepasse implements CalculadoraFechamento{
    private final double valorFixo;

    public CalculadoraRepasse(double valorFixo) {
        this.valorFixo = valorFixo;
    }

    @Override
    public double calcular(double totalVendido, int qtdCertificados) {
        return totalVendido - (qtdCertificados* valorFixo);
    }
}
