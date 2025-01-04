import 'package:flutter/material.dart';
import 'package:english_vocabulary/view/widget/search_list_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../service/provider/word_provider.dart';

class SearchHistory extends StatelessWidget {
  const SearchHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(10.0.r),
          child: Text(
            'Recent search',
            style: TextStyle(
                fontSize: 20.sp,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.bold),
          ),
        ),
        _buildHistoryList()
      ],
    );
  }

  Widget _buildHistoryList() {
    return Expanded(
      child: Consumer(
        builder:
            (BuildContext context, WordProvider searchProvider, Widget? child) {
          return ListView.builder(
              itemCount: searchProvider.lastSearchedWords.length,
              itemBuilder: (BuildContext context, int index) {
                return SearchListItem(
                    key: ValueKey(searchProvider.lastSearchedWords[index]),
                    searchedWord: searchProvider.lastSearchedWords[index]);
              });
        },
      ),
    );
  }
}
