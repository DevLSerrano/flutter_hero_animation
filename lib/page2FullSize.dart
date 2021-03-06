import 'package:flutter/material.dart';

class Page2FullSize extends StatefulWidget {
  const Page2FullSize({Key? key, required this.tag}) : super(key: key);
  final String tag;
  @override
  _Page2FullSizeState createState() => _Page2FullSizeState();
}

class _Page2FullSizeState extends State<Page2FullSize> {
  final String text =
      'Transições Hero são um padrão comum de IU. Elas informam ao usuário que a tela foi trocada, enquanto mantêm em destaque o foco da interação. O widget Hero do Flutter cria automaticamente uma transição Hero entre duas rotas de navegação.';

  double height = 50;
  bool showSeeMore = true;
  String textButton = 'See More';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Hero(
                  tag: widget.tag,
                  child: FlutterLogo(
                    size: size.width,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              AnimatedContainer(
                width: size.width,
                height: height,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                duration: Duration(seconds: 2),
                child: Text(
                  text,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (height == 50) {
                      height = size.height / 4;
                      textButton = 'See Less';
                    } else {
                      height = 50;
                      textButton = 'See More';
                    }
                  });
                },
                child: Text(textButton),
              )
            ],
          ),
        ),
      ),
    );
  }
}
