import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/Helpers/Api.dart';
import '../../Product_Cubit/product_cubit.dart';

class AllCategoryservice {
  ProductCubit? productCubit;
  Future<List<dynamic>> getAllCategoryservice() async {
    http.Response response =
        await Api().get(url: "https://fakestoreapi.com/products/categories");

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      return [];
    }
  }
}
