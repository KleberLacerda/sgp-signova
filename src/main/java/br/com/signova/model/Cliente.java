package br.com.signova.model;

import java.time.LocalDate;

public class Cliente {
    private Long idCliente;
    private String cpf;
    private String nomeCompleto;
    private LocalDate dataNascimento;
    private String email;
    private String celular;
    private String contaSyn;

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getNomeCompleto() {
        return nomeCompleto;
    }

    public void setNomeCompleto(String nomeCompleto) {
        this.nomeCompleto = nomeCompleto;
    }

    public LocalDate getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(LocalDate dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getContaSyn() {
        return contaSyn;
    }

    public void setContaSyn(String contaSyn) {
        this.contaSyn = contaSyn;
    }

    public Long getIdCliente() {
        return idCliente;
    }

    public Cliente(){
    }

    public Cliente(String cpf, String nomeCompleto, LocalDate dataNascimento, String email, String celular, String contaSyn) {
        this.cpf = cpf;
        this.nomeCompleto = nomeCompleto;
        this.dataNascimento = dataNascimento;
        this.email = email;
        this.celular = celular;
        this.contaSyn = contaSyn;
    }

    public void cadastrarCliente(String cpf, String nomeCompleto, LocalDate dataNascimento, String email, String celular, String contaSyn) {
        this.cpf = cpf;
        this.nomeCompleto = nomeCompleto;
        this.dataNascimento = dataNascimento;
        this.email = email;
        this.celular = celular;
        this.contaSyn = contaSyn;
    }
}
