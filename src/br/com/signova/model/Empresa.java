package br.com.signova.model;

public class Empresa  {
    private Long idEmpresa;
    private String cnpj;
    private String razaoSocial;
    private Cliente cliente;

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getRazaoSocial() {
        return razaoSocial;
    }

    public void setRazaoSocial(String razaoSocial) {
        this.razaoSocial = razaoSocial;
    }

    public Long getIdEmpresa() {
        return idEmpresa;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Empresa(){

    }

    public Empresa(String cnpj, String razaoSocial, Cliente cliente) {
        this.cliente = cliente;
        this.cnpj = cnpj;
        this.razaoSocial = razaoSocial;
    }

}
