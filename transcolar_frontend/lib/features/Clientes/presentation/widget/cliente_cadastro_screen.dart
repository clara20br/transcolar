// features/Clientes/presentation/widgets/cliente_card_widget.dart
import 'package:flutter/material.dart';
import 'package:transcolar_frontend/core/theme/colors.dart';
import 'package:transcolar_frontend/features/Clientes/data/models/cliente_model.dart';

class ClienteCardWidget extends StatelessWidget {
  final ClienteModel cliente;
  final VoidCallback onTap;

  const ClienteCardWidget({
    super.key,
    required this.cliente,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: AppColors.fundoCard,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.amareloMel.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Icon(
                      Icons.person,
                      color: AppColors.amareloMel,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cliente.nome,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textoBranco,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          cliente.email,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textoCinza,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: cliente.ativo
                          ? AppColors.sucesso.withValues(alpha: 0.1)
                          : AppColors.erro.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      cliente.ativo ? 'Ativo' : 'Inativo',
                      style: TextStyle(
                        fontSize: 12,
                        color: cliente.ativo ? AppColors.sucesso : AppColors.erro,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Divider(
                color: AppColors.cinzaMedio.withValues(alpha: 0.3),
                height: 1,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildInfoIcon(
                    Icons.phone,
                    cliente.telefone,
                  ),
                  const SizedBox(width: 16),
                  _buildInfoIcon(
                    Icons.location_on,
                    '${cliente.cidade ?? ''}${cliente.uf != null ? '/${cliente.uf}' : ''}',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoIcon(IconData icon, String text) {
    return Expanded(
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: AppColors.textoCinza,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textoCinza,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}