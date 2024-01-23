


import 'package:flutter/material.dart';
import 'package:hotel/core/design/colors.dart';
import 'package:hotel/core/design/dimensions.dart';
import 'package:hotel/core/design/icons.dart';
import 'package:hotel/core/design/styles.dart';
import 'package:hotel/domain/model/room.dart';
import 'package:hotel/presentation/widgets/cached_image.dart';

class RoomItem extends StatelessWidget {
  final Room room;
  final void Function() onItemClicked;

  const RoomItem({super.key, required this.room, required this.onItemClicked });


  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
          onTap: onItemClicked,
          child: _buildContent()
      ),
    );
  }
  Widget _buildContent() {
    return Column(
      children: [
        _buildImage(),
        _buildInfo()
      ],
    );
  }

  Widget _buildImage() {
    return CachedImage(
        imageUrl: room.imageUrl,
        width: double.infinity,
        height: height132
    );
  }

  Widget _buildInfo() {
    return Padding(
      padding: const EdgeInsets.all(padding16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            room.title,
            style: subtitleTextStyle,
            maxLines: 2,
          ),
          const SizedBox(height: height12),
          Row(
            children: [
              _buildMoneyTag(),
              const SizedBox(width: width12),
              _buildSeparator(),
              const SizedBox(width: width12),
              _buildCapacityTag(),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSeparator() {
    return Container(
      width: 1,
      height: 8,
      color: grayColor,
    );
  }

  Widget _buildMoneyTag() {
    return Row(
      children: [
        iconMoney16,
        const SizedBox(width: width8),
        Text("От ${room.pricePerDay} ₽ / ночь", style: bodyTextStyle,)
      ],
    );
  }
  Widget _buildCapacityTag() {
    String capacity;
    switch(room.capacity) {
      case 1:
        capacity = "Одноместный";
      default:
        capacity = "${room.capacity}-х местный";

    }
    return Row(
      children: [
        iconPerson16,
        const SizedBox(width: width8),
        Text(capacity, style: bodyTextStyle)
      ],
    );
  }
}