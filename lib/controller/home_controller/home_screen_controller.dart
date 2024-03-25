import 'dart:convert';

import 'package:api_integration_sample_2/model/home_screen_model/sample_api_res_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  SampleapiResModel? resModel; //////gblobaly accessed
  List<Datum>? dataList = [];
  bool isLoading = false;
  Future<void> fetchData() async {
    bool isLoading = true;
    // 1.... set up url
    final url = Uri.parse("https://reqres.in/api/users?page=2");

    // 2.... call api and store the response to a variable

    var response = await http.get(url);

    // 3..... if staus code 200 sucess

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      //4..... decode the json data

      var decodeData = jsonDecode(response.body);

      //5....to convert the data to model class using factory constructor

      // print(decodeData);// decode all the value
      // print(decodeData["per_page"]); // print the specific value
      // print(decodeData["data"][0][
      //     "email"]); // to print email.......[data]...>is the key of map the email is belongs to the key data.........[0]....> index....> [email]...> the value wee want
      // print(decodeData["support"]["text"]);

      // SampleapiResModel resModel = SampleapiResModel.fromJson(decodeData);
      // print(resModel.data?.first.email);
      resModel = SampleapiResModel.fromJson(decodeData);
      if (resModel != null) {
        dataList = resModel?.data ?? [];
      }
      print(resModel?.data?.first.email);
      notifyListeners();
    } else {
      bool isLoading = true;
      print("Api call failed");
    }
  }
}
