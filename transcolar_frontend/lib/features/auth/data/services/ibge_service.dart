// lib/features/auth/data/services/ibge_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class IbgeService {
  Future<List<Map<String, dynamic>>> getEstados() async {
    try {
      final response = await http.get(
        Uri.parse('https://servicodados.ibge.gov.br/api/v1/localidades/estados'),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((e) => {
          'sigla': e['sigla'],
          'nome': e['nome'],
        }).toList();
      }
      return [];
    } catch (e) {
      print('Erro ao buscar estados: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getMunicipios(String uf) async {
    try {
      final response = await http.get(
        Uri.parse('https://servicodados.ibge.gov.br/api/v1/localidades/estados/$uf/municipios'),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((e) => {
          'id': e['id'],
          'nome': e['nome'],
        }).toList();
      }
      return [];
    } catch (e) {
      print('Erro ao buscar municípios: $e');
      return [];
    }
  }

  Future<Map<String, dynamic>?> buscarCep(String cep) async {
    try {
      final response = await http.get(
        Uri.parse('https://viacep.com.br/ws/$cep/json/'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data.containsKey('erro')) {
          return null;
        }
        return {
          'cep': data['cep'],
          'logradouro': data['logradouro'],
          'bairro': data['bairro'],
          'cidade': data['localidade'],
          'uf': data['uf'],
        };
      }
      return null;
    } catch (e) {
      print('Erro ao buscar CEP: $e');
      return null;
    }
  }
}