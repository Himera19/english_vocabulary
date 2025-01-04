import 'package:flutter/material.dart';
import 'package:english_vocabulary/service/provider/synonym_provider.dart';
import 'package:english_vocabulary/view/construction/common_skeleton.dart';
import 'package:provider/provider.dart';

import '../view/construction/word_construction/synonym_detail.dart';
import '../view/construction/word_construction/top_detail.dart';
import '../view/construction/word_construction/word_detail.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SynonymProvider synonymProvider = context.read<SynonymProvider>();
    return CommonSkeleton(
        body: PopScope(
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        synonymProvider.clearFilterMeanings();
        synonymProvider.cleanSynonymWords();
      },
      child: ListView(
        children: const [TopDetail(), WordDetail(), SynonymDetail()],
      ),
    ));
  }
}
