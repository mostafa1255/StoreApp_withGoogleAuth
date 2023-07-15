import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_product_state.dart';

class CartProductCubit extends Cubit<CartProductState> {
  CartProductCubit() : super(CartProductInitial());
  
}
