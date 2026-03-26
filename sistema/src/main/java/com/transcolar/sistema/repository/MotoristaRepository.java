package com.transcolar.sistema.repository;

import com.transcolar.sistema.entity.Motorista;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface MotoristaRepository extends JpaRepository<Motorista, Long> {

    // Busca por CPF (exato)
    Optional<Motorista> findByCpf(String cpf);
    
    // Busca por número da CNH
    Optional<Motorista> findByNumeroCnh(String numeroCnh);
    
    // Busca por número de registro
    Optional<Motorista> findByNumeroRegistro(String numeroRegistro);
    
    // Busca por status (ATIVO, FERIAS, etc)
    List<Motorista> findByStatus(String status);
    
    // Busca motoristas ativos
    List<Motorista> findByAtivoTrue();
    
    // Busca motoristas inativos
    List<Motorista> findByAtivoFalse();
    
    // Busca por nome (contendo, ignorando maiúsculas/minúsculas)
    List<Motorista> findByNomeCompletoContainingIgnoreCase(String nome);
    
    @Query("SELECT m FROM Motorista m WHERE m.validadeCnh BETWEEN :dataInicio AND :dataFim")
    List<Motorista> findMotoristasComCnhAVencer(@Param("dataInicio") LocalDate dataInicio, 
                                                @Param("dataFim") LocalDate dataFim);
    
    
    // Verifica se CPF já existe (ignorando o próprio ID em atualizações)
    @Query("SELECT CASE WHEN COUNT(m) > 0 THEN true ELSE false END FROM Motorista m WHERE m.cpf = :cpf AND m.id != :id")
    boolean existsByCpfAndIdNot(@Param("cpf") String cpf, @Param("id") Long id);
    
    // Verifica se CNH já existe (ignorando o próprio ID em atualizações)
    @Query("SELECT CASE WHEN COUNT(m) > 0 THEN true ELSE false END FROM Motorista m WHERE m.numeroCnh = :numeroCnh AND m.id != :id")
    boolean existsByNumeroCnhAndIdNot(@Param("numeroCnh") String numeroCnh, @Param("id") Long id);
    
    // Conta motoristas por status
    @Query("SELECT m.status, COUNT(m) FROM Motorista m GROUP BY m.status")
    List<Object[]> countMotoristasByStatus();
    
    // Busca motoristas por cidade
    List<Motorista> findByCidadeIgnoreCase(String cidade);
}