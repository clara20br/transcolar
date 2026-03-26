package com.transcolar.sistema.service;

import org.springframework.stereotype.Service;

import com.transcolar.sistema.entity.Cliente;
import com.transcolar.sistema.repository.ClienteRepository;

import java.util.List;

@Service
public class ClienteService {
    
    private final ClienteRepository repository;
    
    public ClienteService(ClienteRepository repository) {
        this.repository = repository;
    }
    
    // CADASTRAR CLIENTE
    public Cliente cadastrar(Cliente cliente) {
        
        if (repository.findByCpfResponsavel1(cliente.getCpfResponsavel1()).isPresent()) {
            throw new RuntimeException("CPF já Cadastrado!");
        }
        
        if (cliente.isInformacaoMedicas() && (cliente.getDescricao() == null || cliente.getDescricao().isBlank())) {
            throw new RuntimeException("Descrição da Condição Médica é obrigatória quando há informações médicas.");
        }
        
        return repository.save(cliente);
    }
    
    // LISTAR TODOS OS CLIENTES
    public List<Cliente> listarTodos(){
        return repository.findAll();        
    }
    
    // BUSCAR CLIENTE POR ID
    public Cliente buscarPorId(Long id) {
        return repository.findById(id)
            .orElseThrow(() -> new RuntimeException("Cliente não encontrado com ID: " + id));
    }
    
    // ATUALIZAR CLIENTE (VERSÃO COMPLETA)
    public Cliente atualizar(Long id, Cliente clienteAtualizado) {
        // Busca o cliente existente
        Cliente clienteExistente = repository.findById(id)
            .orElseThrow(() -> new RuntimeException("Cliente não encontrado com ID: " + id));
        
        // DADOS DO CLIENTE
        clienteExistente.setNomeCompletoAluno(clienteAtualizado.getNomeCompletoAluno());
        clienteExistente.setNomeCompletoResponsavel1(clienteAtualizado.getNomeCompletoResponsavel1());
        clienteExistente.setNomeCompletoResponsavel2(clienteAtualizado.getNomeCompletoResponsavel2());
        clienteExistente.setCpfAluno(clienteAtualizado.getCpfAluno());
        clienteExistente.setCpfResponsavel1(clienteAtualizado.getCpfResponsavel1());
        clienteExistente.setCpfResponsavel2(clienteAtualizado.getCpfResponsavel2());
        clienteExistente.setDataNascimentoAluno(clienteAtualizado.getDataNascimentoAluno());
        clienteExistente.setDataNascimentoResponsavel(clienteAtualizado.getDataNascimentoResponsavel());
        clienteExistente.setDataNascimentoResponsavel2(clienteAtualizado.getDataNascimentoResponsavel2());
        clienteExistente.setStatusCivil(clienteAtualizado.getStatusCivil());
        clienteExistente.setGuardaCompartilhada(clienteAtualizado.isGuardaCompartilhada());
        
        // CONTATO
        clienteExistente.setTelefoneResponsavel(clienteAtualizado.getTelefoneResponsavel());
        clienteExistente.setTelefone(clienteAtualizado.getTelefone());
        clienteExistente.setEmailResponsavel(clienteAtualizado.getEmailResponsavel());
        
        // ENDEREÇO
        clienteExistente.setRua(clienteAtualizado.getRua());
        clienteExistente.setNumero(clienteAtualizado.getNumero());
        clienteExistente.setComplemento(clienteAtualizado.getComplemento());
        clienteExistente.setBairro(clienteAtualizado.getBairro());
        clienteExistente.setCidade(clienteAtualizado.getCidade());
        clienteExistente.setEstado(clienteAtualizado.getEstado());
        clienteExistente.setCep(clienteAtualizado.getCep());
        
        // INFORMAÇÕES IMPORTANTES
        clienteExistente.setEscola(clienteAtualizado.getEscola());
        clienteExistente.setLocaltrabalho(clienteAtualizado.getLocaltrabalho());
        clienteExistente.setInformacaoMedicas(clienteAtualizado.isInformacaoMedicas());
        clienteExistente.setDescricao(clienteAtualizado.getDescricao());
        
        // CONTROLE DO SISTEMA
        clienteExistente.setAtivo(clienteAtualizado.isAtivo());
        // NÃO atualiza id e dataCadastro
        
        // Valida a regra de negócio para informações médicas
        if (clienteExistente.isInformacaoMedicas() && 
            (clienteExistente.getDescricao() == null || clienteExistente.getDescricao().isBlank())) {
            throw new RuntimeException("Descrição da Condição Médica é obrigatória quando há informações médicas.");
        }
        
        return repository.save(clienteExistente);
    }
    
    // DELETAR CLIENTE
    public void deletar(Long id) {
        Cliente cliente = buscarPorId(id);
        repository.delete(cliente);
    }
}