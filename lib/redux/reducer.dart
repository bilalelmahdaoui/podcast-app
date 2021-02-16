import '../data/api.dart';
import './actions.dart';
import './app_state.dart';


AppState UIReducer(AppState state, dynamic action) {

  if (action is TriggerPodcastLikeAction) {
    action.updatedPodcast.liked = !action.updatedPodcast.liked;
    return AppState(
        podcastsList: state.podcastsList
            .map((aPodcast) => aPodcast.id == action.updatedPodcast.id
            ? action.updatedPodcast
            : aPodcast)
            .toList(),
        bottomNavIndex : state.bottomNavIndex
    );
  }

  if (action is UpdateNavBarIndexAction) {
    int updatedNavBarIndex = action.updatedNavBarIndex;
    return AppState(
        podcastsList: state.podcastsList,
        bottomNavIndex : updatedNavBarIndex
    );
  }

  if (action is UpdateSearchedText) {
    //print("searched text = " + action.searchedText.toString());
    return AppState(
      searchedText: action.searchedText,
      podcastsList: state.podcastsList,
      bottomNavIndex : state.bottomNavIndex,
    );
  }
  return state;
}