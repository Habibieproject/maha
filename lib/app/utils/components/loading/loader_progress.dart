import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:maha/app/utils/components/animations/assets.dart';

class LoaderProgressCustom extends StatefulWidget {
  final Color loaderBackground;
  final Color iconColor;
  final IconData icon;
  final String animationType;
  final String shape;
  final bool rotateIcon;

  const LoaderProgressCustom({
    super.key,
    this.loaderBackground = Colors.transparent,
    this.iconColor = Colors.white,
    this.icon = Icons.sync,
    this.animationType = "full_flip",
    this.shape = "square",
    this.rotateIcon = true,
  });

  @override
  State<LoaderProgressCustom> createState() => _LoaderProgressCustomState();
}

class _LoaderProgressCustomState extends State<LoaderProgressCustom>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotationHorizontal;
  late Animation<double> rotationVertical;
  late Color loaderColor;
  late Color iconColor;
  late IconData icon;
  late Widget loaderIconChild;
  late String animationType;
  late String shape;
  late bool rotateIcon;

  @override
  void initState() {
    super.initState();
    _initializeAnimationController();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  void _initializeAnimationController() {
    loaderColor = widget.loaderBackground;
    iconColor = widget.iconColor;
    icon = widget.icon;
    animationType = widget.animationType;
    shape = widget.shape;
    rotateIcon = widget.rotateIcon;

    controller = _createAnimationController(animationType);

    controller.addStatusListener((status) {
      if (animationType == "half_flip") {
        if (status == AnimationStatus.completed) {
          setState(() {
            controller.repeat();
          });
        }
      } else if (animationType == "full_flip") {
        if (status == AnimationStatus.dismissed) {
          setState(() {
            controller.forward();
          });
        }
        if (status == AnimationStatus.completed) {
          setState(() {
            controller.repeat();
          });
        }
      } else {}
    });

    controller.forward();
  }

  AnimationController _createAnimationController([String type = 'full_flip']) {
    AnimationController animCtrl;

    switch (type) {
      case "half_flip":
        animCtrl = AnimationController(
          duration: const Duration(milliseconds: 4000),
          vsync: this,
        );

        rotationHorizontal = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animCtrl,
            curve: const Interval(0.0, 0.50, curve: Curves.linear),
          ),
        );

        rotationVertical = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animCtrl,
            curve: const Interval(0.50, 1.0, curve: Curves.linear),
          ),
        );
        break;
      case "full_flip":
      default:
        animCtrl = AnimationController(
          duration: const Duration(milliseconds: 2000),
          vsync: this,
        );

        rotationHorizontal = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animCtrl,
            curve: const Interval(0.0, 0.50, curve: Curves.linear),
          ),
        );

        rotationVertical = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animCtrl,
            curve: const Interval(0.50, 1.0, curve: Curves.linear),
          ),
        );
        break;
    }

    return animCtrl;
  }

  final List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        Animations.loading
            .toLottieAnimation, // Replace with your Lottie animation file path
        width: 200,
        height: 200,
      ),
    );
    //**versi spinkit
    // SpinKitChasingDots(
    //   // color: AppColor.kPrimaryColor, // Warna spinner
    //   size: 75.0, // Ukuran spinner
    //   itemBuilder: (context, index) {
    //     return DecoratedBox(
    //         decoration: BoxDecoration(
    //             gradient: const LinearGradient(
    //               begin: Alignment.topLeft,
    //               end: Alignment.bottomRight,

    //               colors: [
    //                 Color(0xFFF26A68),
    //                 Color(0xFF7F57A4),
    //                 Color(0xFF58A4DA),
    //               ], // Replace with your desired gradient colors
    //             ),
    //             shape: BoxShape.circle,
    //             color: AppColor.kGreyColor));
    //   },
    // );
    //**versi halfliper
    // if (animationType == "half_flip") {
    //   return _buildHalfFlipper(context);
    // } else {
    //   return _buildFullFlipper(context);
    // }
  }

  // Widget _buildHalfFlipper(BuildContext context) {
  //   return AnimatedBuilder(
  //     animation: controller,
  //     builder: (BuildContext context, Widget? child) {
  //       return Transform(
  //         transform: Matrix4.identity()
  //           ..setEntry(3, 2, 0.006)
  //           ..rotateX(sin(2 * pi * rotationVertical.value))
  //           ..rotateY(sin(2 * pi * rotationHorizontal.value)),
  //         alignment: Alignment.center,
  //         child: Container(
  //           decoration: BoxDecoration(
  //             shape: shape == "circle" ? BoxShape.circle : BoxShape.rectangle,
  //             borderRadius: shape == "circle"
  //                 ? null
  //                 : const BorderRadius.all(Radius.circular(8.0)),
  //             color: loaderColor,
  //           ),
  //           width: 40.0,
  //           height: 40.0,
  //           child: rotateIcon == true
  //               ? RotationTransition(
  //                   turns: rotationHorizontal.value == 1.0
  //                       ? rotationVertical
  //                       : rotationHorizontal,
  //                   child: Center(
  //                     child: Image.asset(AppImage.kImageLogoPNG),
  //                   ),
  //                 )
  //               : Center(
  //                   child: Image.asset(AppImage.kImageLogoPNG),
  //                 ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // Widget _buildFullFlipper(BuildContext context) {
  //   return AnimatedBuilder(
  //     animation: controller,
  //     builder: (BuildContext context, Widget? child) {
  //       return Transform(
  //         transform: Matrix4.identity()
  //           ..setEntry(3, 2, 0.006)
  //           ..rotateX((2 * pi * rotationVertical.value))
  //           ..rotateY((2 * pi * rotationHorizontal.value)),
  //         alignment: Alignment.center,
  //         child: Container(
  //           decoration: BoxDecoration(
  //             shape: shape == "circle" ? BoxShape.circle : BoxShape.rectangle,
  //             borderRadius: shape == "circle"
  //                 ? null
  //                 : const BorderRadius.all(Radius.circular(8.0)),
  //             color: loaderColor,
  //           ),
  //           width: 40.0,
  //           height: 40.0,
  //           child: Center(
  //             child: Image.asset(AppImage.kImageLogoPNG),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
