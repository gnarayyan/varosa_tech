import 'package:flutter/material.dart';
import 'tab_home_screen.dart';
import 'tab_detail_screen.dart';

class TabNavigator extends StatefulWidget {
  final int tabIndex;

  const TabNavigator({super.key, required this.tabIndex});

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  late final GlobalKey<NavigatorState> _navigatorKey;

  @override
  void initState() {
    super.initState();
    _navigatorKey = GlobalKey<NavigatorState>();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            switch (settings.name) {
              case '/detail':
                return TabDetailScreen(
                  tabIndex: widget.tabIndex,
                  navigatorKey: _navigatorKey,
                );
              default:
                return TabHomeScreen(
                  tabIndex: widget.tabIndex,
                  onNavigateToDetail: () {
                    _navigatorKey.currentState?.pushNamed('/detail');
                  },
                );
            }
          },
        );
      },
    );
  }
}
