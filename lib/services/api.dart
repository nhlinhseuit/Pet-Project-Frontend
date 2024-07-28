import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pet_project_frontend/model/product_model.dart';

class Api {
  static const baseUrl = 'http://10.0.183.141:2000/api/';

// add method
  static addProduct(Map pdata) async {
    var url = Uri.parse('${baseUrl}add_product');
    print('url $url');
    try {
      print('http.post');
      final res = await http.post(url, body: pdata);
      print('finish http.post');
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        debugPrint('data $data');
      } else {
        debugPrint('Failed to get response ${res.statusCode}');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // get method
  static Future<List<Product>> getProduct() async {
    List<Product> products = [];
    var url = Uri.parse('${baseUrl}get_product');
    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        print('data $data');
        data['products'].forEach((value) => products.add(Product(
              name: value['pname'],
              desc: value['pdesc'],
              price: value['pprice'],
              id: value['id'].toString(),
            )));
        return products;
      } else {
        debugPrint('Failed to get response ${res.statusCode}');
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  // update method
  static updateProduct(id, body) async {
    var url = Uri.parse('${baseUrl}update/$id');
    print('updateProduct $url');
    try {
      final res = await http.post(url, body: body);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        debugPrint('data $data');
      } else {
        debugPrint('Failed to get response ${res.statusCode}');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // delete method
  static deleteProduct(id) async {
    var url = Uri.parse('${baseUrl}delete/$id');
    print('deleteProduct $url');
    try {
      final res = await http.post(url);
      if (res.statusCode == 204) {
        var data = jsonDecode(res.body.toString());
        debugPrint('data $data');
      } else {
        debugPrint('Failed to get response ${res.statusCode}');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
