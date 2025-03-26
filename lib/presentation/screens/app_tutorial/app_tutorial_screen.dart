import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String description;
  final String image;

  const SlideInfo({
    required this.title,
    required this.description,
    required this.image,
  });
}

final slides = <SlideInfo>[
  const SlideInfo(
      title: 'Busca la comida',
      description: 'caption',
      image: 'assets/images/1.png'),
  const SlideInfo(
      title: 'Entrega rapida',
      description: 'caption',
      image: 'assets/images/2.png'),
  const SlideInfo(
      title: 'Disfruta la comida',
      description: 'caption',
      image: 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  late final PageController pageViewController = PageController();
  bool endReached = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  //Ciclo de vida de los StafulWidgets, obligatorio llamar al dispose
  @override
  void dispose() {
    // TODO: implement dispose
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
              controller: pageViewController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slideData) => _Slide(
                        title: slideData.title,
                        description: slideData.description,
                        imageUrl: slideData.image,
                      ))
                  .toList()),
          Positioned(
              right: 20,
              top: 60,
              child: TextButton(
                  onPressed: () => context.pop(), child: const Text('Salir'))),
          endReached ? Positioned(
              height: 30,
              right: 30,
              child: FadeInRight(
                delay: const Duration(seconds: 1),
                from: 15, // Solo se mueva 15 unidades
                child: FilledButton(
                    onPressed: () => context.pop, 
                    child: const Text('Comenzar')),
              )
                  ):const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.description, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    //Estilos de texto
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final descriptionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              description,
              style: descriptionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
