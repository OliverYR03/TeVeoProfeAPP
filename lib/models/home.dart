import 'dart:convert';

class Home {
  Home({
    required this.id,
    required this.image,
    required this.imageId,
  });

  String id;
  String image;
  dynamic imageId;

  factory Home.fromJson(String str) => Home.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Home.fromMap(Map<String, dynamic> json) => Home(
        id: json["_id"],
        image: json["image"],
        imageId: json["imageId"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "image": image,
        "imageId": imageId,
      };
}
