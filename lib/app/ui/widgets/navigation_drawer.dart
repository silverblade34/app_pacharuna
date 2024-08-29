import 'package:app_pacharuna/app/ui/widgets/drawer_body.dart';
import 'package:app_pacharuna/app/ui/widgets/drawer_header.dart';
import 'package:flutter/material.dart';

class NavigationDrawerLayout extends StatelessWidget {
  const NavigationDrawerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      elevation: 0,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeaderWidget(),
            DrawerBodyWidget()
          ],
        ),
      ),
    );
  }
}
