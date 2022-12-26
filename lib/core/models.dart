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
      link: "https://instagram.com/mrs.candles_ua?igshid=MWI4MTIyMDE=",
      assetPath: "assets/images/candles.png",
      btnText: 'Замовити'),
  MoodItem(
      title: 'Фільм',
      link:
          "https://kinotron.top/4694-garri-potter-20-rokiv-po-tomu-povernenya-do-hogvortsu.html",
      assetPath: "assets/images/film.png",
      btnText: 'Дивитись'),
  MoodItem(
      title: 'Гірлянда',
      link: "https://instagram.com/girliandy?igshid=MWI4MTIyMDE=",
      assetPath: "assets/images/girl.png",
      btnText: 'Замовити'),
];

enum MoodCartState { isOpen, isClosed }
