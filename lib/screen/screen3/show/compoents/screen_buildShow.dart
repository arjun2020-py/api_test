import 'package:flutter/material.dart';

import '../model/show_model.dart';

GridView buildShow(List<ShowModel> show) {
    return 
    GridView.builder(
      itemCount: show.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
      itemBuilder: (context, index) {
        var post = show[index];
        
        return Container(
      
        );
      },
    );
  }