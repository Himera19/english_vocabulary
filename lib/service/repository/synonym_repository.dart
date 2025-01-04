import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../modal/synonym_modal.dart';
import '../provider/synonym_provider.dart';

class SynonymRepository {
  // Fetch synonym words
  static Future<void> fetchSynonymDetails(
      {required String searchedWord,
      required SynonymProvider detailProvider}) async {
    try {
      // Send request to API
      final Response response = await http.get(
          Uri.parse('https://api.datamuse.com/words?rel_syn=$searchedWord'));

      // If request successful, set synonym information to provider
      if (response.statusCode == 200) {
        List<SynonymModal> synonymWordList =
            SynonymModal.fromJsonList(jsonList: jsonDecode(response.body));
        detailProvider.setSynonymWords(synonymWords: synonymWordList);
      }
      // If request unsuccessful, show information to user and clean words
      else {
        detailProvider.cleanSynonymWords();
        Fluttertoast.showToast(msg: 'Synonym word not found!');
      }
    }
    // If there is a problem, show information to user and clean words

    catch (e) {
      detailProvider.cleanSynonymWords();
      debugPrint('Error body on Synonym Repository: $e');
    }
  }
}
