import '../data/models.dart';


class TriggerPodcastLikeAction {
  final PodcastModel updatedPodcast;

  TriggerPodcastLikeAction(this.updatedPodcast);
}

class UpdateSearchedText {
  final String searchedText;

  UpdateSearchedText(this.searchedText);
}

class UpdateDisplayedPodcasts {
  final List<PodcastModel> displayedPodcast;

  UpdateDisplayedPodcasts(this.displayedPodcast);
}

class UpdateNavBarIndexAction {
  final int updatedNavBarIndex;

  UpdateNavBarIndexAction(this.updatedNavBarIndex);
}