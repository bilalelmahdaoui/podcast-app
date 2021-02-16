import 'package:flutter/material.dart';
import './ui/AppStyles.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Episode extends StatefulWidget {

  var episodeNumber;
  var podcast;

  Episode({this.episodeNumber, this.podcast});

  @override
  _EpisodeState createState() => _EpisodeState();
}

class _EpisodeState extends State<Episode> {

  double _value = 50.0;

  double get value => _value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(25, 50, 25, 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                   /* Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage()));*/
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppStyles.primaryColorSuperLight, AppStyles.primaryColorLight],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.arrow_back_ios,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 20),
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 30,
                    ),
                  ],
                ),
                child: Image.asset(widget.podcast.img),
              ),
              Text(
                widget.podcast.name,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                "Episode " + widget.episodeNumber.toString() + " - " + widget.podcast.episodes[widget.episodeNumber-1].title,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppStyles.primaryColorSuperLight,
                      ),
                      child: Icon(
                        Icons.download_rounded,
                        color: AppStyles.primaryColorSemiLight
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppStyles.primaryColorSuperLight,
                      ),
                      child: Icon(
                        Icons.ios_share,
                          color: AppStyles.primaryColorSemiLight
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    durationToString(((widget.podcast.episodes[widget.episodeNumber-1].minutes*60*value)/100).toInt()),
                    style: TextStyle(color: Color(0xff838DA7)),
                  ),
                  Expanded(
                    child: SfSlider(
                      min: 0.0,
                      max: 100.0,
                      value: _value,
                      inactiveColor: Color(0xffD4D9E8),
                      activeColor: AppStyles.primaryColor,
                      thumbIcon: Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 7.5,
                        ),
                      ),
                      onChanged: (dynamic value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                  ),
                  Text(
                    durationToString(widget.podcast.episodes[widget.episodeNumber-1].minutes*60),
                    style: TextStyle(color: Color(0xff838DA7)),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("images/back.png"),
                  Container(
                    width: 70,
                    height: 70,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            color: AppStyles.primaryColor.withOpacity(0.5),
                            blurRadius: 20,
                          )
                        ],
                        color: AppStyles.primaryColor,
                        borderRadius: BorderRadius.circular(60)),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  Image.asset("images/next.png"),
                ],
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 20, bottom: 30),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppStyles.primaryColorSuperLight, AppStyles.primaryColorLight],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(35))),
          child: Column(
            children: [
              Container(
                width: 100,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.playlist_play_outlined, color: Colors.white,),
                  SizedBox(width: 5),
                  Text(
                    "Next Episode",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
              SizedBox(height: 80)
            ],
          ),
        )
      ],
    ),
      ),
    );
  }

  String durationToString(int s) {
    Duration duration = Duration(seconds: s);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
