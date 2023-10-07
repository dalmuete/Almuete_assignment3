import 'package:flutter/material.dart';

class TitleHome extends StatelessWidget {
  TitleHome(
    this.startplay_call, {
    super.key,
  });

  VoidCallback startplay_call;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Image.asset('assets/images/home_back.png'),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          'Try your Trivia Skills',
          style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w300,
          color: Colors.black
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: OutlinedButton(
            onPressed: startplay_call,
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 5,
            ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'PLAY',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                
                ),
              ),
          ),
          ),
        ),
      ],
    );
  }
}