package com.transcolar.sistema.dto;

public class VeiculoListResponseDTO {

    private Long id;
    private String placa;
    private String marca;
    private String modelo;
    private String anoModelo;
    private String cor;
    private Integer capacidadeAlunos;
    private Boolean disponivel;
    private Boolean ativo;

    public VeiculoListResponseDTO(Long id, String placa, String marca, String modelo,
                                  String anoModelo, String cor, Integer capacidadeAlunos,
                                  Boolean disponivel, Boolean ativo) {
        this.id = id;
        this.placa = placa;
        this.marca = marca;
        this.modelo = modelo;
        this.anoModelo = anoModelo;
        this.cor = cor;
        this.capacidadeAlunos = capacidadeAlunos;
        this.disponivel = disponivel;
        this.ativo = ativo;
    }

    // ===== GETTERS E SETTERS =====
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getAnoModelo() {
        return anoModelo;
    }

    public void setAnoModelo(String anoModelo) {
        this.anoModelo = anoModelo;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public Integer getCapacidadeAlunos() {
        return capacidadeAlunos;
    }

    public void setCapacidadeAlunos(Integer capacidadeAlunos) {
        this.capacidadeAlunos = capacidadeAlunos;
    }

    public Boolean getDisponivel() {
        return disponivel;
    }

    public void setDisponivel(Boolean disponivel) {
        this.disponivel = disponivel;
    }

    public Boolean getAtivo() {
        return ativo;
    }

    public void setAtivo(Boolean ativo) {
        this.ativo = ativo;
    }
}