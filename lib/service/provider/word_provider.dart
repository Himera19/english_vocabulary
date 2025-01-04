import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:english_vocabulary/service/modal/word_modal.dart';

import '../modal/meaning_modal.dart';

class WordProvider with ChangeNotifier {
  List<WordModal> _wordDetails = [];
  List<String> _lastSearchedWords = [];

  List<WordModal> get wordDetails => _wordDetails;
  List<String> get lastSearchedWords => _lastSearchedWords;

  // Load last searched words when provider triggered on app opening
  WordProvider() {
    loadLastSearchedWords();
  }

  // Set word details of searched words
  void setWordDetails(List<WordModal> results) {
    _wordDetails = results.map((WordModal result) {
      // Create a map to store unique meanings by partOfSpeech
      Map<String, MeaningModal> uniqueMeanings = {};

      // Store only unique meanings
      for (var meaning in result.meanings) {
        String partOfSpeech = meaning.partOfSpeech;
        if (!uniqueMeanings.containsKey(partOfSpeech)) {
          uniqueMeanings[partOfSpeech] = meaning;
        }
      }

      // Create a new WordModal with filtered meanings
      return WordModal(
        word: result.word,
        phonetic: result.phonetic,
        meanings: uniqueMeanings.values.toList(),
      );
    }).toList();

    notifyListeners();
  }

  void clearWordResults() {
    _wordDetails = [];
    notifyListeners();
  }

  // Set last searched words
  void setLastSearchedWords({required String word}) {
    if (!_lastSearchedWords.contains(word)) {
      _lastSearchedWords.insert(0, word);
      if (_lastSearchedWords.length > 5) {
        _lastSearchedWords.removeLast();
      }
    }
    _saveLastSearchedWords();
    notifyListeners();
  }

  // Save last searched words
  void _saveLastSearchedWords() {
    final Box<List<String>> box = Hive.box<List<String>>('search_history');
    box.put('last_searched_words', _lastSearchedWords);
  }

  // Load last searched words
  void loadLastSearchedWords() {
    final Box<List<String>> box = Hive.box<List<String>>('search_history');
    _lastSearchedWords = box.get('last_searched_words', defaultValue: []) ?? [];
    notifyListeners();
  }
}
