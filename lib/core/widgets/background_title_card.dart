import 'package:flutter/material.dart';

class BackgroundTitleCard extends StatelessWidget {
  const BackgroundTitleCard({
    Key key,
    @required this.background,
    @required this.title,
    this.alpha = 0.1,
    this.height = 250,
    @required this.onTap,
  }) : super(key: key);

  final Widget background;
  final String title;

  /// Between 0 and 1 where 0 is 100% transparent and 1 is black
  final double alpha;
  final double height;
  final Function() onTap;

  final _titleStyle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    shadows: [
      Shadow(
        blurRadius: 2.0,
        color: Colors.black26,
        offset: const Offset(1.0, 1.0),
      ),
    ]
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 1.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: <Widget>[
            Container(
              height: this.height, 
              child: background
            ),
            // Alpha layer
            Container(
              height: this.height,
              color: Color.fromARGB((this.alpha * 255).round(), 0, 0, 0),
            ),
            Container(
              height: this.height,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      title,
                      style: _titleStyle,
                    ),
                  )
                ),
              ),
            ),
          ]
        ),
      )
    );
  }
}