import 'package:flutter/material.dart';
import 'package:hotel/core/design/dimensions.dart';
import 'package:hotel/core/design/icons.dart';
import 'package:hotel/core/design/styles.dart';
import 'package:hotel/core/util/utils.dart';
import 'package:hotel/domain/model/cart_room.dart';
import 'package:hotel/presentation/widgets/cached_image.dart';

class CartItem extends StatelessWidget {
  final String touristName;
  final CartRoom room;
  final void Function() onDeleteClicked;

  const CartItem({super.key, required this.room, required this.onDeleteClicked, required this.touristName});


  @override
  Widget build(BuildContext context) {
    print('building cart item $touristName: ${room.touristId}');

    return Card(
        child: Column(
          children: [
            _buildImage(),
            _buildInfo(),
          ],
        )
    );
  }
  Widget _buildInfo() {
    return Padding(
        padding: const EdgeInsets.all(padding16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitleSection(),
              const SizedBox(height: height12),
              _buildPersonSection(),
              const SizedBox(height: height12),
              _buildDateRangeSection(),
              const SizedBox(height: height16),
              _buildCostSection()
            ]
        )
    );
  }

  Widget _buildImage() {
    return CachedImage(
        imageUrl: room.imageUrl,
        width: double.infinity,
        height: height50
    );
  }

  Widget _buildTitleSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(room.title, style: subtitleTextStyle),
        _buildDeleteButton()
      ],
    );
  }

  Widget _buildPersonSection() {
    return Row(
      children: [
        iconPerson16,
        const SizedBox(width: width8),
        Text(touristName, style: bodyTextStyle)
      ],
    );
  }

  Widget _buildDateRangeSection() {
    return Row(
      children: [
        iconCalendar16,
        const SizedBox(width: width8),
        Text(getFormattedRange(room.fromDay, room.toDay), style: bodyTextStyle)
      ],
    );
  }

  Widget _buildCostSection() {
    final int totalMoney = getTotalMoney(room.fromDay, room.toDay, room.pricePerDay);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Итого", style: bodyTextStyle.copyWith(fontWeight: FontWeight.w600)),
        Text("$totalMoney ₽", style: bodyTextStyle.copyWith(fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _buildDeleteButton() {
    return InkWell(
      onTap: () => onDeleteClicked(),
      child: iconDelete16,
    );
  }
}