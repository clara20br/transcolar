package com.transcolar.sistema.dto;

import jakarta.validation.constraints.*;
import java.time.LocalDate;

public class VeiculoCreateDTO {

    @NotBlank(message = "Placa é obrigatória")
    @Pattern(regexp = "[A-Z]{3}[0-9][0-9A-Z][0-9]{2}", message = "Placa inválida. Formato: ABC1D23 ou ABC1234")
    private String placa;
    
    @NotBlank(message = "Marca é obrigatória")
    @Size(min = 2, max = 50, message = "Marca deve ter entre 2 e 50 caracteres")
    private String marca;
    
    @NotBlank(message = "Modelo é obrigatório")
    @Size(min = 2, max = 50, message = "Modelo deve ter entre 2 e 50 caracteres")
    private String modelo;
    
    @NotBlank(message = "Ano de fabricação é obrigatório")
    @Pattern(regexp = "\\d{4}", message = "Ano de fabricação deve ter 4 dígitos")
    private String anoFabricacao;
    
    @NotBlank(message = "Ano do modelo é obrigatório")
    @Pattern(regexp = "\\d{4}", message = "Ano do modelo deve ter 4 dígitos")
    private String anoModelo;
    
    @NotBlank(message = "Cor é obrigatória")
    private String cor;
    
    @NotBlank(message = "Renavam é obrigatório")
    @Size(min = 11, max = 11, message = "Renavam deve ter 11 dígitos")
    private String renavam;
    
    @NotBlank(message = "Chassi é obrigatório")
    @Size(min = 17, max = 17, message = "Chassi deve ter 17 caracteres")
    private String chassi;
    
    @NotBlank(message = "Categoria é obrigatória")
    private String categoria;
    
    @NotBlank(message = "Tipo de combustível é obrigatório")
    private String combustivel;
    
    @NotNull(message = "Capacidade de alunos é obrigatória")
    @Min(value = 1, message = "Capacidade mínima é 1 passageiro")
    @Max(value = 60, message = "Capacidade máxima é 60 passageiros")
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
    private Boolean disponivel = true;
    
    // ===== GETTERS E SETTERS =====
    
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
}