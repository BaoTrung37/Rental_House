import 'package:batru_house_rental/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostArticleView extends ConsumerStatefulWidget {
  const PostArticleView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PostArticleViewState();
}

class _PostArticleViewState extends ConsumerState<PostArticleView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BaseAppBar.titleAndBackButton(
        title: 'Đăng phòng',
      ),
      body: Text('a'),
    );
  }
}
