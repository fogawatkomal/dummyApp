// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReelaScreen extends StatefulWidget {
  const ReelaScreen({super.key});

  @override
  State<ReelaScreen> createState() => _ReelaScreenState();
}

class _ReelaScreenState extends State<ReelaScreen> {
  late List<VideoPlayerController> _controllers;
  late Future<List<void>> _initializeVideoPlayerFutures;

  @override
  void initState() {
    super.initState();
    _controllers = [
      VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      ),
      VideoPlayerController.network(
        'https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4',
      ),
      VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      ),
      VideoPlayerController.network(
        'https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4',
      ),
    ];

    _initializeVideoPlayerFutures =
        Future.wait(_controllers.map((controller) => controller.initialize()));
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reels'),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFutures,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: _controllers.length,
                itemBuilder: (context, index) {
                  return AspectRatio(
                    aspectRatio: _controllers[index].value.aspectRatio,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[300], // Placeholder color
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          VideoPlayer(_controllers[index]),
                          Align(
                            alignment: Alignment.center,
                            child: FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (_controllers[index].value.isPlaying) {
                                    _controllers[index].pause();
                                  } else {
                                    _controllers[index].play();
                                  }
                                });
                              },
                              child: Icon(
                                _controllers[index].value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    leading: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.blue, width: 2),
                                      ),
                                      child: const CircleAvatar(
                                          radius: 30,
                                          backgroundImage: NetworkImage(
                                              'https://randomuser.me/api/portraits/men/1.jpg')),
                                    ),
                                    title: const Text(
                                      'Username', // Add username here
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    subtitle: const Text(
                                      'Caption', // Add caption here
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )))
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
