import 'package:flutter/material.dart';
import 'package:english_vocabulary/service/constants.dart';
import 'package:english_vocabulary/service/provider/synonym_provider.dart';
import 'package:provider/provider.dart';

class DetailMeaningsItem extends StatelessWidget {
  final String? content;
  final bool? isCleaner;

  const DetailMeaningsItem({super.key, this.content, this.isCleaner});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder:
          (BuildContext context, SynonymProvider detailProvider, Widget? child) {
        return TextButton(
          onPressed: () {
            isCleaner == true
                ? detailProvider.clearFilterMeanings()
                : detailProvider.setFilterMeanings(wordMeaning: content!);
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    width:
                        detailProvider.filteredMeaningsList.contains(content) ||
                                isCleaner == true
                            ? 2
                            : 1,
                    color:
                        detailProvider.filteredMeaningsList.contains(content) ||
                                isCleaner == true
                            ? Colors.blue.shade800
                            : Colors.grey),
                borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Text(
                isCleaner == true ? 'X' : capitalize(word: content ?? ''),
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
          ),
        );
      },
    );
  }
}
