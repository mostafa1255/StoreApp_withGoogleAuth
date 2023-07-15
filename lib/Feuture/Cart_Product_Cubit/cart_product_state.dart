part of 'cart_product_cubit.dart';

@immutable
abstract class CartProductState {}

class CartProductInitial extends CartProductState {}
class CartProductLoading extends CartProductState {}
class CartProductSendSucsess extends CartProductState {}
class CartProductSendFaliure extends CartProductState {}
//
class CartProductGetSucsess extends CartProductState {}
class CartProductGetFaliure extends CartProductState {}