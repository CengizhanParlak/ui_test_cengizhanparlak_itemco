import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'article_repository.g.dart';

@riverpod
Future<String?> getArticle(Ref ref, {required String url}) async {
  final response = await Client().get(Uri.parse(url));
  if (response.statusCode == 200 && response.body.isNotEmpty) {
    if (response.body == '[]') {
      return null;
    }
    return response.body;
  } else {
    return null;
  }
}
