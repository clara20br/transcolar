package com.transcolar.sistema.entity;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "motoristas")
public class Motorista {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    // ================================ DADOS PESSOAIS ================================
    
    @Column(nullable = false, length = 100)
    private String nomeCompleto;
    
    @Column(unique = true, nullable = false, length = 14)
    private String cpf;
    
    @Column(unique = true, length = 20)
    private String rg;
    
    private LocalDate dataNascimento;
    
    @Column(length = 20)
    private String estadoCivil;
    
    @Column(length = 50)
    private String nacionalidade;
    
    // ================================ HABILITAÇÃO ================================
    
    @Column(name = "numero_cnh", unique = true, length = 20)
    private String numeroCnh;
    
    @Column(name = "categoria_cnh", length = 5)
    private String categoriaCnh;  // A, B, C, D, E
    
    @Column(name = "validade_cnh")
    private LocalDate validadeCnh;
    
    @Column(name = "data_primeira_cnh")
    private LocalDate dataPrimeiraCnh;
    
    // ================================ CONTATO ================================
    
    @Column(length = 20)
    private String telefone;
    
    @Column(length = 20)
    private String telefoneEmergencia;
    
    @Column(length = 100)
    private String email;
    
    // ================================ ENDEREÇO ================================
    
    @Column(length = 150)
    private String logradouro;
    
    @Column(length = 10)
    private String numero;
    
    @Column(length = 50)
    private String complemento;
    
    @Column(length = 100)
    private String bairro;
    
    @Column(length = 100)
    private String cidade;
    
    @Column(length = 2)
    private String estado;
    
    @Column(length = 10)
    private String cep;
    
    // ================================ DADOS PROFISSIONAIS ================================
    
    @Column(name = "data_admissao")
    private LocalDate dataAdmissao;
    
    @Column(length = 50)
    private String status;  // ATIVO, FERIAS, AFASTADO, DESLIGADO
    
    @Column(name = "numero_registro", unique = true, length = 30)
    private String numeroRegistro;
    
    @Column(name = "tipo_contrato", length = 30)
    private String tipoContrato;  // CLT, PJ, AUTONOMO
    
    // ================================ DOCUMENTOS ================================
    
    @Column(name = "documentos_entregues", length = 500)
    private String documentosEntregues;  // Guardar como texto: "RG,CPF,CNH,COMPROVANTE"
    
    @Column(name = "data_entrega_documentos")
    private LocalDate dataEntregaDocumentos;
    
    @Column(name = "documentos_pendentes", length = 500)
    private String documentosPendentes;
    
    // ================================ BANCÁRIO ================================
    
    @Column(length = 50)
    private String banco;
    
    @Column(length = 10)
    private String agencia;
    
    @Column(length = 20)
    private String contaCorrente;
    
    @Column(length = 30)
    private String pix;
    
    // ================================ OBSERVAÇÕES ================================
    
    @Column(length = 1000)
    private String observacoes;
    
    // ================================ CONTROLE DO SISTEMA ================================
    
    private boolean ativo = true;
    
    @Column(name = "data_cadastro")
    private LocalDateTime dataCadastro = LocalDateTime.now();
    
    @Column(name = "data_atualizacao")
    private LocalDateTime dataAtualizacao;
    
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

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public LocalDate getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(LocalDate dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(String estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public String getNacionalidade() {
        return nacionalidade;
    }

    public void setNacionalidade(String nacionalidade) {
        this.nacionalidade = nacionalidade;
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

    public LocalDate getValidadeCnh() {
        return validadeCnh;
    }

    public void setValidadeCnh(LocalDate validadeCnh) {
        this.validadeCnh = validadeCnh;
    }

    public LocalDate getDataPrimeiraCnh() {
        return dataPrimeiraCnh;
    }

    public void setDataPrimeiraCnh(LocalDate dataPrimeiraCnh) {
        this.dataPrimeiraCnh = dataPrimeiraCnh;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getTelefoneEmergencia() {
        return telefoneEmergencia;
    }

    public void setTelefoneEmergencia(String telefoneEmergencia) {
        this.telefoneEmergencia = telefoneEmergencia;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLogradouro() {
        return logradouro;
    }

    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public LocalDate getDataAdmissao() {
        return dataAdmissao;
    }

    public void setDataAdmissao(LocalDate dataAdmissao) {
        this.dataAdmissao = dataAdmissao;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getNumeroRegistro() {
        return numeroRegistro;
    }

    public void setNumeroRegistro(String numeroRegistro) {
        this.numeroRegistro = numeroRegistro;
    }

    public String getTipoContrato() {
        return tipoContrato;
    }

    public void setTipoContrato(String tipoContrato) {
        this.tipoContrato = tipoContrato;
    }

    public String getDocumentosEntregues() {
        return documentosEntregues;
    }

    public void setDocumentosEntregues(String documentosEntregues) {
        this.documentosEntregues = documentosEntregues;
    }

    public LocalDate getDataEntregaDocumentos() {
        return dataEntregaDocumentos;
    }

    public void setDataEntregaDocumentos(LocalDate dataEntregaDocumentos) {
        this.dataEntregaDocumentos = dataEntregaDocumentos;
    }

    public String getDocumentosPendentes() {
        return documentosPendentes;
    }

    public void setDocumentosPendentes(String documentosPendentes) {
        this.documentosPendentes = documentosPendentes;
    }

    public String getBanco() {
        return banco;
    }

    public void setBanco(String banco) {
        this.banco = banco;
    }

    public String getAgencia() {
        return agencia;
    }

    public void setAgencia(String agencia) {
        this.agencia = agencia;
    }

    public String getContaCorrente() {
        return contaCorrente;
    }

    public void setContaCorrente(String contaCorrente) {
        this.contaCorrente = contaCorrente;
    }

    public String getPix() {
        return pix;
    }

    public void setPix(String pix) {
        this.pix = pix;
    }

    public String getObservacoes() {
        return observacoes;
    }

    public void setObservacoes(String observacoes) {
        this.observacoes = observacoes;
    }

    public boolean isAtivo() {
        return ativo;
    }

    public void setAtivo(boolean ativo) {
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