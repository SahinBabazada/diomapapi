class MainModel {
  List<UserModel>? users;
  int? total;
  int? skip;
  int? limit;

  MainModel({this.users, this.total, this.skip, this.limit});

  MainModel.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <UserModel>[];
      json['users'].forEach((v) {
        users!.add(UserModel.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
}

class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  AddressModel? address;
  String? image;

  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.address,
      required this.image});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    address = AddressModel.fromJson(json['address']);
    image = json['image'];
  }
}

class AddressModel {
  String? addressName;
  CoordinateModel? coordinates;

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressName = json['address'];
    coordinates = CoordinateModel.fromJson(json['coordinates']);
  }
}

class CoordinateModel {
  double? lat;
  double? lng;

  CoordinateModel.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }
}
