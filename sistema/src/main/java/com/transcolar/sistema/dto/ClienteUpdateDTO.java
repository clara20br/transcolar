package com.transcolar.sistema.dto;

import java.time.LocalDate;

import jakarta.validation.constraints.*;

public class ClienteUpdateDTO {

@NotBlank
@Size(min = 3, max = 150)
private String nomeCompletoAluno;
@NotBlank
@Size(min = 3, max = 150)
private String nomeCompletoResponsavel1;
@NotBlank
@Size(min = 3, max = 150)
private String nomeCompletoResponsavel2;
@Past
private LocalDate dataNascimentoAluno;
@Past
private LocalDate dataNascimentoResponsavel;
@Past
private LocalDate dataNascimentoResponsavel2;
@NotBlank
private String telefoneResponsavel;
@NotBlank
private String telefone;
@Email
private String emailResponsavel;
private String escola;
private String localtrabalho;
private boolean informacaoMedicas;
private String descricao;
private boolean ativo;
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
public boolean isAtivo() {
	return ativo;
}
public void setAtivo(boolean ativo) {
	this.ativo = ativo;
}



}
