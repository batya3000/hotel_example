import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/core/constants/constants.dart';
import 'package:hotel/core/design/dimensions.dart';
import 'package:hotel/core/design/styles.dart';
import 'package:hotel/core/util/Utils.dart';
import 'package:hotel/domain/model/cart_room.dart';
import 'package:hotel/injector.dart';
import 'package:hotel/presentation/pages/cart/bloc/cart_page_bloc.dart';
import 'package:hotel/presentation/widgets/cart_list/cart_list.dart';
import 'package:hotel/presentation/widgets/error_ui.dart';
import 'package:hotel/presentation/widgets/loading_ui.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildPage(),
    );
  }

  Widget _buildPage() {

    return BlocProvider<CartPageBloc>(
      create: (context) => getIt<CartPageBloc>()
        ..add(const GetCartItemsEvent()),
      child: BlocBuilder<CartPageBloc, CartPageState>(
          builder: (context, state) {
            if(state is CartPageLoading) {
              return const LoadingUI();
            }
            if(state is CartPageError) {
              return ErrorUI(
                  errorMessage: state.errorMessage,
                  onTap: () => _onRefresh(context)
              );
            }
            if(state is CartPageContent) {
              if (state.cartItems.isNotEmpty) {

                return _buildSuccessUI(context, state);

              } else {
                return const Center(child: Text("Пока что корзина пуста!", style: bodyTextStyle));
              }
            }
            return const SizedBox();
          }
      ),
    );
    // return B
  }
  Widget _buildSuccessUI(BuildContext context, CartPageContent state) {
    return Stack(
      children: [
        _buildList(context, state),
        _buildSaveButton(context, state)
      ],
    );
  }


  Widget _buildList(BuildContext context, CartPageContent state) {
    return CartList(
      cartItems: state.cartItems,
      onDeleteClicked: (item) => _onCartItemDeleted(context, item),
    );
  }

  Widget _buildSaveButton(BuildContext context, CartPageContent state) {
    int totalMoney = 0;

    for(CartRoom cartRoom in state.cartItems.map((it) => it.item2)) {
      totalMoney += getTotalMoney(cartRoom.fromDay, cartRoom.toDay, cartRoom.pricePerDay);
    }

    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: const EdgeInsets.all(padding16),
            child: SizedBox(
                height: height50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => _onPayClicked(context),
                    child: Text("Оплатить $totalMoney ₽", style: buttonTextStyle)
                ),
            ),
          )

    );
  }

  void _onRefresh(BuildContext context) {
    context.read<CartPageBloc>()
        .add(const GetCartItemsEvent());
  }

  void _onCartItemDeleted(BuildContext context, CartRoom item) {
    context.read<CartPageBloc>()
        .add(RemoveCartItemEvent(item));
  }

  void _onPayClicked(BuildContext context) {
    context.read<CartPageBloc>()
        .add(const PayButtonClickedEvent());
    Navigator.pushNamed(context, bookedPageRoute);
  }


}
