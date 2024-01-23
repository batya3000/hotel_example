part of 'cart_page_bloc.dart';

abstract class CartPageState extends Equatable {
  const CartPageState();
}

class CartPageLoading extends CartPageState {
  const CartPageLoading();


  @override
  List<Object> get props => [];
}


class CartPageContent extends CartPageState {
  final List<Tuple2<String, CartRoom>> cartItems;

  const CartPageContent(this.cartItems);

  @override
  List<Object> get props => [cartItems];
}

class CartPageError extends CartPageState {
  final String errorMessage;

  const CartPageError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}