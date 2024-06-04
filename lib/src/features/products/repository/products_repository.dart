import 'dart:convert';

import 'package:flutter/services.dart';

class ProductsRepository {
  Future<dynamic> getLocalProducts() async {
    final String response =
        await rootBundle.loadString('assets/data/response.json');

    final decodedJson = await json.decode(response);
    return decodedJson;
  }
}
