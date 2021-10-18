part of swagger.api;

class User {
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
  
  User(
    {
      int    id,
      String email,
      String password,
      String avatar,
      String firstName,
      String lastName,
      String address,
      String zipCode,
      String city,
      String latitude,
      String longitude
    }
  ) {
    this.id = id;
    this.email = email;
    this.password = password;
    this.avatar = avatar;
    this.firstName = firstName;
    this.lastName = lastName;
    this.address = address;
    this.zipCode = zipCode;
    this.city = city;
    this.latitude = latitude;
    this.longitude = longitude;
  }

  @override
  String toString() {
    return 'User[id=$id, email=$email, password=$password, avatar=$avatar, firstName=$firstName, lastName=$lastName, address=$address, zipCode=$zipCode, city=$city, latitude=$latitude, longitude=$longitude, ]';
  }

  User.fromJson(Map<String, dynamic> json) {
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
      'longitude': longitude
     };
  }

  static List<User> listFromJson(List<dynamic> json) {
    return json == null ? [] : json.map((value) => new User.fromJson(value)).toList();
  }

  static Map<String, User> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, User>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new User.fromJson(value));
    }
    return map;
  }
}

