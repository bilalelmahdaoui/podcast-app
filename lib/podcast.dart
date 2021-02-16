import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './episode.dart';
import './ui/AppStyles.dart';
import './data/models.dart';

class Podcast extends StatelessWidget {

  PodcastModel podcast;
  Podcast({this.podcast});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)
                  ),
                  gradient: LinearGradient(
                    colors: [AppStyles.primaryColorLight, AppStyles.primaryColorSuperLight],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff676B76).withOpacity(0.7),
                      blurRadius: 40,
                      offset: Offset(0, 10),
                      spreadRadius: -15,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 8),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.white, AppStyles.primaryColorSuperLight],
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.arrow_back_ios,
                              color: AppStyles.primaryColorLight),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                    children: [
                      Container(child: Image.asset(podcast.img, width: 120,)),
                      SizedBox(width: 20),
                      Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(podcast.name, style: AppStyles.BigTitle),
                              SizedBox(height: 10),
                              SizedBox(
                                width: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(podcast.liked ? Icons.favorite_rounded : Icons.favorite_border_rounded),
                                    SizedBox(width: 10),
                                    Icon(Icons.cloud_download_outlined),
                                    SizedBox(width: 10),
                                    Icon(Icons.ios_share),
                                  ],
                                ),
                              ),
                            ],
                          )
                      )
                    ],
                  ),]
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Episodes", style: AppStyles.MediumTitle
              ),
              SizedBox(height: 30),
              SizedBox(
                  height: 530,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => EpisodeWidget(
                        context,
                        index+1,
                        podcast.episodes[index].title,
                        podcast.episodes[index].minutes.toString() + "m",
                    ),
                    itemCount: podcast.episodes.length,
                  ),
              ),
            ]),
      ),
    );
  }

  Widget EpisodeWidget(BuildContext context, int episodeNumber, String episodeTitle, String episodeLength) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Episode(episodeNumber: episodeNumber, podcast: podcast,)));
      },
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: .2, color: Colors.grey), // TODO
            )),
        padding: EdgeInsets.only(bottom: 20),
        margin: EdgeInsets.only(bottom: 20),
        //color: Colors.red;
        child: Row(mainAxisSize: MainAxisSize.max, children: [
          Text("Ep " + episodeNumber.toString(), style: TextStyle(fontSize: 20),),
          Expanded(child: Container(margin: EdgeInsets.only(left: 30, right: 20), child: Text(episodeTitle, style: TextStyle(fontSize: 20),))),
          Text(episodeLength, style: TextStyle(fontSize: 15, color: Colors.grey),),
        ]),
      ),
    );
  }

}

class PodcastWidget extends StatelessWidget {
  const PodcastWidget({
    Key key,
    this.img,
    this.podcastName,
    this.podcastDescription,
    this.color,
    this.icon,
  }) : super(key: key);

  final String img;
  final String podcastName;
  final String podcastDescription;
  final Color color;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Podcast()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                //Image.asset(img),
                Image.asset(img, width: 65, height: 65),
                //Image(image: Image.asset(img), width: 70, height: 70),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      podcastName,
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      podcastDescription,
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: icon,
            ),
          ],
        )
    );
  }
}
