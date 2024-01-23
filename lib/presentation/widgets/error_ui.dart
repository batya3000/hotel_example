


import 'package:flutter/material.dart';
import 'package:hotel/core/design/dimensions.dart';
import 'package:hotel/core/design/styles.dart';

class ErrorUI extends StatelessWidget {
  final String errorMessage;

  final void Function() onTap;

  const ErrorUI({super.key, required this.errorMessage, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 16, left: 16, right: 16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(errorMessage, style: bodyTextStyle, textAlign: TextAlign.center),
          const SizedBox(height: height12),
          _buildClickableIcon(
            onTap: onTap
          )
        ],
      ),
    );
  }

  Widget _buildClickableIcon({required void Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: const Icon(
        Icons.refresh_rounded,
        size: size24,
      ),
    );
  }
}