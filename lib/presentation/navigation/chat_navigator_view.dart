import 'package:batru_house_rental/data/providers/chat_navigator_provider.dart';
import 'package:batru_house_rental/presentation/navigation/app_router.dart';
import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/widgets/app_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatNavigatorView extends ConsumerStatefulWidget {
  const ChatNavigatorView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChatNavigatorViewState();
}

class _ChatNavigatorViewState extends ConsumerState<ChatNavigatorView>
    with AutomaticKeepAliveClientMixin {
  @mustCallSuper
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AppWillPopScope(
      navigator: ref.read(chatNavigatorProvider),
      child: Navigator(
        key: ref.read(chatNavigatorProvider).navigatorKey,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRoutes.chatList,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
