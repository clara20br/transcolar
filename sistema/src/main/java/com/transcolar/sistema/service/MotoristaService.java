package com.transcolar.sistema.service;

import com.transcolar.sistema.entity.Motorista;
import com.transcolar.sistema.repository.MotoristaRepository;
import com.transcolar.sistema.dto.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class MotoristaService {
    
    private final MotoristaRepository repository;
    
    public MotoristaService(MotoristaRepository repository) {
        this.repository = repository;
    }
    
    // ================================ MÉTODOS PRINCIPAIS ================================
    
    /**
     * CADASTRAR MOTORISTA
     */
    @Transactional
    public MotoristaResponseDTO cadastrar(MotoristaCreateDTO createDTO) {
        
        // Validar CPF único
        if (repository.findByCpf(createDTO.getCpf()).isPresent()) {
            throw new RuntimeException("CPF já cadastrado no sistema!");
        }
        
        // Validar CNH única
        if (repository.findByNumeroCnh(createDTO.getNumeroCnh()).isPresent()) {
            throw new RuntimeException("CNH já cadastrada no sistema!");
        }
        
        // Converter DTO para Entity
        Motorista motorista = convertToEntity(createDTO);
        
        // Definir valores padrão
        motorista.setAtivo(true);
        motorista.setDataCadastro(LocalDateTime.now());
        
        // Se status não foi informado, definir como "ATIVO"
        if (motorista.getStatus() == null || motorista.getStatus().isBlank()) {
            motorista.setStatus("ATIVO");
        }
        
        // Salvar no banco
        Motorista savedMotorista = repository.save(motorista);
        
        // Converter Entity para ResponseDTO e retornar
        return convertToResponseDTO(savedMotorista);
    }
    
    /**
     * LISTAR TODOS OS MOTORISTAS (versão resumida)
     */
    public List<MotoristaListResponseDTO> listarTodos() {
        return repository.findAll()
                .stream()
                .map(this::convertToListResponseDTO)
                .collect(Collectors.toList());
    }
    
    /**
     * LISTAR APENAS MOTORISTAS ATIVOS
     */
    public List<MotoristaListResponseDTO> listarAtivos() {
        return repository.findByAtivoTrue()
                .stream()
                .map(this::convertToListResponseDTO)
                .collect(Collectors.toList());
    }
    
    /**
     * BUSCAR MOTORISTA POR ID (versão completa)
     */
    public MotoristaResponseDTO buscarPorId(Long id) {
        Motorista motorista = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Motorista não encontrado com ID: " + id));
        return convertToResponseDTO(motorista);
    }
    
    /**
     * ATUALIZAR MOTORISTA
     */
    @Transactional
    public MotoristaResponseDTO atualizar(Long id, MotoristaUpdateDTO updateDTO) {
        
        // Buscar motorista existente
        Motorista motoristaExistente = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Motorista não encontrado com ID: " + id));
        
        // Validar CPF único (exceto para o próprio motorista)
        if (repository.existsByCpfAndIdNot(updateDTO.getCpf(), id)) {
            throw new RuntimeException("CPF já cadastrado para outro motorista!");
        }
        
        // Validar CNH única (exceto para o próprio motorista)
        if (repository.existsByNumeroCnhAndIdNot(updateDTO.getNumeroCnh(), id)) {
            throw new RuntimeException("CNH já cadastrada para outro motorista!");
        }
        
        // Atualizar dados do motorista
        updateEntityFromDTO(motoristaExistente, updateDTO);
        
        // Atualizar data de modificação
        motoristaExistente.setDataAtualizacao(LocalDateTime.now());
        
        // Salvar alterações
        Motorista updatedMotorista = repository.save(motoristaExistente);
        
        return convertToResponseDTO(updatedMotorista);
    }
    
    /**
     * DELETAR MOTORISTA (físico)
     */
    @Transactional
    public void deletar(Long id) {
        if (!repository.existsById(id)) {
            throw new RuntimeException("Motorista não encontrado com ID: " + id);
        }
        repository.deleteById(id);
    }
    
    /**
     * INATIVAR MOTORISTA (desativação lógica)
     */
    @Transactional
    public void inativar(Long id) {
        Motorista motorista = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Motorista não encontrado com ID: " + id));
        motorista.setAtivo(false);
        motorista.setDataAtualizacao(LocalDateTime.now());
        repository.save(motorista);
    }
    
    /**
     * ATIVAR MOTORISTA
     */
    @Transactional
    public void ativar(Long id) {
        Motorista motorista = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Motorista não encontrado com ID: " + id));
        motorista.setAtivo(true);
        motorista.setDataAtualizacao(LocalDateTime.now());
        repository.save(motorista);
    }
    
    // ================================ MÉTODOS DE BUSCA ESPECÍFICOS ================================
    
    /**
     * BUSCAR MOTORISTAS POR NOME
     */
    public List<MotoristaListResponseDTO> buscarPorNome(String nome) {
        return repository.findByNomeCompletoContainingIgnoreCase(nome)
                .stream()
                .map(this::convertToListResponseDTO)
                .collect(Collectors.toList());
    }
    
    /**
     * BUSCAR MOTORISTAS POR STATUS
     */
    public List<MotoristaListResponseDTO> buscarPorStatus(String status) {
        return repository.findByStatus(status)
                .stream()
                .map(this::convertToListResponseDTO)
                .collect(Collectors.toList());
    }
    
    /**
     * BUSCAR MOTORISTAS COM CNH A VENCER (próximos 30 dias)
     */
    public List<MotoristaListResponseDTO> buscarCnhAVencer() {
        LocalDate hoje = LocalDate.now();
        LocalDate daqui30Dias = hoje.plusDays(30);
        
        return repository.findMotoristasComCnhAVencer(hoje, daqui30Dias)
                .stream()
                .map(this::convertToListResponseDTO)
                .collect(Collectors.toList());
    }
    
    // ================================ MÉTODOS DE CONVERSÃO ================================
    
    /**
     * Converter CreateDTO para Entity
     */
    private Motorista convertToEntity(MotoristaCreateDTO dto) {
        Motorista motorista = new Motorista();
        
        // Dados Pessoais
        motorista.setNomeCompleto(dto.getNomeCompleto());
        motorista.setCpf(dto.getCpf());
        motorista.setRg(dto.getRg());
        motorista.setDataNascimento(dto.getDataNascimento());
        motorista.setEstadoCivil(dto.getEstadoCivil());
        motorista.setNacionalidade(dto.getNacionalidade());
        
        // Habilitação
        motorista.setNumeroCnh(dto.getNumeroCnh());
        motorista.setCategoriaCnh(dto.getCategoriaCnh());
        motorista.setValidadeCnh(dto.getValidadeCnh());
        motorista.setDataPrimeiraCnh(dto.getDataPrimeiraCnh());
        
        // Contato
        motorista.setTelefone(dto.getTelefone());
        motorista.setTelefoneEmergencia(dto.getTelefoneEmergencia());
        motorista.setEmail(dto.getEmail());
        
        // Endereço
        motorista.setLogradouro(dto.getLogradouro());
        motorista.setNumero(dto.getNumero());
        motorista.setComplemento(dto.getComplemento());
        motorista.setBairro(dto.getBairro());
        motorista.setCidade(dto.getCidade());
        motorista.setEstado(dto.getEstado());
        motorista.setCep(dto.getCep());
        
        // Dados Profissionais
        motorista.setDataAdmissao(dto.getDataAdmissao());
        motorista.setStatus(dto.getStatus());
        motorista.setNumeroRegistro(dto.getNumeroRegistro());
        motorista.setTipoContrato(dto.getTipoContrato());
        
        // Documentos
        motorista.setDocumentosEntregues(dto.getDocumentosEntregues());
        motorista.setDataEntregaDocumentos(dto.getDataEntregaDocumentos());
        motorista.setDocumentosPendentes(dto.getDocumentosPendentes());
        
        // Bancário
        motorista.setBanco(dto.getBanco());
        motorista.setAgencia(dto.getAgencia());
        motorista.setContaCorrente(dto.getContaCorrente());
        motorista.setPix(dto.getPix());
        
        // Observações
        motorista.setObservacoes(dto.getObservacoes());
        
        return motorista;
    }
    
    /**
     * Atualizar Entity a partir de UpdateDTO
     */
    private void updateEntityFromDTO(Motorista motorista, MotoristaUpdateDTO dto) {
        
        // Dados Pessoais
        motorista.setNomeCompleto(dto.getNomeCompleto());
        motorista.setCpf(dto.getCpf());
        motorista.setRg(dto.getRg());
        motorista.setDataNascimento(dto.getDataNascimento());
        motorista.setEstadoCivil(dto.getEstadoCivil());
        motorista.setNacionalidade(dto.getNacionalidade());
        
        // Habilitação
        motorista.setNumeroCnh(dto.getNumeroCnh());
        motorista.setCategoriaCnh(dto.getCategoriaCnh());
        motorista.setValidadeCnh(dto.getValidadeCnh());
        motorista.setDataPrimeiraCnh(dto.getDataPrimeiraCnh());
        
        // Contato
        motorista.setTelefone(dto.getTelefone());
        motorista.setTelefoneEmergencia(dto.getTelefoneEmergencia());
        motorista.setEmail(dto.getEmail());
        
        // Endereço
        motorista.setLogradouro(dto.getLogradouro());
        motorista.setNumero(dto.getNumero());
        motorista.setComplemento(dto.getComplemento());
        motorista.setBairro(dto.getBairro());
        motorista.setCidade(dto.getCidade());
        motorista.setEstado(dto.getEstado());
        motorista.setCep(dto.getCep());
        
        // Dados Profissionais
        motorista.setDataAdmissao(dto.getDataAdmissao());
        motorista.setStatus(dto.getStatus());
        motorista.setNumeroRegistro(dto.getNumeroRegistro());
        motorista.setTipoContrato(dto.getTipoContrato());
        
        // Documentos
        motorista.setDocumentosEntregues(dto.getDocumentosEntregues());
        motorista.setDataEntregaDocumentos(dto.getDataEntregaDocumentos());
        motorista.setDocumentosPendentes(dto.getDocumentosPendentes());
        
        // Bancário
        motorista.setBanco(dto.getBanco());
        motorista.setAgencia(dto.getAgencia());
        motorista.setContaCorrente(dto.getContaCorrente());
        motorista.setPix(dto.getPix());
        
        // Observações e status
        motorista.setObservacoes(dto.getObservacoes());
        motorista.setAtivo(dto.isAtivo());
    }
    
    /**
     * Converter Entity para ResponseDTO (detalhado)
     */
    private MotoristaResponseDTO convertToResponseDTO(Motorista m) {
        return new MotoristaResponseDTO(
            m.getNomeCompleto(),
            m.getCpf(),
            m.getRg(),
            m.getDataNascimento(),
            m.getEstadoCivil(),
            m.getNacionalidade(),
            m.getNumeroCnh(),
            m.getCategoriaCnh(),
            m.getValidadeCnh(),
            m.getDataPrimeiraCnh(),
            m.getTelefone(),
            m.getTelefoneEmergencia(),
            m.getEmail(),
            m.getLogradouro(),
            m.getNumero(),
            m.getComplemento(),
            m.getBairro(),
            m.getCidade(),
            m.getEstado(),
            m.getCep(),
            m.getDataAdmissao(),
            m.getStatus(),
            m.getNumeroRegistro(),
            m.getTipoContrato(),
            m.getDocumentosEntregues(),
            m.getDataEntregaDocumentos(),
            m.getDocumentosPendentes(),
            m.getBanco(),
            m.getAgencia(),
            m.getContaCorrente(),
            m.getPix(),
            m.getObservacoes(),
            m.isAtivo(),
            m.getDataCadastro() != null ? m.getDataCadastro().toLocalDate() : LocalDate.now(),
            m.getDataAtualizacao() != null ? m.getDataAtualizacao().toLocalDate() : null
        );
    }
    
    /**
     * Converter Entity para ListResponseDTO (resumido)
     */
    private MotoristaListResponseDTO convertToListResponseDTO(Motorista m) {
        return new MotoristaListResponseDTO(
            m.getId(),
            m.getNomeCompleto(),
            m.getCpf(),
            m.getNumeroCnh(),
            m.getCategoriaCnh(),
            m.getTelefone(),
            m.getStatus(),
            m.isAtivo()
        );
    }
}