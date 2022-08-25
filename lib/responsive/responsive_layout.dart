import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget tabletLayout;
  final Widget desktopLayout;
  const ResponsiveLayout({Key? key, required this.mobileLayout, required this.tabletLayout, required this.desktopLayout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {

      if(constraints.maxWidth < 500){
        return mobileLayout;
      }
      else if(constraints.maxWidth < 1100){
        return tabletLayout;
      }
      else{
        return desktopLayout;
      }

    },);
  }
}
