import 'dart:convert';

import 'package:hin_khoj/model/WordsModel.dart';
import 'package:http/http.dart' as http;


class WordsController {


   Future<List<WordsModel>> getWordsData() async {

     Uri baseUrl = Uri.parse('https://pawariddict.mahakallok.org/words.php');

     List<WordsModel> wordsData = [];

       var res =  await  http.get(baseUrl);
       var data =   jsonDecode(res.body.toString());
       if(res.statusCode == 200)
         {
           for(Map i in data)
               {
             wordsData.add(WordsModel.fromJson(i));
               }
            return wordsData;
           }
            return wordsData;
         }
   }
