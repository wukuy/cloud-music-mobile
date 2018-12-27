import 'package:flutter/material.dart';

class RecommendBox extends StatefulWidget {
  final List<Widget> children;
  RecommendBox({this.children});

  @override
  State<StatefulWidget> createState() => _RecommendBox();
}

class _RecommendBox extends State<RecommendBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: SliverGrid.count(
          crossAxisCount: 3,
          children: widget.children),
    );
  }
}
