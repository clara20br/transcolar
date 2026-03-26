package com.transcolar.sistema.entity;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "Cliente")
public class Cliente {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	//================================ DADOS CLIENTE ================================
	
	@Column(nullable = false,  length =100)
	private String nomeCompletoAluno;
	
	@Column(nullable = false,  length =100)
	private String nomeCompletoResponsavel1;
	
	@Column(nullable = false,  length =100)
	private String nomeCompletoResponsavel2;

	@Column(unique = true,  length =14)
	private String cpfAluno;
	
	@Column(unique = true,  length =14)
	private String cpfResponsavel1;
	
	@Column(unique = true,  length =14)
	private String cpfResponsavel2;
	
	private LocalDate dataNascimentoAluno;
	
	private LocalDate dataNascimentoResponsavel;
	
	private LocalDate dataNascimentoResponsavel2;
	
	@Column(nullable = false,  length =14)
	private String statusCivil;
	
	private boolean guardaCompartilhada;
	
	
	//================================ CONTATO ================================
	
	@Column(length = 20)
	private String telefoneResponsavel;
	
	@Column(length = 20)
	private String telefone;
	
	@Column(length = 100)
	private String emailResponsavel;
	
	// ================================ ENDEREÇO ================================

	private String rua;
	private String numero;
	private String Complemento;
	private String bairro;
	private String cidade;
	private String estado;
	private String cep;
	
	
	//================================IMPORTANTE ================================
	
	
	@Column(nullable = false,  length = 100)
	private String escola;
	
	@Column(nullable = false,  length = 100)
	private String localtrabalho;
	

	private boolean informacaoMedicas = true;
	
	
	@Column( length = 500)
	private String descricao;
	
	
	// ================================CONTROLE SISTEMA ================================
	
	private boolean ativo = true;
	
	private LocalDateTime dataCadastro = LocalDateTime.now();

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNomeCompletoAluno() {
		return nomeCompletoAluno;
	}

	public void setNomeCompletoAluno(String nomeCompletoAluno) {
		this.nomeCompletoAluno = nomeCompletoAluno;
	}

	public String getNomeCompletoResponsavel1() {
		return nomeCompletoResponsavel1;
	}

	public void setNomeCompletoResponsavel1(String nomeCompletoResponsavel1) {
		this.nomeCompletoResponsavel1 = nomeCompletoResponsavel1;
	}

	public String getNomeCompletoResponsavel2() {
		return nomeCompletoResponsavel2;
	}

	public void setNomeCompletoResponsavel2(String nomeCompletoResponsavel2) {
		this.nomeCompletoResponsavel2 = nomeCompletoResponsavel2;
	}

	public String getCpfAluno() {
		return cpfAluno;
	}

	public void setCpfAluno(String cpfAluno) {
		this.cpfAluno = cpfAluno;
	}

	public String getCpfResponsavel1() {
		return cpfResponsavel1;
	}

	public void setCpfResponsavel1(String cpfResponsavel1) {
		this.cpfResponsavel1 = cpfResponsavel1;
	}

	public String getCpfResponsavel2() {
		return cpfResponsavel2;
	}

	public void setCpfResponsavel2(String cpfResponsavel2) {
		this.cpfResponsavel2 = cpfResponsavel2;
	}

	public LocalDate getDataNascimentoAluno() {
		return dataNascimentoAluno;
	}

	public void setDataNascimentoAluno(LocalDate dataNascimentoAluno) {
		this.dataNascimentoAluno = dataNascimentoAluno;
	}

	public LocalDate getDataNascimentoResponsavel() {
		return dataNascimentoResponsavel;
	}

	public void setDataNascimentoResponsavel(LocalDate dataNascimentoResponsavel) {
		this.dataNascimentoResponsavel = dataNascimentoResponsavel;
	}

	public LocalDate getDataNascimentoResponsavel2() {
		return dataNascimentoResponsavel2;
	}

	public void setDataNascimentoResponsavel2(LocalDate dataNascimentoResponsavel2) {
		this.dataNascimentoResponsavel2 = dataNascimentoResponsavel2;
	}

	public String getStatusCivil() {
		return statusCivil;
	}

	public void setStatusCivil(String statusCivil) {
		this.statusCivil = statusCivil;
	}

	public boolean isGuardaCompartilhada() {
		return guardaCompartilhada;
	}

	public void setGuardaCompartilhada(boolean guardaCompartilhada) {
		this.guardaCompartilhada = guardaCompartilhada;
	}

	public String getTelefoneResponsavel() {
		return telefoneResponsavel;
	}

	public void setTelefoneResponsavel(String telefoneResponsavel) {
		this.telefoneResponsavel = telefoneResponsavel;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getEmailResponsavel() {
		return emailResponsavel;
	}

	public void setEmailResponsavel(String emailResponsavel) {
		this.emailResponsavel = emailResponsavel;
	}

	public String getRua() {
		return rua;
	}

	public void setRua(String rua) {
		this.rua = rua;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getComplemento() {
		return Complemento;
	}

	public void setComplemento(String complemento) {
		Complemento = complemento;
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

	public String getEscola() {
		return escola;
	}

	public void setEscola(String escola) {
		this.escola = escola;
	}

	public String getLocaltrabalho() {
		return localtrabalho;
	}

	public void setLocaltrabalho(String localtrabalho) {
		this.localtrabalho = localtrabalho;
	}

	public boolean isInformacaoMedicas() {
		return informacaoMedicas;
	}

	public void setInformacaoMedicas(boolean informacaoMedicas) {
		this.informacaoMedicas = informacaoMedicas;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
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
	

	//================================ GETTERS SETTERS ================================



		
	
}
