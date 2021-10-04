part of swagger.api;

class RealEstateImage {
  /* Id de l'image */
  int id;
  
/* Id du bien */
  int idRealEstate;
  
/* Url de l'image */
  String url;
  
  RealEstateImage();

  @override
  String toString() {
    return 'RealEstateImage[id=$id, idRealEstate=$idRealEstate, url=$url, ]';
  }

  RealEstateImage.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    idRealEstate =
        json['id_real_estate']
    ;
    url =
        json['url']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_real_estate': idRealEstate,
      'url': url
     };
  }

  static List<RealEstateImage> listFromJson(List<dynamic> json) {
    return json == null ? [] : json.map((value) => new RealEstateImage.fromJson(value)).toList();
  }

  static Map<String, RealEstateImage> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, RealEstateImage>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new RealEstateImage.fromJson(value));
    }
    return map;
  }
}

