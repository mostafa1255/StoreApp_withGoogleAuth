import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store_app/Feuture/Home/views/widgets/HomeScreenbody.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: HomeScreenbody(),
    );
  }
}