import 'package:flutter/material.dart';
import 'package:hotel/core/design/dimensions.dart';
import 'package:hotel/core/design/icons.dart';
import 'package:hotel/core/design/styles.dart';
import 'package:hotel/domain/model/tourist.dart';

class TouristItem extends StatelessWidget {
  final Tourist tourist;
  final void Function() onItemClicked;

  const TouristItem({super.key, required this.tourist, required this.onItemClicked});


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
    print("_buildContent: tourist ${tourist.id}");
    return Padding(
      padding: const EdgeInsets.all(padding16),
      child: Column(
        children: [
          _buildTitleSection(),
          const SizedBox(height: height12),
          _buildPhoneSection(),
          const SizedBox(height: height12),
          _buildEmailSection()
        ],
      ),
    );
  }

  Widget _buildTitleSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("${tourist.firstName} ${tourist.lastName}", style: subtitleTextStyle),
        iconEdit16
      ],
    );
  }

  Widget _buildPhoneSection() {
    return Row(
      children: [
        iconPhone16,
        const SizedBox(width: width8),
        Text(tourist.phone, style: bodyTextStyle)
      ],
    );
  }

  Widget _buildEmailSection() {
    return Row(
      children: [
        iconEmail16,
        const SizedBox(width: width8),
        Text(tourist.email, style: bodyTextStyle)
      ],
    );
  }
}