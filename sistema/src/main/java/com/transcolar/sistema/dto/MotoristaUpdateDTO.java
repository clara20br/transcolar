package com.transcolar.sistema.dto;

import jakarta.validation.constraints.*;
import java.time.LocalDate;

public class MotoristaUpdateDTO {

    @NotBlank(message = "Nome completo é obrigatório")
    @Size(min = 3, max = 100, message = "Nome deve ter entre 3 e 100 caracteres")
    private String nomeCompleto;
    
    @NotBlank(message = "CPF é obrigatório")
    @Pattern(regexp = "\\d{3}\\.\\d{3}\\.\\d{3}-\\d{2}", message = "CPF deve estar no formato 000.000.000-00")
    private String cpf;
    
    @Size(max = 20, message = "RG deve ter no máximo 20 caracteres")
    private String rg;
    
    @Past(message = "Data de nascimento deve ser uma data passada")
    private LocalDate dataNascimento;
    
    private String estadoCivil;
    private String nacionalidade;
    
    // Habilitação
    @NotBlank(message = "Número da CNH é obrigatório")
    private String numeroCnh;
    
    @NotBlank(message = "Categoria da CNH é obrigatória")
    @Pattern(regexp = "[ABCDE]", message = "Categoria deve ser A, B, C, D ou E")
    private String categoriaCnh;
    
    @Future(message = "Validade da CNH deve ser uma data futura")
    private LocalDate validadeCnh;
    
    private LocalDate dataPrimeiraCnh;
    
    // Contato
    @NotBlank(message = "Telefone é obrigatório")
    private String telefone;
    
    private String telefoneEmergencia;
    
    @Email(message = "Email deve ser válido")
    private String email;
    
    // Endereço
    private String logradouro;
    private String numero;
    private String complemento;
    private String bairro;
    private String cidade;
    private String estado;
    private String cep;
    
    // Dados Profissionais
    private LocalDate dataAdmissao;
    private String status;
    private String numeroRegistro;
    private String tipoContrato;
    
    // Documentos
    private String documentosEntregues;
    private LocalDate dataEntregaDocumentos;
    private String documentosPendentes;
    
    // Bancário
    private String banco;
    private String agencia;
    private String contaCorrente;
    private String pix;
    
    // Observações
    private String observacoes;
    
    // Status do sistema
    private boolean ativo;

    // ================================ GETTERS E SETTERS ================================

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
}