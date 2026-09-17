import 'package:flutter/material.dart';

import 'dart:ui' as ui;

class MobileDesignWidget extends StatelessWidget {
  final Widget child;

  const MobileDesignWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxHeight < constraints.maxWidth) {
          return Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(1, 192, 195, 192),
              // image: DecorationImage(
              //     image: ExactAssetImage('assets/web_bg.jpg'),
              //     fit: BoxFit.cover)
            ),
            alignment: Alignment.center,
            child: ClipRect(
              child: AspectRatio(
                aspectRatio: getCurrentWebAppRatio(context),
                child: child,
              ),
            ),
          );
        }
        return child;
      },
    );
  }

  double getCurrentWebAppRatio(context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    final maxWebAppRatio =
        (screenWidth > 700 && screenHeight > 500) ? 3.5 / 6.0 : 4.5 / 5.0;
    const minWebAppRatio = 9.0 / 16.0;
    double currentWebAppRatio = minWebAppRatio;

    // Fixed ratio for Web
    // ignore: deprecated_member_use
    var physicalScreenSize = ui.window.physicalSize;
    var physicalWidth = physicalScreenSize.width;
    var physicalHeight = physicalScreenSize.height;

    currentWebAppRatio = physicalWidth / physicalHeight;
    if (currentWebAppRatio > maxWebAppRatio) {
      currentWebAppRatio = maxWebAppRatio;
    } else if (currentWebAppRatio < minWebAppRatio) {
      currentWebAppRatio = minWebAppRatio;
    }
    return currentWebAppRatio;
  }
}
