import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownView extends StatefulWidget {
  @override
  _MarkdownViewState createState() => _MarkdownViewState();
}

class _MarkdownViewState extends State<MarkdownView> {

  TextEditingController _controller = TextEditingController();
  String text = "[<img src='https://img.shields.io/badge/linkedin-%230077B5.svg?&style=for-the-badge&logo=linkedin&logoColor=white' />](https://www.linkedin.com/in/ianluan/)";

  void initState() {
    super.initState();
    _controller.addListener(updateMarkdown);
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void updateMarkdown() {
    setState(() {
      text = _controller.text;
      print("opa");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                
                Container(
                  height: (MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top)/2,
                  child: Markdown(
                    data: text,
                    //"# Mayarinha gente fina!\n## Mayara é:\n- *Linda*\n - **bonita**\n> Você sabe o que são financeiras?\nAs financeiras se parecem com os bancos, a não ser peloi fato de que estas emitem **LCs** e RDBs, enquanto os bancos emitem LCI, LCA e CDB",
                    styleSheet: MarkdownStyleSheet(
                      blockquotePadding:
                          EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 10),
                      blockquoteDecoration: BoxDecoration(
                          color: Colors.yellow.withOpacity(0.3),
                          border:
                              Border(left: BorderSide(color: Colors.yellow, width: 5)))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: (MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top)/2,
                  child: TextField(
                    controller: _controller,
                    maxLines: 150,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      
                    ),
                    cursorColor: Colors.black,
                  )
                ),
              ],
            ),
          ),
        /*
        child: Markdown(
          data:
              "# Mayarinha gente fina!\n## Mayara é:\n- *Linda*\n - **bonita**\n> Você sabe o que são financeiras?\nAs financeiras se parecem com os bancos, a não ser peloi fato de que estas emitem **LCs** e RDBs, enquanto os bancos emitem LCI, LCA e CDB",
          styleSheet: MarkdownStyleSheet(
              blockquotePadding:
                  EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 10),
              blockquoteDecoration: BoxDecoration(
                  color: Colors.yellow.withOpacity(0.3),
                  border:
                      Border(left: BorderSide(color: Colors.yellow, width: 5)))),
        ), */
      ),
    );
  }
}
