package com.transcolar.sistema.dto;

public class ClienteListResponseDTO {

	private long id;
	private String nomeCompletoAluno;
	private String nomeCompletoResponsavel1;
	private String nomeCompletoResponsavel2;
	private String cpfAluno;
	private String cpfResponsavel1;
	private String cpfResponsavel2;
	private boolean ativo;
	
	
	public ClienteListResponseDTO(long id, String nomeCompletoAluno, String nomeCompletoResponsavel1,
			String nomeCompletoResponsavel2, String cpfAluno, String cpfResponsavel1, String cpfResponsavel2,
			boolean ativo) {

		this.id = id;
		this.nomeCompletoAluno = nomeCompletoAluno;
		this.nomeCompletoResponsavel1 = nomeCompletoResponsavel1;
		this.nomeCompletoResponsavel2 = nomeCompletoResponsavel2;
		this.cpfAluno = cpfAluno;
		this.cpfResponsavel1 = cpfResponsavel1;
		this.cpfResponsavel2 = cpfResponsavel2;
		this.ativo = ativo;
	}


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


	public boolean isAtivo() {
		return ativo;
	}


	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}
	
	
	
	
	
}
