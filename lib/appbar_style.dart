import 'package:flutter/material.dart';


class AppBarStyleClass{
  AppbarStyle appbarStyle = AppbarStyle.day;
  Future<void> toggleWithDelay()async{
    await Future.delayed(const Duration(seconds: 3));
    if(appbarStyle.n==0){
      appbarStyle = AppbarStyle.night;
    }else{
      appbarStyle = AppbarStyle.day;
    }
  }
} 



enum AppbarStyle {
  day(0, Colors.amber, Icons.sunny),
  night(1, Colors.brown, Icons.nightlight);

  const AppbarStyle(this.n, this.color, this.icon);
  final int n;
  final Color color;
  final IconData icon;
}
