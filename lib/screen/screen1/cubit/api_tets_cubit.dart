import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../model/product_list_model.dart';
import 'package:http/http.dart' as http;

import '../model/api_test_model.dart';

part 'api_tets_state.dart';

class ApiTetsCubit extends Cubit<ApiTetsState> {
  ApiTetsCubit(this.context) : super(ApiTetsInitial()) {
    getApiData();
    //getProductData();
    // isLoadingData();
    featchProduct();
  }
  BuildContext context;
  late List<ProductListModel>? productListModel = [];
  bool isLoading = false;

  Future<ApiTest> getApiData() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products/1'));
    if (response.statusCode == 200) {
      return ApiTest.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('some error is ocuured');
    }
  }

  Future<List<ProductListModel>> featchProduct() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    final response = await http.get(Uri.parse(url));
    var responseData = json.decode(response.body);

    //create a list for store json data
    List<ProductListModel> productList = [];

    for (var singleItem in responseData) {
      ProductListModel productListModel = ProductListModel(
        id: singleItem["id"],
        title: singleItem["title"],
        userId: singleItem["userId"],
        body: singleItem["body"],
      );
      productList.add(productListModel);
    }

    return productList;
  }

  Future<List<ProductListModel>> featchProductLists() async {
    String url = '';
    final response = await http.get(Uri.parse(''));
    var responseData = json.decode(response.body);

    List<ProductListModel> productModel = [];

    for (var singleProduct in responseData) {
      ProductListModel productList = ProductListModel(
          userId: singleProduct['userId'],
          id: singleProduct['id'],
          title: singleProduct['title'],
          body: singleProduct['body']);

      productModel.add(productList);
    }
    return productModel;
  }
}
