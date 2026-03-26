package com.transcolar.sistema.controller;

import com.transcolar.sistema.dto.*;
import com.transcolar.sistema.service.MotoristaService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * CONTROLLER - Motorista
 * Endpoints: /api/motoristas (ajuste o prefixo conforme sua necessidade)
 */
@RestController
@RequestMapping("/motoristas")
public class MotoristaController {

    private final MotoristaService service;

    public MotoristaController(MotoristaService service) {
        this.service = service;
    }

    // ================================ ENDPOINTS PRINCIPAIS ================================

    /**
     * POST /motoristas
     * Cadastrar um novo motorista
     */
    @PostMapping
    public ResponseEntity<MotoristaResponseDTO> cadastrar(@Valid @RequestBody MotoristaCreateDTO createDTO) {
        MotoristaResponseDTO response = service.cadastrar(createDTO);
        return new ResponseEntity<>(response, HttpStatus.CREATED);
    }

    /**
     * GET /motoristas
     * Listar todos os motoristas (resumido)
     */
    @GetMapping
    public ResponseEntity<List<MotoristaListResponseDTO>> listarTodos() {
        List<MotoristaListResponseDTO> motoristas = service.listarTodos();
        return ResponseEntity.ok(motoristas);
    }

    /**
     * GET /motoristas/{id}
     * Buscar motorista por ID (detalhado)
     */
    @GetMapping("/{id}")
    public ResponseEntity<MotoristaResponseDTO> buscarPorId(@PathVariable Long id) {
        MotoristaResponseDTO motorista = service.buscarPorId(id);
        return ResponseEntity.ok(motorista);
    }

    /**
     * PUT /motoristas/{id}
     * Atualizar motorista
     */
    @PutMapping("/{id}")
    public ResponseEntity<MotoristaResponseDTO> atualizar(
            @PathVariable Long id, 
            @Valid @RequestBody MotoristaUpdateDTO updateDTO) {
        MotoristaResponseDTO response = service.atualizar(id, updateDTO);
        return ResponseEntity.ok(response);
    }

    /**
     * DELETE /motoristas/{id}
     * Deletar motorista (físico)
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletar(@PathVariable Long id) {
        service.deletar(id);
        return ResponseEntity.noContent().build();
    }

    // ================================ ENDPOINTS DE STATUS ================================

    /**
     * PATCH /motoristas/{id}/inativar
     * Inativar motorista (lógico)
     */
    @PatchMapping("/{id}/inativar")
    public ResponseEntity<Void> inativar(@PathVariable Long id) {
        service.inativar(id);
        return ResponseEntity.noContent().build();
    }

    /**
     * PATCH /motoristas/{id}/ativar
     * Ativar motorista
     */
    @PatchMapping("/{id}/ativar")
    public ResponseEntity<Void> ativar(@PathVariable Long id) {
        service.ativar(id);
        return ResponseEntity.noContent().build();
    }

    // ================================ ENDPOINTS DE LISTAGEM ESPECÍFICA ================================

    /**
     * GET /motoristas/ativos
     * Listar apenas motoristas ativos
     */
    @GetMapping("/ativos")
    public ResponseEntity<List<MotoristaListResponseDTO>> listarAtivos() {
        List<MotoristaListResponseDTO> motoristas = service.listarAtivos();
        return ResponseEntity.ok(motoristas);
    }

    /**
     * GET /motoristas/busca?nome=
     * Buscar motoristas por nome
     */
    @GetMapping("/busca")
    public ResponseEntity<List<MotoristaListResponseDTO>> buscarPorNome(@RequestParam String nome) {
        List<MotoristaListResponseDTO> motoristas = service.buscarPorNome(nome);
        return ResponseEntity.ok(motoristas);
    }

    /**
     * GET /motoristas/status/{status}
     * Buscar motoristas por status (ATIVO, FERIAS, etc)
     */
    @GetMapping("/status/{status}")
    public ResponseEntity<List<MotoristaListResponseDTO>> buscarPorStatus(@PathVariable String status) {
        List<MotoristaListResponseDTO> motoristas = service.buscarPorStatus(status);
        return ResponseEntity.ok(motoristas);
    }

    /**
     * GET /motoristas/cnh-a-vencer
     * Buscar motoristas com CNH a vencer nos próximos 30 dias
     */
    @GetMapping("/cnh-a-vencer")
    public ResponseEntity<List<MotoristaListResponseDTO>> buscarCnhAVencer() {
        List<MotoristaListResponseDTO> motoristas = service.buscarCnhAVencer();
        return ResponseEntity.ok(motoristas);
    }
}