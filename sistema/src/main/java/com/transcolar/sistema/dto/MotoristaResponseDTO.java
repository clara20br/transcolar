package com.transcolar.sistema.dto;
import java.time.LocalDate;

public class MotoristaResponseDTO {
	
   private String nomeCompleto;
   private String cpf;
   private String rg;
   private LocalDate dataNascimento;
   private String estadoCivil;
   private String nacionalidade;
   private String numeroCnh;
   private String categoriaCnh;
   private LocalDate validadeCnh;
   private LocalDate dataPrimeiraCnh;
   private String telefone;
   private String telefoneEmergencia;
   private String email;
   private String logradouro;
   private String numero;
   private String complemento;
   private String bairro;
   private String cidade;
   private String estado;
   private String cep;
   private LocalDate dataAdmissao;
   private String status;
   private String numeroRegistro;
   private String tipoContrato;
   private String documentosEntregues;
   private LocalDate dataEntregaDocumentos;
   private String documentosPendentes;
   private String banco;
   private String agencia;
   private String contaCorrente;
   private String pix;
   private String observacoes;
   private boolean ativo;
   private LocalDate dataCadastro;
   private LocalDate dataAtualizacao;
   // Construtor completo
   public MotoristaResponseDTO(String nomeCompleto, String cpf, String rg, LocalDate dataNascimento,
                              String estadoCivil, String nacionalidade, String numeroCnh, String categoriaCnh,
                              LocalDate validadeCnh, LocalDate dataPrimeiraCnh, String telefone,
                              String telefoneEmergencia, String email, String logradouro, String numero,
                              String complemento, String bairro, String cidade, String estado, String cep,
                              LocalDate dataAdmissao, String status, String numeroRegistro, String tipoContrato,
                              String documentosEntregues, LocalDate dataEntregaDocumentos, String documentosPendentes,
                              String banco, String agencia, String contaCorrente, String pix,
                              String observacoes, boolean ativo, LocalDate dataCadastro, LocalDate dataAtualizacao) {
       this.nomeCompleto = nomeCompleto;
       this.cpf = cpf;
       this.rg = rg;
       this.dataNascimento = dataNascimento;
       this.estadoCivil = estadoCivil;
       this.nacionalidade = nacionalidade;
       this.numeroCnh = numeroCnh;
       this.categoriaCnh = categoriaCnh;
       this.validadeCnh = validadeCnh;
       this.dataPrimeiraCnh = dataPrimeiraCnh;
       this.telefone = telefone;
       this.telefoneEmergencia = telefoneEmergencia;
       this.email = email;
       this.logradouro = logradouro;
       this.numero = numero;
       this.complemento = complemento;
       this.bairro = bairro;
       this.cidade = cidade;
       this.estado = estado;
       this.cep = cep;
       this.dataAdmissao = dataAdmissao;
       this.status = status;
       this.numeroRegistro = numeroRegistro;
       this.tipoContrato = tipoContrato;
       this.documentosEntregues = documentosEntregues;
       this.dataEntregaDocumentos = dataEntregaDocumentos;
       this.documentosPendentes = documentosPendentes;
       this.banco = banco;
       this.agencia = agencia;
       this.contaCorrente = contaCorrente;
       this.pix = pix;
       this.observacoes = observacoes;
       this.ativo = ativo;
       this.dataCadastro = dataCadastro;
       this.dataAtualizacao = dataAtualizacao;
   }
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
   public LocalDate getDataCadastro() {
       return dataCadastro;
   }
   public void setDataCadastro(LocalDate dataCadastro) {
       this.dataCadastro = dataCadastro;
   }
   public LocalDate getDataAtualizacao() {
       return dataAtualizacao;
   }
   public void setDataAtualizacao(LocalDate dataAtualizacao) {
       this.dataAtualizacao = dataAtualizacao;
   }
}
