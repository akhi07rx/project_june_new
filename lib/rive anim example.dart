import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(MaterialApp(
    home: RiveEx(),
  ));
}

class RiveEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        //to fetch newwork address -> animation -> share -> copy embedded link -> paste it in new window-> right click and select
          // inspect -> source -> embeded
        child: RiveAnimation.network("https://public.rive.app/community/runtime-files/5708-11153-sophia-iii-hud.riv")
        // RiveAnimation.asset(
        //   "assets/animation/cute-animal-jumping.riv",
        //   fit: BoxFit.contain,
        // ),

      ),
    );
  }
}
