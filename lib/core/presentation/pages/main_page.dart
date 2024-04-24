import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/core/app_export.dart';
import 'package:movieapp/core/resources/app_router.dart';
import 'package:movieapp/widgets/custom_bottom_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          final String location = GoRouterState.of(context).matchedLocation;
          if (!location.startsWith(homePath)) {
            _onItemTapped(0, context);
          }
          return;
        },
        child: widget.child!,
      ),
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: _getSelectedIndex(context),
        onTap: (index) => _onItemTapped(index, context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed(AppRoutes.mqttScreen);
        },
        child: Text(
          'MQTT',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  int _getSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith(homePath)) {
      return 0;
    } else if (location.startsWith(searchPath)) {
      return 1;
    }

    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.goNamed(AppRoutes.homeRoute);
        break;
      case 1:
        context.goNamed(AppRoutes.searchRoute);
        break;

      default:
        context.goNamed(AppRoutes.homeRoute);
        break;
    }
  }
}
