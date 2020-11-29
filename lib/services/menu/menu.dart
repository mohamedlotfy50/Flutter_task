import 'package:http/http.dart' as http;
import 'package:technical_test/model/menu_model.dart';
import 'package:technical_test/services/end_points.dart';
import 'dart:convert';

class MenuAPI {
  Future<MenuModel> getMenu() async {
    final http.Response response = await http.get(Endpoints.menu);
    if (response.statusCode == 200) {
      return MenuModel.fromJson(json.decode(response.body));
    }
    return null;
  }
}
