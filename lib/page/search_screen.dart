import 'package:flutter/material.dart';

import '../view/construction/common_skeleton.dart';
import '../view/construction/search_construction/search_button.dart';
import '../view/construction/search_construction/search_field.dart';
import '../view/construction/search_construction/search_history.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchedText = TextEditingController();

  @override
  void dispose() {
    searchedText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonSkeleton(
      body: Column(
        children: [
          SearchField(
            searchedText: searchedText,
          ),
          const Expanded(child: SearchHistory()),
          SearchButton(searchedWord: searchedText)
        ],
      ),
    );
  }
}
