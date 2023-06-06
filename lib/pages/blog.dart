import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../widgets/navigation.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color(0xFFCDCFCF),
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
              child: const HtmlWidget(
                  '''<iframe width="100%" height="100%" src="https://juejin.cn/user/4002679886714327/posts"></iframe>'''),
            ),
          ),
        ),
        const Navigation(),
      ],
    );
  }
}
