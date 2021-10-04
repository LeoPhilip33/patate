part of swagger.api;

class UserAuth {
  /* Id de l'utilisateur */
  int id;
  
/* Email de l'utilisateur qui sert aussi de login */
  String email;
  
/* Mot de passe de l'utilisateur */
  String password;
  
/* Url de l'avatar de l'utilisateur */
  String avatar;
  
/* Prénom de l'utilisateur */
  String firstName;
  
/* Nom de l'utilisateur */
  String lastName;
  
/* Adresse */
  String address;
  
/* Code postal */
  String zipCode;
  
/* Ville */
  String city;
  
/* Latitude */
  String latitude;
  
/* Longitude */
  String longitude;
  
/* jwt token */
  String token;
  
/* jwt token expire time */
  DateTime expire;
  
/* expire timestamp unix */
  int expireTs;
  
  UserAuth();

  @override
  String toString() {
    return 'UserAuth[id=$id, email=$email, password=$password, avatar=$avatar, firstName=$firstName, lastName=$lastName, address=$address, zipCode=$zipCode, city=$city, latitude=$latitude, longitude=$longitude, token=$token, expire=$expire, expireTs=$expireTs, ]';
  }

  UserAuth.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    email =
        json['email']
    ;
    password =
        json['password']
    ;
    avatar =
        json['avatar']
    ;
    firstName =
        json['first_name']
    ;
    lastName =
        json['last_name']
    ;
    address =
        json['address']
    ;
    zipCode =
        json['zip_code']
    ;
    city =
        json['city']
    ;
    latitude =
        json['latitude']
    ;
    longitude =
        json['longitude']
    ;
    token =
        json['token']
    ;
    expire = json['expire'] == null ? null : DateTime.parse(json['expire']);
    expireTs =
        json['expire_ts']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'avatar': avatar,
      'first_name': firstName,
      'last_name': lastName,
      'address': address,
      'zip_code': zipCode,
      'city': city,
      'latitude': latitude,
      'longitude': longitude,
      'token': token,
      'expire': expire == null ? '' : expire.toUtc().toIso8601String(),
      'expire_ts': expireTs
     };
  }

  static List<UserAuth> listFromJson(List<dynamic> json) {
    return json == null ? [] : json.map((value) => new UserAuth.fromJson(value)).toList();
  }

  static Map<String, UserAuth> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, UserAuth>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new UserAuth.fromJson(value));
    }
    return map;
  }
}

