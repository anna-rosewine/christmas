class MoodItem {
  final String title;
  final String link;
  final String assetPath;

  MoodItem({required this.title, required this.link, required this.assetPath});
}

final List<MoodItem> items = [
  MoodItem(title: 'Свічки', link: "", assetPath: "assets/images/candles.png"),
  MoodItem(title: 'Фільм', link: "", assetPath: "assets/images/film.png"),
  MoodItem(title: 'Гірлянда', link: "", assetPath: "assets/images/girl.png"),
];
