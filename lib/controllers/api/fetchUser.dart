import 'package:codixel/controllers/api/api.dart';
import 'package:dio/dio.dart';

import '../../models/user.dart';

class FetchUser {
  API api = API();

  Future<User> fetcdata() async {
    try {
      Response response =
          await api.sendRequest.get("https://random-data-api.com/api/v2/users");
      var data = response.data;
      return User.fromJson(data);
    } catch (ex) {
      throw ex;
    }
  }
}
