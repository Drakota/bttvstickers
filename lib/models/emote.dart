class Emote {
  final String id;
  final String code;
  final String imageType;
  final String imagePath;

  Emote({this.id, this.code, this.imageType, this.imagePath});

  factory Emote.fromJson(Map<String, dynamic> json) {
    return Emote(
      id: json['id'],
      code: json['code'],
      imageType: json['imageType'],
      imagePath: "/${json['id']}/3x",
    );
  }
}
