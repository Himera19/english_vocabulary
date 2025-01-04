import 'package:flutter/material.dart';
import 'package:english_vocabulary/service/provider/synonym_provider.dart';
import 'package:english_vocabulary/service/provider/word_provider.dart';
import 'package:english_vocabulary/service/repository/word_repository.dart';
import 'package:english_vocabulary/service/repository/synonym_repository.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchButton extends StatelessWidget {
  final TextEditingController searchedWord;
  const SearchButton({
    super.key,
    required this.searchedWord,
  });

  @override
  Widget build(BuildContext context) {
    WordProvider searchProvider = context.read<WordProvider>();
    SynonymProvider detailProvider = context.read<SynonymProvider>();
    return GestureDetector(
      onTap: () async {
        await WordRepository.fetchWordDetails(
            searchedWord: searchedWord.text.trim(),
            searchProvider: searchProvider,
            context: context);
        await SynonymRepository.fetchSynonymDetails(
            searchedWord: searchedWord.text.trim(),
            detailProvider: detailProvider);
        searchedWord.clear();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 10,
        color: Colors.blue.shade800,
        child: Center(
          child: Text(
            'Search',
            style: TextStyle(color: Colors.white, fontSize: 28.sp),
          ),
        ),
      ),
    );
  }
}
