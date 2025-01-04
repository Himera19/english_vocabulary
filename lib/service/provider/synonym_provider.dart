import 'package:flutter/widgets.dart';
import 'package:english_vocabulary/service/modal/synonym_modal.dart';

class SynonymProvider extends ChangeNotifier {
  List<String> _filteredMeaningsList = [];
  List<SynonymModal> _synonymWordList = [];
  List<String> get filteredMeaningsList => _filteredMeaningsList;
  List<SynonymModal> get synonymWordList => _synonymWordList;

  // Set filter meanings
  void setFilterMeanings({required String wordMeaning}) {
    if (!_filteredMeaningsList.contains(wordMeaning)) {
      _filteredMeaningsList.add(wordMeaning);
    } else {
      _filteredMeaningsList.remove(wordMeaning);
    }
    notifyListeners();
  }

  // Clear filter meanings
  void clearFilterMeanings() {
    _filteredMeaningsList = [];
    notifyListeners();
  }

  // Set top 5 scorer synonym words
  void setSynonymWords({required List<SynonymModal> synonymWords}) {
    if (synonymWords.length < 5) {
      _synonymWordList = synonymWords;
    } else {
      synonymWords.sort((SynonymModal a, SynonymModal b) => b.score.compareTo(a.score));
      _synonymWordList = synonymWords.take(5).toList();
    }
    notifyListeners();
  }

  // Clean synonym words
  void cleanSynonymWords() {
    _synonymWordList.clear();
    notifyListeners();
  }
}
