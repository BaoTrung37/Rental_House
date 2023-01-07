import 'package:batru_house_rental/presentation/navigation/app_routers.dart';
import 'package:batru_house_rental/presentation/pages/admin_home/admin_home_view.dart';
import 'package:batru_house_rental/presentation/pages/chat/chat_view.dart';
import 'package:batru_house_rental/presentation/pages/chat_list/chat_list_view.dart';
import 'package:batru_house_rental/presentation/pages/favorite/favorite_view.dart';
import 'package:batru_house_rental/presentation/pages/home/home_view.dart';
import 'package:batru_house_rental/presentation/pages/house_detail/house_detail_view.dart';
import 'package:batru_house_rental/presentation/pages/login/login_view.dart';
import 'package:batru_house_rental/presentation/pages/main_menu/main_menu_view.dart';
import 'package:batru_house_rental/presentation/pages/more_article/more_article_view.dart';
import 'package:batru_house_rental/presentation/pages/my_page/mypage_view.dart';
import 'package:batru_house_rental/presentation/pages/owner_article/owner_article_view.dart';
import 'package:batru_house_rental/presentation/pages/post_article/post_article_view.dart';
import 'package:batru_house_rental/presentation/pages/search/search_view.dart';
import 'package:batru_house_rental/presentation/pages/splash/splash_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static bool _isInitialRouteCalled = false;

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    debugPrint('----> Navigate to route: ${settings.name}');

    switch (settings.name) {
      case AppRoutes.splash:
        _isInitialRouteCalled = true;

        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SplashView(),
        );

      case AppRoutes.empty:
        // When app runs first time, it always pushes an empty route ("/")
        // and throw an exception if an empty route has no page
        // ref: https://docs.flutter.dev/development/ui/navigation/deep-linking
        // Only show empty screen at the first time

        if (_isInitialRouteCalled) {
          return null;
        }

        return MaterialPageRoute(
          settings: settings,
          builder: (context) => Container(),
        );

      case AppRoutes.login:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const LoginView(),
        );

      case AppRoutes.mainMenu:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const MainMenuView(),
        );

      case AppRoutes.home:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HomeView(),
        );

      case AppRoutes.houseDetail:
        final args = settings.arguments as HouseDetailArguments;
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => HouseDetailView(
            houseId: args.houseId,
          ),
        );

      case AppRoutes.favorite:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const FavoriteView(),
        );

      case AppRoutes.chat:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ChatView(
            chatArguments: settings.arguments as ChatArguments,
          ),
        );

      case AppRoutes.chatList:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const ChatListView(),
        );

      case AppRoutes.myPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const MyPageView(),
        );
      case AppRoutes.search:
        final args = settings.arguments as SearchArguments;
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => SearchView(
            districtId: args.districtId,
          ),
        );
      case AppRoutes.postArticle:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const PostArticleView(),
        );
      case AppRoutes.ownerHouse:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => OwnerArticleView(
            arguments: settings.arguments as OnwerArticleArguments,
          ),
        );
      case AppRoutes.moreArticle:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => MoreArticleView(
            arguments: settings.arguments as MoreArticleArguments,
          ),
        );
      case AppRoutes.adminHome:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const AdminHomeView(),
        );
      default:
        return null;
    }
  }
}
