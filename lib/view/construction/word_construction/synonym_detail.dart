import 'package:flutter/material.dart';
import 'package:english_vocabulary/service/modal/synonym_modal.dart';
import 'package:english_vocabulary/service/provider/synonym_provider.dart';
import 'package:english_vocabulary/view/widget/synonym_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SynonymDetail extends StatelessWidget {
  const SynonymDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 15.0.h),
            child: Text(
              'Synonym',
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
            ),
          ),
          _buildSynonymWords()
        ],
      ),
    );
  }

  Widget _buildSynonymWords() {
    return Consumer<SynonymProvider>(
      builder: (BuildContext context, SynonymProvider detailProvider,
          Widget? child) {
        if (detailProvider.synonymWordList.isEmpty) {
          return Text(
            'Synonym word not found!',
            style: TextStyle(
                fontSize: 15.sp,
                fontStyle: FontStyle.italic,
                color: Colors.red),
          );
        } else {
          return Wrap(
            spacing: 8,
            runSpacing: 10,
            children: detailProvider.synonymWordList
                .map<Widget>((SynonymModal synonymModal) {
              return SynonymItem(content: synonymModal.word);
            }).toList(),
          );
        }
      },
    );
  }
}
