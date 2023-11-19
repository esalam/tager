class Address {
  String? lat;
  String? long;
  String? place;
  String? address;



  Address.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
    place = json['place'];
    address = json['address'];
  }


}