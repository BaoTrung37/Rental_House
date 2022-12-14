import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/widgets/image/image_border.dart';
import 'package:batru_house_rental/presentation/widgets/image/thumbnail_image_view.dart';
import 'package:flutter/material.dart';

class ImageWithBorder extends StatelessWidget {
  const ImageWithBorder({
    this.url,
    this.tags = const [],
    this.aspectRatio = 16 / 9,
    this.borderRadius,
    this.tagPadding = const EdgeInsets.fromLTRB(8, 8, 8, 8),
    Key? key,
  }) : super(key: key);

  final String? url;
  final List<Widget> tags;
  final double aspectRatio;
  final BorderRadius? borderRadius;
  final EdgeInsets tagPadding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildImage(
          context,
          url: url,
        ),
        Positioned(
          right: 0,
          top: 0,
          child: _buildTags(
            padding: tagPadding,
            children: tags,
          ),
        ),
      ],
    );
  }

  Widget _buildImage(
    BuildContext context, {
    String? url,
  }) {
    return _buildBaseImage(
      context,
      borderRadius: borderRadius,
      aspectRatio: aspectRatio,
      child: ThumbnailImageView(
        imageUrl: url,
      ),
    );
  }

  Widget _buildBaseImage(
    BuildContext context, {
    required Widget child,
    required double aspectRatio,
    BorderRadius? borderRadius,
  }) {
    return Container(
      color: context.colors.action,
      child: ImageBorder(
        borderRadius: borderRadius,
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: child,
        ),
      ),
    );
  }

  Widget _buildTags({
    required List<Widget> children,
    double spacing = 6,
    EdgeInsets padding = const EdgeInsets.fromLTRB(8, 8, 8, 8),
  }) {
    return Padding(
      padding: padding,
      child: Wrap(
        spacing: spacing,
        runSpacing: 4,
        children: children,
      ),
    );
  }
}
