package com.transcolar.sistema.controller;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.transcolar.sistema.entity.Cliente;
import com.transcolar.sistema.service.ClienteService;

/* =========================================================
   CONTROLLER - CAMADA DE EXPOSIÇÃO (API)
   ========================================================= */

@RestController
@RequestMapping("/clientes")
public class ClienteController {

    private final ClienteService service;

    public ClienteController(ClienteService service) {
        this.service = service;
    }

    /* =========================================================
       ENDPOINT: CADASTRAR CLIENTE
       ========================================================= */

    @PostMapping
    public Cliente cadastrar(@RequestBody Cliente cliente) {
        return service.cadastrar(cliente);
    }

    /* =========================================================
       ENDPOINT: LISTAR CLIENTES
       ========================================================= */

    @GetMapping
    public List<Cliente> listar() {
        return service.listarTodos();
    }
    /* =========================================================
    ENDPOINT: BUSCAR CLIENTE POR ID
    ========================================================= */

 @GetMapping("/{id}")
 public Cliente buscarPorId(@PathVariable Long id) {
     return service.buscarPorId(id);
 }
 /* =========================================================
 ENDPOINT: ATUALIZAR CLIENTE
 ========================================================= */

@PutMapping("/{id}")
public Cliente atualizar(@PathVariable Long id, @RequestBody Cliente cliente) {
  return service.atualizar(id, cliente);
}

/* =========================================================
ENDPOINT: DELETAR CLIENTE
========================================================= */

@DeleteMapping("/{id}")
public void deletar(@PathVariable Long id) {
 service.deletar(id);
}


}