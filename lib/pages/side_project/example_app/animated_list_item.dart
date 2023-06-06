import 'package:animated_list_item/animated_list_item.dart';
import 'package:flutter/material.dart';

class AnimatedListItemExample extends StatefulWidget {
  const AnimatedListItemExample({Key? key}) : super(key: key);

  @override
  State<AnimatedListItemExample> createState() => _AnimatedListItemExampleState();
}

class _AnimatedListItemExampleState extends State<AnimatedListItemExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  List list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  Container item(int index) {
    return Container(
      color: Colors.blue,
      margin: const EdgeInsets.all(3),
      alignment: Alignment.center,
      child: Text("$index"),
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 4500),
      vsync: this,
    );
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 272,
      height: 576,
      alignment: Alignment.center,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('\nExample'),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return AnimatedListItem(
                            index: index,
                            length: list.length,
                            aniController: _animationController,
                            animationType: AnimationType.flipX,
                            child: item(index),
                          );
                        }),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return AnimatedListItem(
                            index: index,
                            length: list.length,
                            aniController: _animationController,
                            animationType: AnimationType.flipY,
                            child: item(index),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return AnimatedListItem(
                            index: index,
                            length: list.length,
                            aniController: _animationController,
                            animationType: AnimationType.zoomIn,
                            child: item(index),
                          );
                        }),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return AnimatedListItem(
                            index: index,
                            length: list.length,
                            aniController: _animationController,
                            animationType: AnimationType.slideIn,
                            startX: 40,
                            startY: 60,
                            child: item(index),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}