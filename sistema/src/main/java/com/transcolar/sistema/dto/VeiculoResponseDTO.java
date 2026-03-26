package com.transcolar.sistema.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class VeiculoResponseDTO {

    private Long id;
    private String placa;
    private String marca;
    private String modelo;
    private String anoFabricacao;
    private String anoModelo;
    private String cor;
    private String renavam;
    private String chassi;
    private String categoria;
    private String combustivel;
    private Integer capacidadeAlunos;
    private LocalDate dataLicenciamento;
    private LocalDate dataUltimaVistoria;
    private LocalDate dataProximaVistoria;
    private String seguradora;
    private String numeroApolice;
    private LocalDate dataValidadeSeguro;
    private Integer kmAtual;
    private LocalDate dataUltimaManutencao;
    private Integer kmProximaManutencao;
    private String observacoes;
    private Boolean disponivel;
    private Boolean ativo;
    private LocalDateTime dataCadastro;
    private LocalDateTime dataAtualizacao;

    public VeiculoResponseDTO(Long id, String placa, String marca, String modelo, 
                              String anoFabricacao, String anoModelo, String cor, 
                              String renavam, String chassi, String categoria, 
                              String combustivel, Integer capacidadeAlunos,
                              LocalDate dataLicenciamento, LocalDate dataUltimaVistoria,
                              LocalDate dataProximaVistoria, String seguradora,
                              String numeroApolice, LocalDate dataValidadeSeguro,
                              Integer kmAtual, LocalDate dataUltimaManutencao,
                              Integer kmProximaManutencao, String observacoes,
                              Boolean disponivel, Boolean ativo, 
                              LocalDateTime dataCadastro, LocalDateTime dataAtualizacao) {
        this.id = id;
        this.placa = placa;
        this.marca = marca;
        this.modelo = modelo;
        this.anoFabricacao = anoFabricacao;
        this.anoModelo = anoModelo;
        this.cor = cor;
        this.renavam = renavam;
        this.chassi = chassi;
        this.categoria = categoria;
        this.combustivel = combustivel;
        this.capacidadeAlunos = capacidadeAlunos;
        this.dataLicenciamento = dataLicenciamento;
        this.dataUltimaVistoria = dataUltimaVistoria;
        this.dataProximaVistoria = dataProximaVistoria;
        this.seguradora = seguradora;
        this.numeroApolice = numeroApolice;
        this.dataValidadeSeguro = dataValidadeSeguro;
        this.kmAtual = kmAtual;
        this.dataUltimaManutencao = dataUltimaManutencao;
        this.kmProximaManutencao = kmProximaManutencao;
        this.observacoes = observacoes;
        this.disponivel = disponivel;
        this.ativo = ativo;
        this.dataCadastro = dataCadastro;
        this.dataAtualizacao = dataAtualizacao;
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

    public String getAnoFabricacao() {
        return anoFabricacao;
    }

    public void setAnoFabricacao(String anoFabricacao) {
        this.anoFabricacao = anoFabricacao;
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

    public String getRenavam() {
        return renavam;
    }

    public void setRenavam(String renavam) {
        this.renavam = renavam;
    }

    public String getChassi() {
        return chassi;
    }

    public void setChassi(String chassi) {
        this.chassi = chassi;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getCombustivel() {
        return combustivel;
    }

    public void setCombustivel(String combustivel) {
        this.combustivel = combustivel;
    }

    public Integer getCapacidadeAlunos() {
        return capacidadeAlunos;
    }

    public void setCapacidadeAlunos(Integer capacidadeAlunos) {
        this.capacidadeAlunos = capacidadeAlunos;
    }

    public LocalDate getDataLicenciamento() {
        return dataLicenciamento;
    }

    public void setDataLicenciamento(LocalDate dataLicenciamento) {
        this.dataLicenciamento = dataLicenciamento;
    }

    public LocalDate getDataUltimaVistoria() {
        return dataUltimaVistoria;
    }

    public void setDataUltimaVistoria(LocalDate dataUltimaVistoria) {
        this.dataUltimaVistoria = dataUltimaVistoria;
    }

    public LocalDate getDataProximaVistoria() {
        return dataProximaVistoria;
    }

    public void setDataProximaVistoria(LocalDate dataProximaVistoria) {
        this.dataProximaVistoria = dataProximaVistoria;
    }

    public String getSeguradora() {
        return seguradora;
    }

    public void setSeguradora(String seguradora) {
        this.seguradora = seguradora;
    }

    public String getNumeroApolice() {
        return numeroApolice;
    }

    public void setNumeroApolice(String numeroApolice) {
        this.numeroApolice = numeroApolice;
    }

    public LocalDate getDataValidadeSeguro() {
        return dataValidadeSeguro;
    }

    public void setDataValidadeSeguro(LocalDate dataValidadeSeguro) {
        this.dataValidadeSeguro = dataValidadeSeguro;
    }

    public Integer getKmAtual() {
        return kmAtual;
    }

    public void setKmAtual(Integer kmAtual) {
        this.kmAtual = kmAtual;
    }

    public LocalDate getDataUltimaManutencao() {
        return dataUltimaManutencao;
    }

    public void setDataUltimaManutencao(LocalDate dataUltimaManutencao) {
        this.dataUltimaManutencao = dataUltimaManutencao;
    }

    public Integer getKmProximaManutencao() {
        return kmProximaManutencao;
    }

    public void setKmProximaManutencao(Integer kmProximaManutencao) {
        this.kmProximaManutencao = kmProximaManutencao;
    }

    public String getObservacoes() {
        return observacoes;
    }

    public void setObservacoes(String observacoes) {
        this.observacoes = observacoes;
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

    public LocalDateTime getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(LocalDateTime dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public LocalDateTime getDataAtualizacao() {
        return dataAtualizacao;
    }

    public void setDataAtualizacao(LocalDateTime dataAtualizacao) {
        this.dataAtualizacao = dataAtualizacao;
    }
}