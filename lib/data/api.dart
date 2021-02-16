import 'package:uuid/uuid.dart';
import 'models.dart';

final uuid = Uuid();

 class Api  {
  static List<PodcastModel> podcastsList = [
    new PodcastModel(
      uuid.v4(),
      "HelloWorld Podcast",
    [
    new EpisodeModel(uuid.v4(), "Introduction", 7),
    new EpisodeModel(uuid.v4(), "Helloworld", 58),
    new EpisodeModel(uuid.v4(), "Hi world", 34),
    new EpisodeModel(uuid.v4(), "Sup world", 41),
    ],
    "images/img0.png",
    false),
    new PodcastModel(
    uuid.v4(),
    "bilaldesignfirm",
    [
    new EpisodeModel(uuid.v4(), "Introduction", 12),
    new EpisodeModel(uuid.v4(), "What does a Designer ?", 68),
    new EpisodeModel(uuid.v4(), "UI/UX design", 28),
    new EpisodeModel(uuid.v4(), "Freelance as a Designer", 98),
    ],
    "images/img4.png",
    true),
    new PodcastModel(
    uuid.v4(),
    "AIAC IT Podcast",
    [
    new EpisodeModel(uuid.v4(), "Introduction", 11),
    new EpisodeModel(uuid.v4(), "Artificial Intelligence", 128),
    new EpisodeModel(uuid.v4(), "Machine Learning", 108),
    ],
    "images/img3.png",
    false),
    new PodcastModel(
    uuid.v4(),
    "The Moroccan Podcast",
    [
    new EpisodeModel(uuid.v4(), "Introduction", 4),
    new EpisodeModel(uuid.v4(), "Who are we ?", 79),
    new EpisodeModel(uuid.v4(), "Get to know Moroccan people", 68),
    ],
    "images/img5.png",
    false),
    new PodcastModel(
      uuid.v4(),
      "The Nike Podcast",
      [
      new EpisodeModel(uuid.v4(), "Introduction", 5),
      new EpisodeModel(uuid.v4(), "Importance of working out", 35),
      new EpisodeModel(uuid.v4(), "Impact of workout on Health", 123),
      new EpisodeModel(uuid.v4(), "Diet programs 3", 98),
      ],
      "images/img6.png",
      true),
    new PodcastModel(
        uuid.v4(),
        "TechStuff",
        [
          new EpisodeModel(uuid.v4(), "Introduction", 8),
          new EpisodeModel(uuid.v4(), "How Medieval Warfare Led to the Lawnmower", 45),
          new EpisodeModel(uuid.v4(), "Chased by Pee-wee Herman", 43),
          new EpisodeModel(uuid.v4(), "How Medieval Warfare Led to the Lawnmower", 87),
        ],
        "images/img8.png",
        true),
  ];
}