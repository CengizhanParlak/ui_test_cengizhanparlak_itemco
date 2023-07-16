import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_test_cengizhanparlak/app/model/article_model.dart';

final mostPopularServiceProvider =
    ChangeNotifierProvider<MostPopularService>((ref) {
  return MostPopularService();
});

class MostPopularService extends ChangeNotifier {
  final List<Article> articles = [];
  final List<Article> filteredArticles = [];

  Article? article;

  TextEditingController nameController = TextEditingController();

  bool get isTextEmpty => nameController.text.isEmpty;

  String get query => nameController.text;

  void filter() {
    filteredArticles.clear();
    if (nameController.text.isEmpty) {
      disableFilter();
      return;
    }
    // filteredArticles.addAll(
    //   articles.where((user) {
    //     return user.name
    //             .toLowerCase()
    //             .contains(nameController.text.toLowerCase()) ||
    //         user.company.catchPhrase
    //             .toLowerCase()
    //             .contains(nameController.text.toLowerCase());
    //   }),
    // );
    notifyListeners();
  }

  void disableFilter() {
    filteredArticles.clear();
    notifyListeners();
  }

  void clearText() {
    nameController.clear();
    disableFilter();
  }
}
