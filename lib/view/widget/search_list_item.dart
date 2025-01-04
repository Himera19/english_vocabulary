import 'package:flutter/material.dart';
import 'package:english_vocabulary/service/provider/synonym_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../service/provider/word_provider.dart';
import '../../service/repository/word_repository.dart';
import '../../service/repository/synonym_repository.dart';

class SearchListItem extends StatelessWidget {
  final String searchedWord;
  const SearchListItem({super.key, required this.searchedWord});

  @override
  Widget build(BuildContext context) {
    WordProvider searchProvider = context.read<WordProvider>();
    SynonymProvider detailProvider = context.read<SynonymProvider>();

    return GestureDetector(
      onTap: () {
        WordRepository.fetchWordDetails(
            searchedWord: searchedWord,
            searchProvider: searchProvider,
            context: context);
        SynonymRepository.fetchSynonymDetails(
            searchedWord: searchedWord, detailProvider: detailProvider);
      },
      child: Padding(
        padding: EdgeInsets.all(10.0.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0.r),
              child: Image.asset(
                color: Colors.grey.shade900,
                width: 28.h,
                height: 28.h,
                fit: BoxFit.contain,
                'assets/search.png',
              ),
            ),
            Expanded(
              child: Text(
                searchedWord,
                style: TextStyle(fontSize: 20.sp),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0.r),
              child: Image.asset(
                'assets/arrow.png',
                color: Colors.grey.shade900,
                width: 28.h,
                height: 28.h,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
