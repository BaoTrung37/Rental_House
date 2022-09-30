import 'package:batru_house_rental/presentation/pages/search/search_state.dart';
import 'package:batru_house_rental/presentation/pages/search/search_view.dart';
import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoomTypeItemView extends ConsumerWidget {
  const RoomTypeItemView({
    required this.roomType,
    Key? key,
  }) : super(key: key);

  final RoomType roomType;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roomSelected = ref.watch(searchProvider).roomType;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 16,
            height: 16,
            child: Center(
              child: SizedBox(
                width: 16,
                height: 16,
                child: Radio(
                  value: roomType,
                  groupValue: roomSelected,
                  activeColor: context.colors.primaryText,
                  onChanged: (object) {
                    if (object is RoomType?) {
                      ref.read(searchProvider.notifier).updateRoomType(object!);
                    }
                  },
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            roomType.title,
            style: AppTextStyles.textMedium
                .copyWith(color: context.colors.textPrimary),
          ),
        ],
      ),
    );
  }
}
