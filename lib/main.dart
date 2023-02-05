import 'package:demo/screen/windows_explorer.dart';
import 'package:demo/screen/myfolder.dart';
import 'package:demo/screen/shoe_display.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          title: const Text('DemoApp'),
          
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: 'Shoe Display',
              ),
              Tab(
                text: 'Windows Explorer',
              ),
              Tab(
                text: 'My Folder',
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: const TabBarView(
          children: [ShoeDisplay(), WindowsExplorer(), MyFolder()],
        ),
      ),
    );
  }
}
