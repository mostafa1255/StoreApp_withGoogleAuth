import 'package:bloc/bloc.dart';
import 'package:store_app/Feuture/data/services/AllGategory.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.allCategoryservice) : super(CategoryInitial());
  AllCategoryservice allCategoryservice;
  Future<void> AllCategory() async {
    emit(CategoryLoading());
    try {
      var result = allCategoryservice.getAllCategoryservice();
      print("Sucsess");
      emit(CategorySucsess(Products: await result));
    } on Exception catch (e) {
      print("Faliure");
      emit(CategoryFaliure(e.toString()));
    }
  }
}
