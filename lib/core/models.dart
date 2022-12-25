class MoodItem {
  final String title;
  final String link;
  final String assetPath;
  final String btnText;

  MoodItem(
      {required this.title,
      required this.btnText,
      required this.link,
      required this.assetPath});
}

final List<MoodItem> items = [
  MoodItem(
      title: 'Свічки',
      link: "",
      assetPath: "assets/images/candles.png",
      btnText: 'Замовити'),
  MoodItem(
      title: 'Фільм',
      link: "",
      assetPath: "assets/images/film.png",
      btnText: 'Дивитись'),
  MoodItem(
      title: 'Гірлянда',
      link: "",
      assetPath: "assets/images/girl.png",
      btnText: 'Замовити'),
];
