import 'dart:io';

import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/utilities/utilites.dart';
import 'package:flutter/material.dart';

class InputImageView extends StatelessWidget {
  const InputImageView({
    required this.screenshotList,
    required this.onDeleteTap,
    Key? key,
  }) : super(key: key);

  final List<File> screenshotList;
  final ValueChanged<int> onDeleteTap;

  @override
  Widget build(BuildContext context) {
    if (screenshotList.isEmpty) {
      return Container();
    } else if (screenshotList.length <= 5) {
      return _buildScreenshotHorizontalView(context);
    } else {
      return _buildScreenshotVerticalView(context);
    }
  }

  Widget _buildDeleteIcon(BuildContext context) {
    return AppIcons.clear(
      size: 20,
      color: context.colors.iconSecondary,
    );
  }

  Widget _buildImageItemView(
    File screenshotPath, {
    double height = 150,
    double width = 150,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.file(screenshotPath, fit: BoxFit.cover),
    );
  }

  Widget _buildScreenshotHorizontalView(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: screenshotList.length,
              itemBuilder: (context, index) => Row(
                children: [
                  /// The image has size 101 * 243, the icon has size 20 * 20
                  /// The icon has position on the top right then sizedbox 121 * 263
                  ///
                  const SizedBox(width: 17),
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: _buildImageItemView(screenshotList[index]),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              return onDeleteTap(index);
                            },
                            child: _buildDeleteIcon(context),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// The distance between 2 photos is 37
                  ///  The length of the icon is 20
                  ///  30 - 20 = 17
                  const SizedBox(width: 17),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScreenshotVerticalView(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: screenshotList.length,
        itemBuilder: (context, index) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  _buildImageItemView(
                    screenshotList[index],
                    height: 32,
                    width: 22,
                  ),
                  SizedBox(width: Utilities.isSmallDevice(context) ? 12 : 20),
                  Expanded(
                    child: Text(
                      screenshotList[index].path,
                      style: AppTextStyles.textMedium.copyWith(
                        color: context.colors.textPrimary,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(width: Utilities.isSmallDevice(context) ? 0 : 4),
                  AppIcons.chevronRight(size: 24),
                ],
              ),
            ),
            if (index < screenshotList.length - 1) const SizedBox(height: 22),
          ],
        ),
      ),
    );
  }
}
