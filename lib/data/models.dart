class EpisodeModel {
  String _id;
  String _title;
  int _minutes;
  EpisodeModel(this._id, this._title, this._minutes);

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  int get minutes => _minutes;

  set minutes(int value) {
    _minutes = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }
}

class PodcastModel {
  String _id;
  String _name;
  var _episodes;
  String _img;
  bool _liked;

  PodcastModel(this._id, this._name, this._episodes, this._img, this._liked);

  bool get liked => _liked;

  set liked(bool value) {
    _liked = value;
  }

  String get img => _img;

  set img(String value) {
    _img = value;
  }

  get id => _id;

  set id(value) {
    _id = value;
  }

  get episodes => _episodes;

  set episodes(value) {
    _episodes = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}