package com.transcolar.sistema.dto;

import java.time.LocalDate;

public class ClienteCreateDTO {

	private String nomeCompletoAluno;
	private String nomeCompletoResponsavel1;
	private String nomeCompletoResponsavel2;
	private String cpfAluno;
	private String cpfResponsavel1;
	private String cpfResponsavel2;
	private LocalDate dataNascimentoAluno;	
	private LocalDate dataNascimentoResponsavel;	
	private LocalDate dataNascimentoResponsavel2;
	private String statusCivil;
	private boolean guardaCompartilhada;
	private String telefoneResponsavel;
	private String telefone;
	private String emailResponsavel;
	private String escola;
	private String localtrabalho;
	private boolean informacaoMedicas;
	private String descricao;
	
	
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
	
	
}
