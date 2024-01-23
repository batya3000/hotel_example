import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotel/core/design/colors.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  const CachedImage({super.key, required this.imageUrl, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (_, __) {
        return const Center(
            child: SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(color: blackColor)
            )
        );
      },
      errorWidget: (_, __, ___) {
        return const Center(
            child: SizedBox(
                width: 32,
                height: 32,
                child: Icon(Icons.error, color: blackColor)
            )
        );
      },
    );
  }
}
