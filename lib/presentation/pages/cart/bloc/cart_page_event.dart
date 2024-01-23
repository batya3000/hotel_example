part of 'cart_page_bloc.dart';

abstract class CartPageEvent extends Equatable {
  const CartPageEvent();
}


class GetCartItemsEvent extends CartPageEvent {
  const GetCartItemsEvent();

  @override
  List<Object?> get props => [];
}

class RemoveCartItemEvent extends CartPageEvent {
  final CartRoom cartRoom;
  const RemoveCartItemEvent(this.cartRoom);

  @override
  List<Object?> get props => [cartRoom];
}

class PayButtonClickedEvent extends CartPageEvent {
  const PayButtonClickedEvent();

  @override
  List<Object?> get props => [];
}