import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/api_error_model.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/article_model.dart';
import 'package:ui_test_cengizhanparlak/app/repository/article_repository.dart';

final articlesServiceProvider = ChangeNotifierProvider<ArticlesService>((ref) {
  return ArticlesService(ref.read(articleRepoProvider));
});

final getArticleProvider =
    FutureProvider.family<Either<ApiError, String?>, String>((ref, url) async {
  final myChangeNotifier = ref.watch(articlesServiceProvider);
  return myChangeNotifier.getArticle(url);
});

class ArticlesService extends ChangeNotifier {
  ArticlesService(this.articleRepo);

  ArticleRepositoryImpl articleRepo;
  final List<Article> articles = [];
  final List<Article> filteredArticles = [];

  TextEditingController nameController = TextEditingController();
  SortType _sortType = SortType.DATE_DESC;

  bool get isTextEmpty => nameController.text.isEmpty;
  String get query => nameController.text;
  SortType get sortType => _sortType;

  Future<Either<ApiError, String?>> getArticle(String url) async {
    return articleRepo.getArticle(url);
  }

  void switchSort() {
    _sortType = _sortType.isAsc ? SortType.DATE_DESC : SortType.DATE_ASC;
    _sortArticles();
  }

  void addArticles(List<Article> fetchedArticles) {
    articles
      ..clear()
      ..addAll(fetchedArticles);
    filteredArticles
      ..clear()
      ..addAll(fetchedArticles);
    _sortArticles();
  }

  void _sortArticles() {
    if (filteredArticles.isEmpty) {
      return;
    }
    filteredArticles.sort((a, b) {
      if (sortType.isAsc) {
        return a.publishedDate.compareTo(b.publishedDate);
      }
      return b.publishedDate.compareTo(a.publishedDate);
    });
    notifyListeners();
  }

  void filter() {
    filteredArticles.clear();
    if (nameController.text.isEmpty) {
      _disableFilter();
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

  void _disableFilter() {
    filteredArticles.addAll(articles);
    notifyListeners();
  }

  void clearText() {
    nameController.clear();
    _disableFilter();
  }
}

enum SortType {
  DATE_ASC,
  DATE_DESC;

  bool get isAsc => this == DATE_ASC;

  bool get isDesc => this == DATE_DESC;
}
