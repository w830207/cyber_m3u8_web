import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(-0.9, 0.9),
      child: Wrap(
        children: [
          TextButton(
            onPressed: () {
              context.go('/');
            },
            child: const Text("Home"),
          ),
          TextButton(
            onPressed: () {
              context.go('/side_project');
            },
            child: const Text("About me"),
          ),
          TextButton(
            onPressed: () {
              context.go('/side_project');
            },
            child: const Text("Side projects"),
          ),
          TextButton(
            onPressed: () {
              context.go('/blog');
            },
            child: const Text("Blog"),
          ),
        ],
      ),
    );
  }
}
