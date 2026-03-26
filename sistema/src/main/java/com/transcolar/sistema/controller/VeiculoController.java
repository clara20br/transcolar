package com.transcolar.sistema.controller;

import com.transcolar.sistema.dto.VeiculoCreateDTO;
import com.transcolar.sistema.dto.VeiculoListResponseDTO;
import com.transcolar.sistema.dto.VeiculoResponseDTO;
import com.transcolar.sistema.dto.VeiculoUpdateDTO;
import com.transcolar.sistema.entity.Veiculo;
import com.transcolar.sistema.service.VeiculoService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/veiculos")
public class VeiculoController {

    private final VeiculoService service;

    public VeiculoController(VeiculoService service) {
        this.service = service;
    }

    // ===== 1. CADASTRAR VEÍCULO (POST) =====
    @PostMapping
    public ResponseEntity<VeiculoResponseDTO> cadastrar(@Valid @RequestBody VeiculoCreateDTO dto) {
        
        // Converte DTO para Entidade
        Veiculo veiculo = new Veiculo();
        veiculo.setPlaca(dto.getPlaca().toUpperCase());
        veiculo.setMarca(dto.getMarca());
        veiculo.setModelo(dto.getModelo());
        veiculo.setAnoFabricacao(dto.getAnoFabricacao());
        veiculo.setAnoModelo(dto.getAnoModelo());
        veiculo.setCor(dto.getCor());
        veiculo.setRenavam(dto.getRenavam());
        veiculo.setChassi(dto.getChassi().toUpperCase());
        veiculo.setCategoria(dto.getCategoria());
        veiculo.setCombustivel(dto.getCombustivel());
        
        // 🔥 CORREÇÃO: usar setCapacidadePassageiros (que é o método que existe)
        veiculo.setCapacidadeAlunos(dto.getCapacidadeAlunos());

        
        veiculo.setDataLicenciamento(dto.getDataLicenciamento());
        veiculo.setDataUltimaVistoria(dto.getDataUltimaVistoria());
        veiculo.setDataProximaVistoria(dto.getDataProximaVistoria());
        veiculo.setSeguradora(dto.getSeguradora());
        veiculo.setNumeroApolice(dto.getNumeroApolice());
        veiculo.setDataValidadeSeguro(dto.getDataValidadeSeguro());
        veiculo.setKmAtual(dto.getKmAtual());
        veiculo.setDataUltimaManutencao(dto.getDataUltimaManutencao());
        veiculo.setKmProximaManutencao(dto.getKmProximaManutencao());
        veiculo.setObservacoes(dto.getObservacoes());
        veiculo.setDisponivel(dto.getDisponivel() != null ? dto.getDisponivel() : true);
        
        // Salva no banco
        Veiculo veiculoSalvo = service.cadastrar(veiculo);
        
        // Converte entidade salva para ResponseDTO
        VeiculoResponseDTO response = converterParaResponseDTO(veiculoSalvo);
        
        return new ResponseEntity<>(response, HttpStatus.CREATED);
    }

    // ===== 2. LISTAR TODOS OS VEÍCULOS (GET) =====
    @GetMapping
    public ResponseEntity<List<VeiculoListResponseDTO>> listarTodos() {
        
        List<Veiculo> veiculos = service.listarTodos();
        
        List<VeiculoListResponseDTO> response = veiculos.stream()
                .map(this::converterParaListResponseDTO)
                .collect(Collectors.toList());
        
        return ResponseEntity.ok(response);
    }

    // ===== 3. BUSCAR VEÍCULO POR ID (GET) =====
    @GetMapping("/{id}")
    public ResponseEntity<VeiculoResponseDTO> buscarPorId(@PathVariable Long id) {
        
        Veiculo veiculo = service.buscarPorId(id);
        VeiculoResponseDTO response = converterParaResponseDTO(veiculo);
        
        return ResponseEntity.ok(response);
    }

    // ===== 4. ATUALIZAR VEÍCULO (PUT) =====
    @PutMapping("/{id}")
    public ResponseEntity<VeiculoResponseDTO> atualizar(
            @PathVariable Long id, 
            @Valid @RequestBody VeiculoUpdateDTO dto) {
        
        // Busca o veículo existente
        Veiculo veiculoExistente = service.buscarPorId(id);
        
        // Atualiza os campos permitidos
        veiculoExistente.setPlaca(dto.getPlaca().toUpperCase());
        veiculoExistente.setMarca(dto.getMarca());
        veiculoExistente.setModelo(dto.getModelo());
        veiculoExistente.setCor(dto.getCor());
        
        // 🔥 CORREÇÃO: usar o método correto do DTO e da Entity
        veiculoExistente.setCapacidadeAlunos(dto.getCapacidadeAlunos());
        
        veiculoExistente.setDataLicenciamento(dto.getDataLicenciamento());
        veiculoExistente.setDataUltimaVistoria(dto.getDataUltimaVistoria());
        veiculoExistente.setDataProximaVistoria(dto.getDataProximaVistoria());
        veiculoExistente.setSeguradora(dto.getSeguradora());
        veiculoExistente.setNumeroApolice(dto.getNumeroApolice());
        veiculoExistente.setDataValidadeSeguro(dto.getDataValidadeSeguro());
        veiculoExistente.setKmAtual(dto.getKmAtual());
        veiculoExistente.setDataUltimaManutencao(dto.getDataUltimaManutencao());
        veiculoExistente.setKmProximaManutencao(dto.getKmProximaManutencao());
        veiculoExistente.setObservacoes(dto.getObservacoes());
        
        if (dto.getDisponivel() != null) {
            veiculoExistente.setDisponivel(dto.getDisponivel());
        }
        
        if (dto.getAtivo() != null) {
            veiculoExistente.setAtivo(dto.getAtivo());
        }
        
        veiculoExistente.setDataAtualizacao(LocalDateTime.now());
        
        // Salva a atualização
        Veiculo veiculoAtualizado = service.atualizar(veiculoExistente);
        VeiculoResponseDTO response = converterParaResponseDTO(veiculoAtualizado);
        
        return ResponseEntity.ok(response);
    }

