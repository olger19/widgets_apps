import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {


  List<int> imageIds = [1,2,3,4,5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image:
                    NetworkImage('https://picsum.photos/id/${imageIds[index]}/500/300'));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => context.pop(), child: const Icon(Icons.arrow_back_ios_new_outlined),),
    );
  }
}
