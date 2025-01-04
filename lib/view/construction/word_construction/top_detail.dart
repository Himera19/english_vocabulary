import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:english_vocabulary/service/modal/word_modal.dart';
import 'package:english_vocabulary/service/modal/meaning_modal.dart';
import 'package:english_vocabulary/service/provider/synonym_provider.dart';
import 'package:english_vocabulary/service/provider/word_provider.dart';
import 'package:english_vocabulary/view/widget/word_meanings_item.dart';
import 'package:provider/provider.dart';

class TopDetail extends StatelessWidget {
  const TopDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final WordProvider detailProvider = context.read<WordProvider>();
    final WordModal searchedWord = detailProvider.wordDetails.isNotEmpty
        ? detailProvider.wordDetails[0]
        : WordModal(word: '-', phonetic: '-', meanings: []);

    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.grey.shade200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWordHeader(context, searchedWord.word),
          _buildPhoneticText(searchedWord.phonetic),
          _buildMeaningsList(searchedWord.meanings),
        ],
      ),
    );
  }

  Widget _buildWordHeader(BuildContext context, String word) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            word,
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: () {
              Fluttertoast.showToast(msg: 'Pronounce button');
            },
            icon: Image.asset('assets/group.png'),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneticText(String phonetic) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0.w),
      child: Text(
        phonetic,
        style: TextStyle(fontSize: 20.sp, fontStyle: FontStyle.italic),
      ),
    );
  }

  Widget _buildMeaningsList(List<MeaningModal> meanings) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Consumer<SynonymProvider>(
        builder: (BuildContext context, SynonymProvider detailProvider,
            Widget? child) {
          final bool hasFilteredMeanings =
              detailProvider.filteredMeaningsList.isNotEmpty;
          final List<Widget> meaningsItems = [
            if (hasFilteredMeanings) const DetailMeaningsItem(isCleaner: true),
            ...meanings.map((MeaningModal meanings) =>
                DetailMeaningsItem(content: meanings.partOfSpeech)),
          ];

          return Padding(
            padding: EdgeInsets.only(bottom: 5.0.h),
            child: Row(children: meaningsItems),
          );
        },
      ),
    );
  }
}
