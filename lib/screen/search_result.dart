import 'package:flutter/material.dart';
import 'package:newspaper/widget/search_by_source.dart';
import 'package:newspaper/widget/search_by_topic.dart';

class Search extends SearchDelegate {
  @override
  String get searchFieldLabel => "topic or Source.com";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return query.toLowerCase().endsWith('.com')
        ? SearchBySource(query)
        : SearchByTopic(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
