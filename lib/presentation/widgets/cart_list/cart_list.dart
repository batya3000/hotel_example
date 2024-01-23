import 'package:flutter/material.dart';
import 'package:hotel/core/design/dimensions.dart';
import 'package:hotel/domain/model/cart_room.dart';
import 'package:hotel/presentation/widgets/cart_list/cart_item.dart';
import 'package:tuple/tuple.dart';

class CartList extends StatelessWidget {
  final List<Tuple2<String, CartRoom>> cartItems;
  final void Function(CartRoom cartRoom) onDeleteClicked;

  const CartList({super.key, required this.cartItems, required this.onDeleteClicked});

  @override
  Widget build(BuildContext context) {
    final safeBottomPadding = MediaQuery.of(context).padding.bottom + height80;

    return ListView.separated(
        itemCount: cartItems.length,
        padding: EdgeInsets.only(
           left: padding16,
            right: padding16,
            top: padding16,
            bottom: safeBottomPadding
        ),
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: height16);
        },
        itemBuilder: (BuildContext context, int index) {
          return CartItem(
              touristName: cartItems[index].item1,
              room: cartItems[index].item2,
              onDeleteClicked: () => onDeleteClicked(cartItems[index].item2),
          );
        }
    );

  }
}
