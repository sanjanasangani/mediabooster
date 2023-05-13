import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mediabooster/views/Musicpage.dart';
import 'package:mediabooster/views/my_video_page.dart';
import '../music_utils.dart';
import 'package:carousel_slider/carousel_controller.dart';
import '../video_utils.dart';

class latest extends StatefulWidget {
  const latest({Key? key}) : super(key: key);

  @override
  State<latest> createState() => _latestState();
}

class _latestState extends State<latest> {
  CarouselController carouselController = CarouselController();
  int i=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              children: [
                Icon(Icons.library_music_outlined,
                color: Colors.white),
                SizedBox(width: 15),
                Text("Latest Music",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            CarouselSlider(carouselController: carouselController,
              options: CarouselOptions(
                  height: 200,
                  viewportFraction: 0.6,
                  enlargeCenterPage: true,
                  onPageChanged: (val,_){
                    setState(() {
                      i=val;
                    });
                  }
              ),
              items: MyMusicList.map((e) => Stack(
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(e['Image'])
                        )
                    ),
                    child: IconButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Musicpage(
                              AName: e['AName'],
                              Image: e['Image'],
                              Music: e['Music'],
                              Name: e['Mname'],
                            )));
                      },
                      icon: Icon(
                        Icons.play_circle_fill_outlined,
                        color: Colors.white.withOpacity(0.7),
                        size: 40,
                      ),
                    ),
                  ),
                ],
              )).toList(),),
            SizedBox(height: 30),
            Row(
              children: [
                Icon(Icons.video_collection_outlined,
                color: Colors.white
                ),
                SizedBox(width: 15),
                Text("Latest Video",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),),
              ],
            ),
            CarouselSlider(carouselController: carouselController,
              options: CarouselOptions(
                  height: 200,
                  viewportFraction: 0.6,
                  enlargeCenterPage: true,
                  onPageChanged: (val,_){
                    setState(() {
                      i=val;
                    });
                  }
              ),
              items: Videolist.map((e) => Stack(
                children: [
                  Container(
                    height: 250,
                    width: 330,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(e['VImage'])
                        )
                    ),
                    child: IconButton(
                      onPressed: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Video_page(
                              Name: e['Vname'],
                              video: e['Video'],
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.play_circle_fill_outlined,
                        color: Colors.white.withOpacity(0.7),
                        size: 40,
                      ),
                    ),
                  ),
                ],
              )).toList(),),
          ],
        ),
      ),
          backgroundColor: Colors.black,
    );
  }
}
