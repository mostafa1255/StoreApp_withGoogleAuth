import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  Future<http.Response?> get({required String url}) async {
    emit(ProductLoading());
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        emit(ProductSucsess());
        return response;
      } else {
        emit(
            ProductFaliure(errmessage: "status code is${response.statusCode}"));
        print("status code is ${response.statusCode}");
        return null;
      }
    } on Exception catch (e) {
      emit(ProductFaliure(errmessage: e.toString()));
      return null;
    }
  }
}
