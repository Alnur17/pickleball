import 'package:flutter/material.dart';

// class CustomLoaderButton extends StatelessWidget {
//   const CustomLoaderButton({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       height: 43,
//       width: Get.width,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color(0xFFCF1820), Color(0xFF5E0A0D)],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//         borderRadius: BorderRadius.circular(6),
//       ),
//       child: Center(child: SpinKitDualRing(
//         color: AppColors.white,
//         size: 30.0,
//       ),),
//     );
//   }
// }

class CustomLoader extends StatelessWidget {
  final Color color;
  final List<Color>? gradientColors;

  const CustomLoader({super.key, required this.color, this.gradientColors});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: LinearGradient(
          colors: [Color(0xff007FF5), Color(0xff003A71)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}
