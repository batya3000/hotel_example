

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel/core/result/result.dart';
import 'package:hotel/domain/model/cart_room.dart';
import 'package:hotel/domain/model/tourist.dart';
import 'package:hotel/domain/usecase/clear_cart.dart';
import 'package:hotel/domain/usecase/get_tourists.dart';
import 'package:hotel/domain/usecase/remove_room_from_cart.dart';
import 'package:tuple/tuple.dart';

part 'cart_page_event.dart';
part 'cart_page_state.dart';

class CartPageBloc extends Bloc<CartPageEvent, CartPageState> {
  final GetTouristsUseCase _getTouristsUseCase;
  final RemoveRoomFromCartUseCase _removeRoomFromCartUseCase;
  final ClearCartUseCase _clearCartUseCase;

  CartPageBloc(this._getTouristsUseCase, this._removeRoomFromCartUseCase, this._clearCartUseCase) : super(const CartPageLoading()) {

    on<GetCartItemsEvent>(_onGetCartItems);
    on<RemoveCartItemEvent>(_onRemoveCartItem);
    on<PayButtonClickedEvent>(_onPayButtonClicked);
  }

  void _onRemoveCartItem(RemoveCartItemEvent event, Emitter<CartPageState> emit) async {
    if (state is CartPageContent) {
      await _removeRoomFromCartUseCase(event.cartRoom);
    }
  }

  void _onPayButtonClicked(PayButtonClickedEvent event, Emitter<CartPageState> emit) async {
    if (state is CartPageContent) {
      await _clearCartUseCase(
          (state as CartPageContent).cartItems.map((it) => it.item2).toList()
      );
    }
  }

  void _onGetCartItems(GetCartItemsEvent event, Emitter<CartPageState> emit) async {

    await emit.forEach(_getTouristsUseCase(), onData: (value) {
        switch(value) {
          case Success(): {
            final List<Tourist> tourists = value.data;

            List<Tuple2<String, CartRoom>> tuples = [];

            for (Tourist tourist in tourists) {
              final String name = "${tourist.firstName} ${tourist.lastName}";

              for (var room in tourist.rooms) {
                tuples.add(Tuple2(name, room));
              }
            }

            return CartPageContent(tuples);
          }
          case Failure(): {
            return CartPageError(value.errorMessage);

          }
        }
    });

  }

}
