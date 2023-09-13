import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  String title;
  String caption;
  String imageUrl;
  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

final slides = <SlideInfo>[
  SlideInfo(
      title: 'Bienvenido',
      caption:
          'Se parte a esta aplicacion la cual fue hecha para demostrar los componentes mas importante de flutter',
      imageUrl: 'https://images7.alphacoders.com/633/633262.png'),
  SlideInfo(
      title: 'Contenido',
      caption:
          'Se muestran los botones, botones personalisados, cards, contenedores animados, progress bar entre otros componenetes',
      imageUrl:
          ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj8kdyNVqAKpp90l5DFWtPaemP0nluRjEtMWuMbj5QtcBW4xzplzwBgO-_VuBlcxzRnng&usqp=CAU')),
  SlideInfo(
      title: 'Fin',
      caption:
          'Espero te resulte util la aplicación y que puedas usar los componentes mostrados en tu proyecto',
      imageUrl:
          ("https://www.gratistodo.com/wp-content/uploads/2021/09/Fondos-de-pantalla-Rick-y-Morty-Wallpapers-gratistodo.com-1.png")),
];

class AppTutorial extends StatefulWidget {
  static const String name = "app_tutorial";
  const AppTutorial({super.key});

  @override
  State<AppTutorial> createState() => _AppTutorialState();
}

class _AppTutorialState extends State<AppTutorial> {
  final PageController pageViewController = PageController();
  bool endReached = false;
  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (page >= (slides.length - 1.5) && !endReached) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
              controller: pageViewController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((data) => _Slide(
                      title: data.title,
                      caption: data.caption,
                      imageUrl: data.imageUrl))
                  .toList()),
          endReached
              ? FadeInRight(
                    from: 15.0,
                    delay: Duration(milliseconds: 100),child: const SizedBox())
              : Positioned(
                  right: 20.0,
                  top: 50.0,
                  child: FadeInRight(
                    from: 15.0,
                    delay: Duration(milliseconds: 100),
                    child: TextButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: const Text("Skip")),
                  )),
          endReached
              ? Positioned(
                  bottom: 30.0,
                  right: 30.0,
                  child: FadeInRight(
                    from: 15.0,
                    delay: const Duration(milliseconds: 50),
                    child: FilledButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: const Text("Empezar")),
                  ))
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyLarge;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.network(imageUrl)),
              const SizedBox(height: 30.0),
              Text(title, style: titleStyle),
              const SizedBox(height: 20.0),
              Text(caption, style: captionStyle),
            ]),
      ),
    );
  }
}
