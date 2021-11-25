import 'package:bttvstickers/constants.dart';
import 'package:bttvstickers/models/json_serializable.dart';

class Emote implements JsonSerializable {
  final String id;
  final String code;
  final String imageType;
  final String imageUrl;

  Emote({
    required this.id,
    required this.code,
    required this.imageType,
    required this.imageUrl,
  });

  factory Emote.fromJson(Map<String, dynamic> json) {
    return Emote(
      id: json['id'],
      code: json['code'],
      imageType: json['imageType'],
      imageUrl: "$kEmoteCdnUrl/${json['id']}/3x.${json['imageType']}",
    );
  }

  @override
  toJson() {
    return {
      'id': id,
      'code': code,
      'imageType': imageType,
      'imageUrl': imageUrl
    };
  }
}
