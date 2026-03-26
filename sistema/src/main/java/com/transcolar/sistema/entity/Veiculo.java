package com.transcolar.sistema.entity;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "veiculos")
public class Veiculo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    // ============================ DADOS DO VEÍCULO ============================
    
    @Column(nullable = false, length = 20)
    private String placa;
    
    @Column(nullable = false, length = 50)
    private String marca;
    
    @Column(nullable = false, length = 50)
    private String modelo;
    
    @Column(nullable = false, length = 20)
    private String anoFabricacao;
    
    @Column(nullable = false, length = 20)
    private String anoModelo;
    
    @Column(nullable = false, length = 30)
    private String cor;
    
    @Column(nullable = false, length = 20)
    private String renavam;
    
    @Column(nullable = false, length = 20)
    private String chassi;
    
    @Column(nullable = false, length = 30)
    private String categoria; // Particular, Escolar, Transporte, etc.
    
    @Column(nullable = false, length = 20)
    private String combustivel; // Gasolina, Diesel, Flex, Elétrico
    
    @Column(nullable = false)
    private Integer capacidadeAlunos;
    
    // ============================ DOCUMENTAÇÃO ============================
    
    @Column(name = "data_licenciamento")
    private LocalDate dataLicenciamento;
    
    @Column(name = "data_ultima_vistoria")
    private LocalDate dataUltimaVistoria;
    
    @Column(name = "data_proxima_vistoria")
    private LocalDate dataProximaVistoria;
    
    @Column(name = "seguradora", length = 100)
    private String seguradora;
    
    @Column(name = "numero_apolice", length = 50)
    private String numeroApolice;
    
    @Column(name = "data_validade_seguro")
    private LocalDate dataValidadeSeguro;
    
    // ============================ MANUTENÇÃO ============================
    
    @Column(name = "km_atual")
    private Integer kmAtual;
    
    @Column(name = "data_ultima_manutencao")
    private LocalDate dataUltimaManutencao;
    
    @Column(name = "km_proxima_manutencao")
    private Integer kmProximaManutencao;
    
    @Column(name = "observacoes", length = 500)
    private String observacoes;
    
    // ============================ STATUS ============================
    
    @Column(nullable = false)
    private Boolean disponivel = true;
    
    @Column(nullable = false)
    private Boolean ativo = true;
    
    @Column(nullable = false)
    private LocalDateTime dataCadastro = LocalDateTime.now();
    
    @Column(name = "data_atualizacao")
    private LocalDateTime dataAtualizacao;
    
    // ============================ GETTERS E SETTERS ============================
    
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