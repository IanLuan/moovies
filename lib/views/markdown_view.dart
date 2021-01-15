import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownView extends StatefulWidget {
  @override
  _MarkdownViewState createState() => _MarkdownViewState();
}

class _MarkdownViewState extends State<MarkdownView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Markdown(
        data:
            "> Você sabe o que são financeiras?\nAs financeiras se parecem com os bancos, a não ser peloi fato de que estas emitem **LCs** e RDBs, enquanto os bancos emitem LCI, LCA e CDB",
        styleSheet: MarkdownStyleSheet(
            blockquotePadding:
                EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 10),
            blockquoteDecoration: BoxDecoration(
                color: Colors.yellow.withOpacity(0.3),
                border:
                    Border(left: BorderSide(color: Colors.yellow, width: 5)))),
      ),
    );
  }
}
