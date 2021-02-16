import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:imt_podcast_app/redux/actions.dart';
import 'package:imt_podcast_app/redux/app_state.dart';
import 'package:imt_podcast_app/redux/reducer.dart';
import './home_page.dart';
import './favorite.dart';
import './data/api.dart';
import './about.dart';
import 'package:redux/redux.dart';
import 'package:uuid/uuid.dart';


import './ui/CustomNavigationBar.dart';
import './data/api.dart';

void main() {
  runApp(MyApp());
}

final uuid = Uuid();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final tabs = [
    HomePage(),
    FavoritePodcasts(),
    About(),
  ];


  final Store<AppState> _store = Store<AppState>(
    UIReducer,
    initialState: AppState(
        podcastsList : Api.podcastsList,
        bottomNavIndex: 0,
        searchedText : "",
    )
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: _store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StoreConnector<AppState, int>(
            converter: (store) => store.state.bottomNavIndex,
            builder: (context, navBarState) => Scaffold(
              body: tabs[navBarState],
              bottomNavigationBar: CustomBottomNavigationBar(
                currentIndex: navBarState,
                children: [
                  CustomBottomNavigationItem(
                    icon: Icons.home,
                    label: 'Home',
                  ),
                  CustomBottomNavigationItem(
                    icon: Icons.favorite_outline_rounded,
                    label: 'Favorite',
                  ),
                  CustomBottomNavigationItem(
                    icon: Icons.info_outline_rounded,
                    label: 'About',
                  ),
                ],
                onChange: (index) {
                  StoreProvider.of<AppState>(context).dispatch(UpdateNavBarIndexAction(index));
                  print("index = " + index.toString());
                  print("state index = " + navBarState.toString());
                },
              ),
            )
        )
        ),
    );
  }
}
