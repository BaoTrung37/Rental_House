import 'package:batru_house_rental/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoomDetailView extends ConsumerStatefulWidget {
  const RoomDetailView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RoomDetailViewState();
}

class _RoomDetailViewState extends ConsumerState<RoomDetailView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BaseAppBar.titleAndBackButton(title: 'Chi tiết phòng'),
    );
  }
}
