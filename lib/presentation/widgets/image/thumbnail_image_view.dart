import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThumbnailImageView extends ConsumerWidget {
  const ThumbnailImageView({
    required this.imageUrl,
    this.customLocalImage,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.isContentThumbnail = true,
    Key? key,
  }) : super(key: key);
  final String? imageUrl;
  final Widget? customLocalImage;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final bool isContentThumbnail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Builder(
      builder: (context) {
        if (imageUrl != null && imageUrl!.isNotEmpty) {
          return _ThumbnailImage(
            fit: fit,
            width: width,
            height: height,
            imageUrl: imageUrl!,
          );
        }

        return customLocalImage ??
            SvgIcon.from(
              AppImages.noImageThumbnail,
              fit: BoxFit.cover,
            );
      },
    );
  }
}

class _ThumbnailImage extends StatelessWidget {
  const _ThumbnailImage({
    required this.imageUrl,
    this.fit,
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  final String imageUrl;
  final BoxFit? fit;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Container();
      },
      fit: fit,
      width: width,
      height: height,
    );
  }
}
