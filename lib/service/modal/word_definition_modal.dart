class WordDefinitionModal {
  final String definition;
  final String example;

  WordDefinitionModal({required this.definition, required this.example});

  factory WordDefinitionModal.fromJson({required Map<String, dynamic> json}) {
    return WordDefinitionModal(
        definition: json['definition'] ?? '-', example: json['example'] ?? '-');
  }

  Map<String,dynamic> toJson(){
    return {
      'definition':definition,
      'example':example
    };
  }

  static List<WordDefinitionModal> fromJsonList(
      {required List<dynamic> jsonList}) {
    return jsonList.map((dynamic json) {
      try {
        return WordDefinitionModal.fromJson(json: json as Map<String, dynamic>);
      } catch (e) {
        throw Exception('Failed to Parse Json on WordDefinitionModal: $e');
      }
    }).toList();
  }
}
