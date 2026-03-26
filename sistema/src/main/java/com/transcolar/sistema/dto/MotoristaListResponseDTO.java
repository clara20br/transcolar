package com.transcolar.sistema.dto;

public class MotoristaListResponseDTO {

    private Long id;
    private String nomeCompleto;
    private String cpf;
    private String numeroCnh;
    private String categoriaCnh;
    private String telefone;
    private String status;
    private boolean ativo;

    // Construtor com todos os campos
    public MotoristaListResponseDTO(Long id, String nomeCompleto, String cpf, 
                                    String numeroCnh, String categoriaCnh, 
                                    String telefone, String status, boolean ativo) {
        this.id = id;
        this.nomeCompleto = nomeCompleto;
        this.cpf = cpf;
        this.numeroCnh = numeroCnh;
        this.categoriaCnh = categoriaCnh;
        this.telefone = telefone;
        this.status = status;
        this.ativo = ativo;
    }

    // ================================ GETTERS E SETTERS ================================

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNomeCompleto() {
        return nomeCompleto;
    }

    public void setNomeCompleto(String nomeCompleto) {
        this.nomeCompleto = nomeCompleto;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getNumeroCnh() {
        return numeroCnh;
    }

    public void setNumeroCnh(String numeroCnh) {
        this.numeroCnh = numeroCnh;
    }

    public String getCategoriaCnh() {
        return categoriaCnh;
    }

    public void setCategoriaCnh(String categoriaCnh) {
        this.categoriaCnh = categoriaCnh;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public boolean isAtivo() {
        return ativo;
    }

    public void setAtivo(boolean ativo) {
        this.ativo = ativo;
    }
}