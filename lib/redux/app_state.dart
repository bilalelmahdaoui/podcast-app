import '../data/models.dart';

class AppState {

  List<PodcastModel> podcastsList;
  String searchedText;
  String homeState;
  int bottomNavIndex;

  AppState({this.podcastsList = const [], this.bottomNavIndex = 0, this.searchedText = ""});
}