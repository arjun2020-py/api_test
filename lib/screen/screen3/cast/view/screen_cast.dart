import 'package:flutter/material.dart' as material;

import '../model/cast_model.dart';



class ScreenCast extends material.StatelessWidget {
  ScreenCast({super.key, });
  

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
          child: material.FutureBuilder<List<CastModel>>(
            future: null,
            builder: (context, snapshot) {
              return material.Column(
                children: [
                  material.Image.network(
                   '',
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
                   
                   '',
                    style: material.TextStyle(
                        color: material.Colors.white, fontSize: 15),
                  ),
                  material.Text(
                    '',
                    style: material.TextStyle(
                        color: material.Colors.white, fontSize: 30),
                  ),
                  material.Text(
                  '',
                    style: material.TextStyle(
                        color: material.Colors.white, fontSize: 14),
                  )
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
