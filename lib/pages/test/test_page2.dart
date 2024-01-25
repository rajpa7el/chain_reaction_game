import 'package:chain_reaction_app/common/global.dart';
import 'package:chain_reaction_app/utils/orb/3d_orb.dart';
import 'package:chain_reaction_app/utils/orb/orb_design.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TestPage2 extends StatelessWidget {
  const TestPage2({super.key});

  // List<int> orbCount = List.generate(3, (index) => 0);
  @override
  Widget build(BuildContext context) {
    // Size screenSize = getScreenSize(context);
    // return Scaffold(
    //     // backgroundColor: Colors.white,
    //     // body: Center(
    //     // child: SizedBox(
    //     // width: screenSize.width * 0.5,
    //     // height: screenSize.height * 0.85, // Adjusted height
    //     body: Align(
    //   alignment: Alignment.center,
    //   child: OrbDesign3D(),
    // )
    //     // ),
    //     // ),
    //     );
    return OrbDesign3D();
  }
}
