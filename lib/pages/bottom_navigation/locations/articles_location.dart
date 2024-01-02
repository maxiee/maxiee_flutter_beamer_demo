import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:maxiee_flutter_beamer_demo/pages/bottom_navigation/data/articles.dart';
import 'package:maxiee_flutter_beamer_demo/pages/bottom_navigation/screens/article_detail_screen.dart';
import 'package:maxiee_flutter_beamer_demo/pages/bottom_navigation/screens/articles_screen.dart';

class ArticlesLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['/articles/:articleId'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: ValueKey('articles'),
          title: 'Articles',
          type: BeamPageType.noTransition,
          child: ArticlesScreen(),
        ),
        if (state.pathParameters.containsKey('articleId'))
          BeamPage(
            key: ValueKey('articles-${state.pathParameters['articleId']}'),
            title: articles.firstWhere((article) =>
                article['id'] == state.pathParameters['articleId'])['title'],
            child: ArticleDetailsScreen(
              article: articles.firstWhere((article) =>
                  article['id'] == state.pathParameters['articleId']),
            ),
          ),
      ];
}
