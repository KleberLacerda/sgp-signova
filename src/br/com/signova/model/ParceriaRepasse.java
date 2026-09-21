package br.com.signova.model;

public class ParceriaRepasse extends Parceiro{
    private final FrequenciaRepasse frequenciaRepasse;
    private double valorRetido;

    public enum FrequenciaRepasse{
        SEMANAL, MENSAL;
    }

    public FrequenciaRepasse getFrequenciaRepasse() {
        return frequenciaRepasse;
    }


    public double getValorRetido() {
        return valorRetido;
    }


    public ParceriaRepasse(String nome, String cnpjOuCpf, FrequenciaRepasse frequenciaRepasse) {
        super(nome, cnpjOuCpf, TipoParceria.REPASSE);
        this.frequenciaRepasse = frequenciaRepasse;
    }
}
