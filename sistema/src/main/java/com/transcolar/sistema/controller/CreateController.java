package com.transcolar.sistema.controller;

import org.springframework.web.bind.annotation.*;
import java.util.List;
import com.transcolar.sistema.entity.Cliente;
import com.transcolar.sistema.service.ClienteService;

@RestController
@RequestMapping("/clientes")
public class CreateController {
	 private final ClienteService service;
	
	public CreateController(ClienteService service) {
		this.service = service;
	}

	@PostMapping
	public Cliente cadastrar(@RequestBody Cliente cliente) {
		return service.cadastrar(cliente);
	}
	
	@GetMapping
	public List<Cliente> listar(){
		return service.listarTodos();
	}
}
