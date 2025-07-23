import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toogleFavorite() {
    setState(() {
      setState(() {
        if (_isFavorited) {
          _favoriteCount -= 1;
          _isFavorited = false;
        } else {
          _favoriteCount += 1;
          _isFavorited = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            _toogleFavorite();
          },
          icon: _isFavorited ? Icon(Icons.star) : Icon(Icons.star_border),
          color: Colors.red[500],
          iconSize: 20.0,
        ),
        SizedBox(
          child: Text(
            '$_favoriteCount',
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }
}
