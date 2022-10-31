import 'package:flutter/material.dart';

class AddFav extends StatelessWidget {
  const AddFav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.favorite_border,
        color: Colors.red,
      ),
    );
  }
}
