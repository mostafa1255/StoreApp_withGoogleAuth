part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductSucsess extends ProductState {}

class ProductFaliure extends ProductState {
  final String errmessage;

  ProductFaliure({required this.errmessage});
}
class ProductLoading extends ProductState {}
