import 'package:dio/dio.dart';
import 'package:diomap/models/user_model.dart';

Future<List<UserModel>?> getUsers() async {
  String url = 'https://dummyjson.com/users';
  var res = await Dio().get(url);

  if (res.statusCode == 200) {
    var result = MainModel.fromJson(res.data).users;
    // ignore: avoid_print
    return result;
  }
  return [];
}
