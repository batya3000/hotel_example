


import 'package:flutter/material.dart';
import 'package:hotel/core/design/dimensions.dart';
import 'package:hotel/domain/model/tourist.dart';
import 'package:hotel/presentation/widgets/tourist_list/tourist_item.dart';

class TouristList extends StatelessWidget {
  final List<Tourist> tourists;
  final void Function(Tourist tourist) onTouristClicked;

  const TouristList({super.key, required this.tourists, required this.onTouristClicked});

  @override
  Widget build(BuildContext context) {
    final safeBottomPadding = MediaQuery.of(context).padding.bottom + height80;

    return ListView.separated(
        itemCount: tourists.length,
        padding: EdgeInsets.only(
            top: padding16,
            left: padding16,
            right: padding16,
            bottom: safeBottomPadding
        ),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: height16);
        },
        itemBuilder: (BuildContext context, int index) {
          return TouristItem(
              tourist: tourists[index],
              onItemClicked: () => onTouristClicked(tourists[index])
          );
        }
    );
  }

}
