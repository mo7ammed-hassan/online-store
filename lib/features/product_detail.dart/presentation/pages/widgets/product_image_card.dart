import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_store/common/helper/images/image_display.dart';

class ProductImageCard extends StatelessWidget {
  final String imageURL;
  const ProductImageCard({
    super.key,
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 161 / 248,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: CachedNetworkImageProvider(
              ImageDisplayHelper.generateProductImageURL(imageURL),
            ),
          ),
        ),
      ),
    );
  }
}
