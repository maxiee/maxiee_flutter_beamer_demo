import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:maxiee_flutter_beamer_demo/pages/bottom_navigation/data/books.dart';
import 'package:maxiee_flutter_beamer_demo/pages/bottom_navigation/screens/book_detail_screen.dart';
import 'package:maxiee_flutter_beamer_demo/pages/bottom_navigation/screens/books_screen.dart';

class BooksLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['/books/:bookId'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: ValueKey('books'),
          title: 'Books',
          type: BeamPageType.noTransition,
          child: BooksScreen(),
        ),
        if (state.pathParameters.containsKey('bookId'))
          BeamPage(
            key: ValueKey('book-${state.pathParameters['bookId']}'),
            title: books.firstWhere((book) =>
                book['id'] == state.pathParameters['bookId'])['title'],
            child: BookDetailsScreen(
              book: books.firstWhere(
                  (book) => book['id'] == state.pathParameters['bookId']),
            ),
          ),
      ];
}
