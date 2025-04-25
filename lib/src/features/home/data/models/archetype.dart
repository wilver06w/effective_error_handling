class Archetype {
  Archetype({
    this.archetypeName = '',
  });

  factory Archetype.fromJson(Map<String, dynamic> json) => Archetype(
        archetypeName: json['archetype_name'] as String? ?? '',
      );

  String archetypeName;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'archetype_name': archetypeName,
      };
}
