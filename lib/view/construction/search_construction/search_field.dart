import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  final TextEditingController searchedText;
  const SearchField({super.key, required this.searchedText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0.r),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        controller: searchedText,
        decoration: InputDecoration(
            hintText: 'Search',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.r))),
            prefixIcon: Image.asset(
              'assets/search.png',
              color: Colors.grey.shade900,
            )),
      ),
    );
  }
}
