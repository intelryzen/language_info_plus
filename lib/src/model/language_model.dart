class Language {
  /// ISO 639-1 language code (e.g., "ko" for Korean, "en" for English).
  final String code;

  /// Localized name of the language (if available, e.g., "한국어").
  /// Must be initialized explicitly; it is nullable.
  final String? localizedName;

  /// English name of the language (e.g., "Korean", "English").
  final String name;

  const Language({
    required this.code,
    required this.name,
    this.localizedName,
  });

  factory Language.fromMap(Map<String, dynamic> map, {String? localizedName}) {
    return Language(
      code: map['code'],
      name: map['name'],
      localizedName: localizedName,
    );
  }

  @override
  String toString() {
    return '''
Language {
  code: $code,
  name: $name,
  localizedName: $localizedName
}
''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Language) return false;
    return code == other.code;
  }

  @override
  int get hashCode => code.hashCode;
}
