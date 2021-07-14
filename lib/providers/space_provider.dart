import 'dart:convert';

import 'package:bwa_cozy/models/space_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {

  //! function untuk menfetching data
  //! typenya asyncronous
  getRecommendedSpaces() async {
    
    //! variabel untuk menmpilkan hasil dari request htpp atau api
    var result =
        await http.get('http://bwa-cozy.herokuapp.com/recommended-spaces');

    //! mencetak apakah nilai statusCode result 200 atau tidak 
    //! jika 200 maka url tidak error
    print(result.statusCode);
    
    //! mencetak  nilai body result atau semua data pada http
    print(result.body);

    if (result.statusCode == 200) {
      //! membuat data di convert dalam bentuk objek menggunakan jsonDecode
      List data = jsonDecode(result.body);

      //!  membuat variabel data dynamic dan membuat data mapping json
      List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();
      return spaces;
    } else {
      return <Space>[];
    }
  }
}
