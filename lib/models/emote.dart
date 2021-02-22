import 'package:bttvstickers/constants.dart';

class Emote {
  final String id;
  final String code;
  final String imageType;
  final String imageUrl;

  Emote({this.id, this.code, this.imageType, this.imageUrl});

  factory Emote.fromJson(Map<String, dynamic> json) {
    return Emote(
      id: json['id'],
      code: json['code'],
      imageType: json['imageType'],
      imageUrl: "$kEmoteCdnUrl/${json['id']}/3x",
    );
  }
}
