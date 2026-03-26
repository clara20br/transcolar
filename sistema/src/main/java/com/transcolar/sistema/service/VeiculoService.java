package com.transcolar.sistema.service;

import com.transcolar.sistema.entity.Veiculo;
import com.transcolar.sistema.repository.VeiculoRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class VeiculoService {

    private final VeiculoRepository repository;

    public VeiculoService(VeiculoRepository repository) {
        this.repository = repository;
    }

    // ===== CADASTRAR VEÍCULO =====
    @Transactional
    public Veiculo cadastrar(Veiculo veiculo) {
        // Validar placa única
        if (repository.existsByPlacaIgnoreCase(veiculo.getPlaca())) {
            throw new RuntimeException("Placa já cadastrada: " + veiculo.getPlaca());
        }

        // Validar renavam único
        if (repository.existsByRenavam(veiculo.getRenavam())) {
            throw new RuntimeException("Renavam já cadastrado: " + veiculo.getRenavam());
        }

        // Validar chassi único (pode ser feito com query personalizada também)
        if (repository.findByChassi(veiculo.getChassi()).isPresent()) {
            throw new RuntimeException("Chassi já cadastrado: " + veiculo.getChassi());
        }

        // Se tem observações mas não tem informação médica (adaptado para veículo)
        // Podemos ter uma regra similar: se tem observações, pode ser livre
        
        return repository.save(veiculo);
    }

    // ===== LISTAR TODOS =====
    public List<Veiculo> listarTodos() {
        return repository.findAll();
    }

    // ===== BUSCAR POR ID =====
    public Veiculo buscarPorId(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Veículo não encontrado com ID: " + id));
    }
    public Veiculo atualizar(Veiculo veiculo) {
        veiculo.setDataAtualizacao(LocalDateTime.now());
        return repository.save(veiculo);
    }

    public void deletar(Long id) {
        Veiculo veiculo = buscarPorId(id);
        veiculo.setAtivo(false); // Desativa ao invés de deletar
        veiculo.setDataAtualizacao(LocalDateTime.now());
        repository.save(veiculo);
    }

    public List<Veiculo> listarDisponiveis() {
        return repository.findByDisponivelTrue();
    }

    public Veiculo buscarPorPlaca(String placa) {
        return repository.findByPlaca(placa)
                .orElseThrow(() -> new RuntimeException("Veículo não encontrado com placa: " + placa));
    }

    public List<Veiculo> buscarPorCategoria(String categoria) {
        return repository.findByCategoria(categoria);
    }

    public Veiculo atualizarKm(Long id, Integer kmAtual) {
        Veiculo veiculo = buscarPorId(id);
        veiculo.setKmAtual(kmAtual);
        veiculo.setDataAtualizacao(LocalDateTime.now());
        return repository.save(veiculo);
    }

    public Veiculo alternarDisponibilidade(Long id) {
        Veiculo veiculo = buscarPorId(id);
        veiculo.setDisponivel(!veiculo.getDisponivel());
        veiculo.setDataAtualizacao(LocalDateTime.now());
        return repository.save(veiculo);
    }
}