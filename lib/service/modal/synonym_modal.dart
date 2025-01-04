class SynonymModal {
  final String word;
  final int score;

  SynonymModal({required this.word, required this.score});

  factory SynonymModal.fromJson({required Map<String, dynamic> json}) {
    return SynonymModal(word: json['word'] ?? '-', score: json['score'] ?? 0);
  }

  static List<SynonymModal> fromJsonList({required List<dynamic> jsonList}) {
    return jsonList.map((dynamic json) {
      try {
        return SynonymModal.fromJson(json: json as Map<String, dynamic>);
      } catch (e) {
        throw Exception('Failed to parse Json on SynonymModal: $e');
      }
    }).toList();
  }
}
