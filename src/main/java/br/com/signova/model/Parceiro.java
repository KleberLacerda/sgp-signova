package br.com.signova.model;

public class Parceiro {
    private Long idParceiro;
    private String chavePix;
    private String endereco;
    private String celular;
    private String cnpjOuCpf;
    private String nome;
    private String email;
    private TipoParceria tipoParceria;



    public enum TipoParceria{
        COMISSAO, REVENDA, REPASSE, LOTE;
    }

    public String getChavePix() {
        return chavePix;
    }

    public void setChavePix(String chavePix) {
        this.chavePix = chavePix;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getCnpjOuCpf() {
        return cnpjOuCpf;
    }

    public void setCnpjOuCpf(String cnpjOuCpf) {
        this.cnpjOuCpf = cnpjOuCpf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Long getIdParceiro() {
        return idParceiro;
    }

    public TipoParceria getTipoParceria() {
        return tipoParceria;
    }

    public Parceiro(String cnpjOuCpf, String nome, TipoParceria tipoParceria) {
        this.cnpjOuCpf = cnpjOuCpf;
        this.nome = nome;
        this.tipoParceria = tipoParceria;
    }

    public void dadoCadastral(String chavePix, String email, String celular, String endereco) {
        this.chavePix = chavePix;
        this.email = email;
        this.celular = celular;
        this.endereco = endereco;
    }
}
