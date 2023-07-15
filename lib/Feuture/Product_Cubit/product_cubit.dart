import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_app/Feuture/data/models/Product_Model.dart';
import 'package:store_app/Feuture/data/services/AllProduct.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  int count = 0;
  double price = 0;
  ProductCubit(this.allProduct) : super(ProductInitial());
  allProductservice allProduct;
  Future<void> AllProducts() async {
    emit(ProductLoading());
    try {
      var result = allProduct.getProducts();
      print("Sucsess");
      emit(ProductSucsess(Products: await result));
    } on Exception catch (e) {
      print("Faliure");
      emit(ProductFaliure(errmessage: e.toString()));
    }
  }

  void CountItemCart() {
    count = count + 1;
  }

  int GetCountItemCart() {
    return count;
  }

  void setPrice({required double Price}) {
    price = Price + price;
  }

  double getPrice() {
    return price;
  }
}
