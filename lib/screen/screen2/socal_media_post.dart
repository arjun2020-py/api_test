import 'package:flutter/material.dart';

class SocalMeidaPost extends StatelessWidget {
  const SocalMeidaPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/images/profie.png'),
        ),
        actions: [Icon(Icons.notifications)],
      ),
      body: Column(
        children: [
       
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Column(
              children: [
                Text(
                  'Social Media Posts',
                  style: TextStyle(fontSize: 20),
                ),
                Image.network('src')
              ],
            ),
          )
        ],
      ),
    );
  }
}
