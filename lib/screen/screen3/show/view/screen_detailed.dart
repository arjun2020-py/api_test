import 'package:flutter/material.dart' as material;

import '../compoents/screen_custom_elev.dart';
import '../model/show_model.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';
class ScreenDetiledShow extends material.StatelessWidget {
  ScreenDetiledShow({super.key, required this.shows});
  ShowModel shows;

  @override
  material.Widget build(material.BuildContext context) {
    return material.Scaffold(
      backgroundColor: material.Colors.black,
      appBar: material.AppBar(
        leading: material.Container(
          decoration: material.BoxDecoration(
              shape: material.BoxShape.circle,
              color: material.Color(0xffd9e3f5)),
          child: material.IconButton(
            onPressed: () => material.Navigator.of(context).pop(),
            icon: material.Icon(
              material.Icons.arrow_back_ios_new_rounded,
              color: material.Colors.red,
            ),
          ),
        ),
        actions: [
          material.Container(
            decoration: material.BoxDecoration(
                shape: material.BoxShape.circle,
                color: material.Color(0xffd9e3f5)),
            child: material.IconButton(
              onPressed: () => material.Navigator.of(context).pop(),
              icon: material.Icon(
                material.Icons.bookmark,
                color: material.Colors.red,
              ),
            ),
          ),
          material.SizedBox(
            width: 10,
          ),
          material.Container(
            decoration: material.BoxDecoration(
                shape: material.BoxShape.circle,
                color: material.Color(0xffd9e3f5)),
            child: material.IconButton(
              onPressed: () => material.Navigator.of(context).pop(),
              icon: material.Icon(
                material.Icons.share,
                color: material.Colors.red,
              ),
            ),
          ),
           material.SizedBox(
            width: 10,
          ),
        ],
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
              material.Text(
                shows.name,
                style: material.TextStyle(
                    color: material.Colors.white, fontSize: 30),
              ),
              material.Text(
                shows.language.name,
                style: material.TextStyle(
                    color: material.Colors.white, fontSize: 15),
              ),
            
              
              material.SizedBox(
                height: 10,
              ),
              material.Row(
                mainAxisAlignment: material.MainAxisAlignment.spaceAround,
                children: [
                  ShowElvButton(
                    text: 'Play ',
                    bgColor: material.Colors.red,
                    width: 0.4,
                    icons: material.Icons.play_arrow,
                  ),
                  ShowElvButton(
                    text: 'Download',
                    bgColor: material.Colors.white,
                    width: 0.4,
                    icons: material.Icons.download,
                  )
                ],
              ),
              material.SizedBox(
                height: 10,
              ),
              HtmlWidget(
                shows.summary,
                textStyle: material.TextStyle(color: material.Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
