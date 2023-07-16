import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/article_model.dart';

final articlesServiceProvider = ChangeNotifierProvider<ArticlesService>((ref) {
  return ArticlesService();
});

class ArticlesService extends ChangeNotifier {
  final List<Article> articles = [];
  final List<Article> filteredArticles = [];

  Article? article;

  TextEditingController nameController = TextEditingController();

  bool get isTextEmpty => nameController.text.isEmpty;

  String get query => nameController.text;

  void addArticles(List<Article> fetchedArticles) {
    articles
      ..clear()
      ..addAll(fetchedArticles);
    sortArticles();
    filter();
    notifyListeners();
  }

  void sortArticles() {
    if (articles.isEmpty) return;
    articles.sort((a, b) {
      return b.publishedDate.compareTo(a.publishedDate);
    });
    notifyListeners();
  }

  void filter() {
    filteredArticles.clear();
    if (nameController.text.isEmpty) {
      disableFilter();
      return;
    }
    filteredArticles.addAll(
      articles.where((article) {
        return article.title
                .toLowerCase()
                .contains(nameController.text.toLowerCase()) ||
            article.resultAbstract
                .toLowerCase()
                .contains(nameController.text.toLowerCase());
      }),
    );
    notifyListeners();
  }

  void disableFilter() {
    filteredArticles.addAll(articles);
    notifyListeners();
  }

  void clearText() {
    nameController.clear();
    disableFilter();
  }
}
