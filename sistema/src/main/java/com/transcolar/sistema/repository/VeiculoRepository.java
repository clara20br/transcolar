package com.transcolar.sistema.repository;

import com.transcolar.sistema.entity.Veiculo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface VeiculoRepository extends JpaRepository<Veiculo, Long> {
    
    // Buscar por placa (única)
    Optional<Veiculo> findByPlaca(String placa);
    
    // Buscar por renavam (único)
    Optional<Veiculo> findByRenavam(String renavam);
    
    // Buscar por chassi (único)
    Optional<Veiculo> findByChassi(String chassi);
    
    // Listar veículos disponíveis
    List<Veiculo> findByDisponivelTrue();
    
    // Listar veículos por categoria
    List<Veiculo> findByCategoria(String categoria);
    
    // Verificar se placa já existe (ignorando maiúsculas/minúsculas)
    boolean existsByPlacaIgnoreCase(String placa);
    
    // Verificar se renavam já existe
    boolean existsByRenavam(String renavam);
}
