import 'package:english_vocabulary/service/modal/word_definition_modal.dart';
import 'package:flutter/material.dart';
import 'package:english_vocabulary/service/modal/meaning_modal.dart';
import 'package:english_vocabulary/service/provider/synonym_provider.dart';
import 'package:english_vocabulary/service/provider/word_provider.dart';
import 'package:english_vocabulary/view/widget/word_detail_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../service/modal/word_modal.dart';

class WordDetail extends StatelessWidget {
  const WordDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final WordProvider wordProvider = context.read<WordProvider>();
    final WordModal searchedWordMeanings = wordProvider.wordDetails.isNotEmpty
        ? wordProvider.wordDetails[0]
        : WordModal(word: '-', phonetic: '-', meanings: []);

    return Consumer<SynonymProvider>(
      builder: (BuildContext context, SynonymProvider synonymProvider,
          Widget? child) {
        final List<MeaningModal> meaningsTitle =
            synonymProvider.filteredMeaningsList.isEmpty
                ? searchedWordMeanings.meanings
                : searchedWordMeanings.meanings
                    .where((MeaningModal meaningModal) => synonymProvider
                        .filteredMeaningsList
                        .contains(meaningModal.partOfSpeech))
                    .toList();
        return _buildWordDetailList(meanings: meaningsTitle);
      },
    );
  }

  Widget _buildWordDetailList({required List<MeaningModal> meanings}) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: meanings.length,
        itemBuilder: (BuildContext context, int index) {
          final String partOfSpeech = meanings[index].partOfSpeech;
          final List<WordDefinitionModal> definitions =
              meanings[index].wordDefinitionModal;
          int counter = 1;

          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.0.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...definitions.map((WordDefinitionModal wordDefinitionModal) {
                  final String definitionText = wordDefinitionModal.definition;
                  final String exampleText = wordDefinitionModal.example;
                  final int currentCounter = counter++;
                  return WordDetailItem(
                      counter: currentCounter,
                      partOfSpeech: partOfSpeech,
                      definitionText: definitionText,
                      exampleText: exampleText);
                }),
              ],
            ),
          );
        });
  }
}
