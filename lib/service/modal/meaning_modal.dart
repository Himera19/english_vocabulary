import 'package:english_vocabulary/service/modal/word_definition_modal.dart';

class MeaningModal {
  final String partOfSpeech;
  final List<WordDefinitionModal> wordDefinitionModal;

  MeaningModal({required this.wordDefinitionModal, required this.partOfSpeech});

  factory MeaningModal.fromJson({required Map<String, dynamic> json}) {
    return MeaningModal(
        wordDefinitionModal: WordDefinitionModal.fromJsonList(
            jsonList: json['definitions'] ?? []),
        partOfSpeech: json['partOfSpeech'] ?? '-');
  }

  Map<String, dynamic> toJson() {
    return {
      'partOfSpeech': partOfSpeech,
      'definitions': wordDefinitionModal
          .map((WordDefinitionModal wordDefinitionModal) =>
              wordDefinitionModal.toJson())
          .toList()
    };
  }

  static List<MeaningModal> fromJsonList({required List<dynamic> jsonList}) {
    return jsonList.map((dynamic json) {
      try {
        return MeaningModal.fromJson(json: json as Map<String, dynamic>);
      } catch (e) {
        throw Exception('Failed to parse Json on WordPartOfSpeechModal: $e');
      }
    }).toList();
  }
}
