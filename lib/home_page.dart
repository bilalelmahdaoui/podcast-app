import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:imt_podcast_app/redux/actions.dart';
import 'package:imt_podcast_app/redux/app_state.dart';
import './podcast.dart';
import './ui/AppLogo.dart';
import './ui/AppStyles.dart';
import './data/models.dart';


class HomePage extends StatelessWidget {
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
              //SizedBox(height: 20),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)
                  ),
                  gradient: LinearGradient(
                    colors: [AppStyles.primaryColor, AppStyles.primaryColorDark],
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(margin: EdgeInsets.only(top:30), child: AppLogo()),
                    Container(
                      height: 40,
                      child: TextField(
                        autofocus: true,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 18  ),
                            filled: true,
                            fillColor: AppStyles.primaryColorDark,
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)), borderSide: BorderSide.none,),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)), borderSide: BorderSide.none,),
                            hintText: 'Search...',
                            hintStyle: TextStyle(color: Colors.white, fontSize: 14),

                            // Search Icon
                            suffixIcon: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              padding: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                  color: AppStyles.secondaryColor,
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              child: IconButton(
                                icon: Icon(Icons.search, size: 20),
                                color: AppStyles.tertiaryColor,
                              ),)
                        ),
                        onChanged: (text) {
                          StoreProvider.of<AppState>(context).dispatch(UpdateSearchedText(text));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              StoreConnector<AppState, String>(
                converter: (store) => store.state.searchedText,
                builder: (context, searchedTextState) => Text(
                    searchedTextState == "" ? "All Podcasts" : "Search Results :",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: AppStyles.tertiaryColor),
                  ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 450,
                child: PodcastsListWidget(),
              ),
            ]),
      ),
    );
  }
}



class PodcastsListWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<PodcastModel>>(
      converter: (store) => store.state.searchedText == "" ? store.state.podcastsList : store.state.podcastsList.where((aPodcast) {
        var doesContain = false;
        //print("---------------\nnew array");
        store.state.searchedText.toLowerCase().split(" ").where((element) => element != "")
            .forEach((word) {
              if(aPodcast.name.toLowerCase().contains(word)) {
                //print("word : " + word);
                doesContain = true;
                return true;
                }
            }
          );
          //print("---------------");
          return doesContain;
        }
      ).toList(),
      builder: (context, statePodcasts) => ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => PodcastWidget(new PodcastModel(
              statePodcasts[index].id,
              statePodcasts[index].name,
              statePodcasts[index].episodes,
              statePodcasts[index].img,
              statePodcasts[index].liked
        )),
        itemCount: statePodcasts.length,
      ),
    );
  }
}



class PodcastWidget extends StatelessWidget /*StatelessWidget*/ {

  PodcastModel podcastModel;

  PodcastWidget(this.podcastModel);

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Podcast(podcast: podcastModel)));
              },
              child: Row (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(podcastModel.img, width: 65, height: 65),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            podcastModel.name,
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            podcastModel.episodes.length.toString() + " Episodes",
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                        child : podcastModel.liked ? Icon(Icons.favorite_rounded, color: AppStyles.secondaryColor) : Icon(Icons.favorite_border_rounded, color: AppStyles.tertiaryColor),
                        onTap: (){
                          StoreProvider.of<AppState>(context).dispatch(TriggerPodcastLikeAction(podcastModel));
                          //print('Like trigerred!');
                        },
                      )
                  ),
                ],
              )
          ),
            Divider(height: 30, indent: 0, endIndent: 0, color: Colors.grey, thickness: 0.2,),
          ]
    );
  }
}