// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:widgets_app/Config/Menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int nawDrawerIndex = -1;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: nawDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          nawDrawerIndex = value;
        });

        final manuItem = appMenuItems[value];
        context.push(manuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          // ignore: prefer_const_constructors
          child: Row(
            children: const [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
              ),
              SizedBox(width: 10),
              Text(
                "Bienvenido User",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        ...appMenuItems.sublist(0, 3).map((e) => NavigationDrawerDestination(
              icon: Icon(e.icon),
              label: Text(e.title),
            )),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 13, 28, 10),
          child: Text("Mas opciones",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
        ),
        ...appMenuItems.sublist(3).map((e) => NavigationDrawerDestination(
              icon: Icon(e.icon),
              label: Text(e.title),
            )),
      ],
    );
  }
}
