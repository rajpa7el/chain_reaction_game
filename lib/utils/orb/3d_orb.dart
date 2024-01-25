import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'dart:async';

class OrbDesign3D extends StatefulWidget {
  @override
  State<OrbDesign3D> createState() => _OrbDesign3DState();
}

class _OrbDesign3DState extends State<OrbDesign3D> {
  late Object orb;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    orb = Object(
        fileName: "lib/assets/models/red-ball/source/redball/redball.obj");
    orb.position.setValues(0, 0, 0);
    orb.updateTransform();

    // Set up a timer to rotate the orb
    timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        // Adjust rotation around the y-axis
        orb.rotation.y += 0.5;
        orb.updateTransform();
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Cube(
          onSceneCreated: (Scene scene) {
            scene.world.add(orb);
            scene.camera.zoom = 5;
          },
        ),
      ),
    );
  }
}
