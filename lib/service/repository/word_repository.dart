import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:english_vocabulary/page/detail_screen.dart';
import 'package:english_vocabulary/service/modal/word_modal.dart';
import 'package:http/http.dart';
import '../provider/word_provider.dart';

class WordRepository {
  static Future<void> fetchWordDetails({
    required BuildContext context,
    required String searchedWord,
    required WordProvider searchProvider,
  }) async {
    try {
      final Response response = await http.get(
        Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$searchedWord'),
      );

      if (response.statusCode == 200) {
        // Parse the JSON response
        List<dynamic> searchedWordDetails = jsonDecode(response.body);

        // Convert the first result to WordModal
        if (searchedWordDetails.isNotEmpty) {
          WordModal wordModal = WordModal.fromJson(
            json: searchedWordDetails[0] as Map<String, dynamic>,
          );

          // Update the provider with the converted WordModal
          searchProvider.setWordDetails([wordModal]);
          searchProvider.setLastSearchedWords(word: searchedWord);

          // Navigate to detail screen if context is still valid
          if (context.mounted) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const DetailScreen(),
              ),
            );
          }
        } else {
          throw Exception('No results found');
        }
      } else {
        // Handle API error response
        final dynamic errorBody = jsonDecode(response.body);
        final dynamic errorMessage = errorBody['message'] ?? 'Search a valid word!';
        searchProvider.clearWordResults();
        Fluttertoast.showToast(msg: errorMessage);
      }
    } catch (e) {
      // Handle any errors during the process
      searchProvider.clearWordResults();
      Fluttertoast.showToast(msg: 'Search a valid word!');
      debugPrint('Error in Word Repository: $e');
    }
  }
}