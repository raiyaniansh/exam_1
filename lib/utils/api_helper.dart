import 'dart:convert';

import 'package:exam_1/screen/task3/home/modal/home_modal.dart';
import 'package:http/http.dart' as http;

class Api
{
  Future<Corona?> apicall()
  async {
    Uri uri = Uri.parse("https://corona-virus-world-and-india-data.p.rapidapi.com/api");
    var respon= await http.get(uri,headers: {"content-type":"application/octet-stream","X-RapidAPI-Key":"1bae965847msh1c51a72299723cep1e06cfjsn63a623c0d4b6","X-RapidAPI-Host":"corona-virus-world-and-india-data.p.rapidapi.com"});
    var json = jsonDecode(respon.body);
    Corona? corona = Corona.fromJson(json);
    return corona;
  }

}