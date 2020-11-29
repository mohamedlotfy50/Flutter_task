import 'package:http/http.dart' as http;
import 'package:technical_test/services/end_points.dart';
import 'dart:convert';
//https://maps.googleapis.com/maps/api/place/autocomplete/json?key=AIzaSyB-PBPHzbYC90YVPMuEaM7cCMpEhayuZ4I&input=vodafone%20international&language=en&components=country%3Aeg&types=establishment
//https://maps.googleapis.com/maps/api/place/details/json?key=AIzaSyB-PBPHzbYC90YVPMuEaM7cCMpEhayuZ4I&place_id=ChIJk--hajGWNz4RAfRG58NCacI&language=en

class Place {
  final String _key = "AIzaSyB-PBPHzbYC90YVPMuEaM7cCMpEhayuZ4I";
  Future<Map<String, dynamic>> getPlace(String input) async {
    final http.Response response = await http.get(Endpoints.autoComplete +
        "key=$_key" +
        "&input=$input" +
        "&language=en&components=country%3Aeg&types=establishment");
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null;
  }

  Future<Map<String, dynamic>> getDetails(String id) async {
    final http.Response response = await http.get(
        Endpoints.details + "key=$_key" + "&place_id=$id" + "&language=en");
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null;
  }
}
