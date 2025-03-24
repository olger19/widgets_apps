import 'package:flutter/material.dart';

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

class AppTutorialScreen extends StatelessWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          physics: const BouncingScrollPhysics(),
          children: slides
              .map((slideData) => _Slide(
                    title: slideData.title,
                    description: slideData.description,
                    image: slideData.image,
                  ))
              .toList()),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const _Slide(
      {required this.title, required this.description, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
