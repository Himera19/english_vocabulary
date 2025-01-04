import 'package:english_vocabulary/service/modal/meaning_modal.dart';

class WordModal {
  final String word;
  final String phonetic;
  final List<MeaningModal> meanings;
  WordModal({
    required this.word,
    required this.phonetic,
    required this.meanings,
  });

  factory WordModal.fromJson({required Map<String, dynamic> json}) {
    return WordModal(
        word: json['word'] ?? '',
        phonetic: json['phonetic'] ?? '',
        meanings: MeaningModal.fromJsonList(jsonList: json['meanings']));
  }

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'phonetic': phonetic,
      'meanings': meanings
          .map((MeaningModal meaningModal) => meaningModal.toJson())
          .toList()
    };
  }
}
