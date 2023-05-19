class WallpaperModel {
  String? photographer;
  String? photographer_url;
  int? photographer_id;
  SrcModel? src;

  WallpaperModel({this.photographer,this.photographer_id,this.photographer_url,this.src});

  factory WallpaperModel.fromMap(Map<String,dynamic> jsonData){
    return WallpaperModel(
      src:  SrcModel.fromMap(jsonData["src"]),
      photographer_url:  jsonData["photographer_url"],
      photographer: jsonData["photographer"],
      photographer_id: jsonData["photographer_id"]
    );
  }


}

class SrcModel{
  String? original;
  String? large;
  String? potrait;

  SrcModel({this.large,this.original,this.potrait});

  factory SrcModel.fromMap(Map<String,dynamic>jsonData){
    return SrcModel(
      potrait: jsonData["portrait"],
      original: jsonData["original"],
      large: jsonData["large"]
    );
  }
}