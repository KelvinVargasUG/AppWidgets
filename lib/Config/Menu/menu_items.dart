import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: "Botones",
      subtitle: "Varios botones en flutter",
      link: '/buttons',
      icon: Icons.smart_button_rounded),
  MenuItem(
      title: "Tarjetas",
      subtitle: "Un contenerdor estelizado",
      link: '/cards',
      icon: Icons.credit_card_rounded),
  MenuItem(
      title: "Progress Indicators",
      subtitle: "Generales y controladores",
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: "Snackbars y dialogos",
      subtitle: "Indicadores en pantalla",
      link: '/snackbar',
      icon: Icons.info_outlined),
  MenuItem(
      title: "Animated Container",
      subtitle: "Contenedor animado",
      link: '/animated',
      icon: Icons.animation_outlined),
  MenuItem(
      title: "UI Controls + Tiles",
      subtitle: "Una serie de controles de flutter",
      link: '/uiControls',
      icon: Icons.view_carousel_rounded),
];