    // ===== 5. DELETAR/DESATIVAR VEÍCULO (DELETE) =====
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletar(@PathVariable Long id) {
        service.deletar(id);
        return ResponseEntity.noContent().build();
    }

    // ===== 6. BUSCAR VEÍCULOS DISPONÍVEIS (GET) =====
    @GetMapping("/disponiveis")
    public ResponseEntity<List<VeiculoListResponseDTO>> listarDisponiveis() {
        
        List<Veiculo> veiculos = service.listarDisponiveis();
        
        List<VeiculoListResponseDTO> response = veiculos.stream()
                .map(this::converterParaListResponseDTO)
                .collect(Collectors.toList());
        
        return ResponseEntity.ok(response);
    }

    // ===== 7. BUSCAR POR PLACA (GET) =====
    @GetMapping("/placa/{placa}")
    public ResponseEntity<VeiculoResponseDTO> buscarPorPlaca(@PathVariable String placa) {
        
        Veiculo veiculo = service.buscarPorPlaca(placa.toUpperCase());
        VeiculoResponseDTO response = converterParaResponseDTO(veiculo);
        
        return ResponseEntity.ok(response);
    }

    // ===== 8. BUSCAR POR CATEGORIA (GET) =====
    @GetMapping("/categoria/{categoria}")
    public ResponseEntity<List<VeiculoListResponseDTO>> buscarPorCategoria(@PathVariable String categoria) {
        
        List<Veiculo> veiculos = service.buscarPorCategoria(categoria);
        
        List<VeiculoListResponseDTO> response = veiculos.stream()
                .map(this::converterParaListResponseDTO)
                .collect(Collectors.toList());
        
        return ResponseEntity.ok(response);
    }

    // ===== 9. ATUALIZAR KM DO VEÍCULO (PATCH) =====
    @PatchMapping("/{id}/km")
    public ResponseEntity<VeiculoResponseDTO> atualizarKm(
            @PathVariable Long id, 
            @RequestParam Integer kmAtual) {
        
        Veiculo veiculo = service.atualizarKm(id, kmAtual);
        VeiculoResponseDTO response = converterParaResponseDTO(veiculo);
        
        return ResponseEntity.ok(response);
    }

    // ===== 10. ALTERNAR STATUS DISPONÍVEL (PATCH) =====
    @PatchMapping("/{id}/toggle-disponivel")
    public ResponseEntity<VeiculoResponseDTO> toggleDisponivel(@PathVariable Long id) {
        
        Veiculo veiculo = service.alternarDisponibilidade(id);
        VeiculoResponseDTO response = converterParaResponseDTO(veiculo);
        
        return ResponseEntity.ok(response);
    }

    // ========== MÉTODOS AUXILIARES DE CONVERSÃO ==========
    
    private VeiculoResponseDTO converterParaResponseDTO(Veiculo veiculo) {
        return new VeiculoResponseDTO(
            veiculo.getId(),
            veiculo.getPlaca(),
            veiculo.getMarca(),
            veiculo.getModelo(),
            veiculo.getAnoFabricacao(),
            veiculo.getAnoModelo(),
            veiculo.getCor(),
            veiculo.getRenavam(),
            veiculo.getChassi(),
            veiculo.getCategoria(),
            veiculo.getCombustivel(),
            veiculo.getCapacidadeAlunos(),  // 🔥 CORREÇÃO: getCapacidadeAlunos() existe!
            veiculo.getDataLicenciamento(),
            veiculo.getDataUltimaVistoria(),
            veiculo.getDataProximaVistoria(),
            veiculo.getSeguradora(),
            veiculo.getNumeroApolice(),
            veiculo.getDataValidadeSeguro(),
            veiculo.getKmAtual(),
            veiculo.getDataUltimaManutencao(),
            veiculo.getKmProximaManutencao(),
            veiculo.getObservacoes(),
            veiculo.getDisponivel(),
            veiculo.getAtivo(),
            veiculo.getDataCadastro(),
            veiculo.getDataAtualizacao()
        );
    }

    private VeiculoListResponseDTO converterParaListResponseDTO(Veiculo veiculo) {
        return new VeiculoListResponseDTO(
            veiculo.getId(),
            veiculo.getPlaca(),
            veiculo.getMarca(),
            veiculo.getModelo(),
            veiculo.getAnoModelo(),
            veiculo.getCor(),
            veiculo.getCapacidadeAlunos(),  // 🔥 CORREÇÃO: getCapacidadeAlunos() existe!
            veiculo.getDisponivel(),
            veiculo.getAtivo()
        );
    }
}