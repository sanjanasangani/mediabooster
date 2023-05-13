import 'package:flutter/material.dart';
import 'package:mediabooster/views/latest.dart';
import 'package:mediabooster/views/music.dart';
import 'package:mediabooster/views/video.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Music & Video Player",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
            bottom: TabBar(
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.label,
              dividerColor: Colors.black,
              isScrollable: true,
              labelPadding: EdgeInsets.only(left: 30, right: 30),
              unselectedLabelColor: Colors.white38,
              tabs: [
                Tab(
                  child: Text(
                    "Latest",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Music",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Video",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            elevation: 0,
          ),
          body: TabBarView(
            children: [
              latest(),
              Music(),
              Video(),
            ],
          ),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
