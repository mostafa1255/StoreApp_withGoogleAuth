part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySucsess extends CategoryState {
  final List<dynamic> Products;

  CategorySucsess({required this.Products});
}

class CategoryFaliure extends CategoryState {
  final String errmessage;

  CategoryFaliure(this.errmessage);
}
