import 'dart:convert';
import 'package:transliteration/response/transliteration_response.dart';
import 'package:transliteration/transliteration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:hin_khoj/controller/WordsController.dart';
import 'package:hin_khoj/model/UserModel.dart';
import 'package:hin_khoj/model/WordsModel.dart';
import 'package:hin_khoj/screens/meaning_screen.dart';
import 'package:http/http.dart' as http;

import '../model/Data.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SearchWordScreen extends StatefulWidget {
  const SearchWordScreen({Key? key}) : super(key: key);

  @override
  State<SearchWordScreen> createState() => _SearchWordScreenState();
}

class _SearchWordScreenState extends State<SearchWordScreen> {

  bool status = false;

//  UserModel ? userModel;
 // WordsModel ? wordsModel;


  List<WordsModel>wordsData  = [];

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getWordFromApi();

  }



  // void _getUserFromApi () async
  // {
  //     var url = Uri.parse('https://reqres.in/api/users?page=2');
  //     var res =  await http.get(url);
  //    setState(() {
  //      userModel = UserModel.fromJson(jsonDecode(res.body));
  //    });
  //    print(userModel);
  // }

  void _getWordFromApi () async
  {
    Uri baseUrl = Uri.parse('https://pawariddict.mahakallok.org/words.php');

    var res =  await  http.get(baseUrl);
    var data =   jsonDecode(res.body.toString());
    if(res.statusCode == 200)
    {
      for(Map i in data)
      {
        setState(() {
          wordsData.add(WordsModel.fromJson(i));
        });

      }
      print(wordsData);
    }

  }


  String hindiTransliterations = '';

  setHindiTransliteration() async {
    TransliterationResponse? _response =
    await Transliteration.transliterate("main", Languages.HINDI);
    hindiTransliterations = _response!.transliterationSuggestions.toString();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(.9),
            body: Container(
              child: Column(
                children: [

              Autocomplete<WordsModel>(
                optionsBuilder: (TextEditingValue value){

                  if(value.text.isEmpty)
                    {
                      return List.empty();
                    }
                  return wordsData!.where((element) => element.english!.toLowerCase().contains(value.text.toLowerCase()));
                  } ,
                displayStringForOption: (WordsModel d) => '${d.english!}',
                onSelected: (value) =>{
                  Get.to( () => MeaningScreen(
                    id: value.id,
                  )),

                },
          fieldViewBuilder: (BuildContext context,
          TextEditingController controller,
          FocusNode node,
          Function onSubmit
          ) => Container(
            color: Colors.white,
            child: TextField(
              autofocus: true,
              onChanged: (value){

              },
              controller:  controller,
              focusNode: node,
              decoration: InputDecoration(
                hintText: 'Search Word',
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                prefixIcon: Icon(Icons.arrow_back_outlined)
              ),
            ),
          ),
              ),

                  SizedBox(height: 8,),
                  InkWell(
                    onTap: (){
                      setHindiTransliteration();
                    },
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                FlutterSwitch(
                                width: 65.0,
                                height: 30.0,
                                valueFontSize: 14.0,
                                toggleSize: 16.0,
                                inactiveColor: Colors.grey.shade400.withOpacity(.7),
                                value: status,
                                borderRadius: 30.0,
                                padding: 8.0,
                                showOnOff: true,
                                onToggle: (val) {
                                  setState(() {
                                    status = val;
                                  });
                                },
                              ),
                                ],
                              ),
                              Text('Hindi Typing',style: TextStyle(
                                fontSize: 14,
                              ),),

                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  FlutterSwitch(
                                    width: 65.0,
                                    height: 30.0,
                                    valueFontSize: 14.0,
                                    toggleSize: 16.0,
                                    inactiveColor: Colors.grey.shade400.withOpacity(.7),
                                    value: status,
                                    borderRadius: 30.0,
                                    padding: 8.0,
                                    showOnOff: true,
                                    onToggle: (val) {
                                      setState(() {
                                        status = val;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Text('Hindi Typing',style: TextStyle(
                                fontSize: 14,
                              ),),

                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  FlutterSwitch(
                                    width: 65.0,
                                    height: 30.0,
                                    valueFontSize: 14.0,
                                    toggleSize: 16.0,
                                    inactiveColor: Colors.grey.shade400.withOpacity(.7),
                                    value: status,
                                    borderRadius: 30.0,
                                    padding: 8.0,
                                    showOnOff: true,
                                    onToggle: (val) {
                                      setState(() {
                                        status = val;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Text('Hindi Typing',style: TextStyle(
                                fontSize: 14,
                              ),),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Hello will be Transliterated in Hindi : ',
                  ),
                  Container(
                    color: Colors.yellow,
                    child: Text(
                      hindiTransliterations,
                  //    style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ],
              ),
            ),
    ),
      );
  }
}
