import 'package:flutter/material.dart' as material;

import '../model/show_model.dart';

class ScreenDetiledShow extends material.StatelessWidget {
  ScreenDetiledShow({super.key, required this.shows});
  ShowModel shows;

  @override
  material.Widget build(material.BuildContext context) {
    return material.Scaffold(
      backgroundColor: material.Colors.black,
      appBar: material.AppBar(
        leading: material.IconButton(
          onPressed: () => material.Navigator.of(context).pop(),
          icon: material.Icon(
            material.Icons.arrow_back,
            color: material.Colors.red,
          ),
        ),
        backgroundColor: material.Colors.transparent,
      ),
      body: material.SingleChildScrollView(
        child: material.Center(
          child: material.Column(
            children: [
              material.Image.network(
                shows.image.original,
                width: 200,
              ),
              material.SizedBox(
                width: material.MediaQuery.sizeOf(context).width * 0.7,
                child: material.ElevatedButton.icon(
                  icon: material.Icon(material.Icons.play_arrow),
                  onPressed: () {},
                  label: material.Text('Play Now'),
                ),
              ),
              material.Text(
                shows.language.name,
                style: material.TextStyle(
                    color: material.Colors.white, fontSize: 15),
              ),
              material.Text(
                shows.name,
                style: material.TextStyle(
                    color: material.Colors.white, fontSize: 30),
              ),
              material.Text(
                shows.summary,
                style: material.TextStyle(
                    color: material.Colors.white, fontSize: 14),
              )
            ],
          ),
        ),
      ),
    );
  }
}
