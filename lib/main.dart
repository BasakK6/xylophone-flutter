import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Future<void> playSound(int noteNumber) async {
    final player = AudioPlayer();
    await player.play(
      AssetSource("note$noteNumber.wav"),
    );
  }

  Widget buildXylophoneKey({required Color color, required int noteNumber}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: color),
        onPressed: () async {
          await playSound(noteNumber);
        },
        child: const Text(""),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildXylophoneKey(color: Colors.red, noteNumber: 1),
              buildXylophoneKey(color: Colors.orange, noteNumber: 2),
              buildXylophoneKey(color: Colors.yellow, noteNumber: 3),
              buildXylophoneKey(color: Colors.green, noteNumber: 4),
              buildXylophoneKey(color: Colors.teal, noteNumber: 5),
              buildXylophoneKey(color: Colors.blue, noteNumber: 6),
              buildXylophoneKey(color: Colors.purple, noteNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
