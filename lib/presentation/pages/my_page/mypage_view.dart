import 'package:batru_house_rental/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPageView extends ConsumerStatefulWidget {
  const MyPageView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyPageViewState();
}

class _MyPageViewState extends ConsumerState<MyPageView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BaseAppBar.titleOnly(title: 'MyPage'),
      body: Center(
        child: Text('MyPage'),
      ),
    );
  }
}
