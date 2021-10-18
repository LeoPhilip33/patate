part of swagger.api;

class RealEstatePropalPagination {
  /* json repose code */
  int code;
  
/* total numbers */
  int total;
  
/* offset */
  int offset;
  
/* limit */
  int limit;
  

  List<RealEstatePropal> list = [];
  
  RealEstatePropalPagination();

  @override
  String toString() {
    return 'RealEstatePropalPagination[code=$code, total=$total, offset=$offset, limit=$limit, list=$list, ]';
  }

  RealEstatePropalPagination.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    code =
        json['code']
    ;
    total =
        json['total']
    ;
    offset =
        json['offset']
    ;
    limit =
        json['limit']
    ;
    list =
      RealEstatePropal.listFromJson(json['list'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'total': total,
      'offset': offset,
      'limit': limit,
      'list': list
     };
  }

  static List<RealEstatePropalPagination> listFromJson(List<dynamic> json) {
    return json == null ? [] : json.map((value) => new RealEstatePropalPagination.fromJson(value)).toList();
  }

  static Map<String, RealEstatePropalPagination> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, RealEstatePropalPagination>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new RealEstatePropalPagination.fromJson(value));
    }
    return map;
  }
}

