import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gatubelos_app/src/models/gato_model.dart';
import 'package:http/http.dart' as http;

class GatosService extends ChangeNotifier {
  String _baseUrl = 'api.thecatapi.com';
  String _X_API_KEY = 'bda53789-d59e-46cd-9bc4-2936630fde39';

  Future<List<GatoModel>> cargarGatos(BuildContext context) async {
    List<GatoModel> listaGatos = [];
    String _seccion = "breeds";

    final url = Uri.https(_baseUrl, '/v1/$_seccion');

    final respGato = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'x-api-key': _X_API_KEY,
    });

    final decodeData = json.decode(respGato.body);

    if (decodeData is List) {
      for (var item in decodeData) {
        final gatoItem = GatoModel.fromJson(item);
        listaGatos.add(gatoItem);
      }
      return listaGatos;
    }

    return listaGatos;
  }
}
