import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../service/constants.dart';

class WordDetailItem extends StatelessWidget {
  final int counter;
  final String partOfSpeech;
  final String definitionText;
  final String exampleText;
  const WordDetailItem(
      {super.key,
      required this.counter,
      required this.partOfSpeech,
      required this.definitionText,
      required this.exampleText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15.0.h),
          child: RichText(
            text: TextSpan(
                text: '$counter - ',
                style: TextStyle(color: Colors.black, fontSize: 25.sp),
                children: [
                  TextSpan(
                    text: capitalize(word: partOfSpeech),
                    style: TextStyle(
                        color: Colors.blue.shade800,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic),
                  ),
                ]),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0.h),
          child: Text(
            definitionText,
            style: TextStyle(color: Colors.black, fontSize: 15.sp),
          ),
        ),
        if (exampleText.isNotEmpty) ...[
          const Text(
            'Example',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0.h),
            child: Text(
              capitalize(word: exampleText),
              style: TextStyle(
                  fontSize: 16.sp,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey.shade600),
            ),
          ),
        ],
        const Divider()
      ],
    );
  }
}
