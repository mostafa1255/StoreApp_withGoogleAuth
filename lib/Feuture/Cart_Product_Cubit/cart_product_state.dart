part of 'cart_product_cubit.dart';

@immutable
abstract class CartProductState {}

class CartProductInitial extends CartProductState {}

class CartProductLoading extends CartProductState {}

class CartProductSendSucsess extends CartProductState {}

class CartProductSendFaliure extends CartProductState {
  final String errmessage;

  CartProductSendFaliure({required this.errmessage});
}

//
class CartProductGetSucsess extends CartProductState {}

class CartProductGetFaliure extends CartProductState {
  final String errmessage;

  CartProductGetFaliure({required this.errmessage});
}
