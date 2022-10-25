import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hin_khoj/controller/WordsController.dart';

import '../model/WordsModel.dart';

class MeaningScreen extends StatefulWidget {


  String ? id;
  MeaningScreen({Key? key,required this.id}) : super(key: key);

  @override
  State<MeaningScreen> createState() => _MeaningScreenState();
}

class _MeaningScreenState extends State<MeaningScreen> {

    WordsController wordsController = WordsController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(.9),
        body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                color: Colors.blue,
                child: Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: (){
                                    // _scaffoldKey.currentState!.openDrawer();
                                  },
                                  child: Icon(Icons.arrow_back_rounded,color: Colors.white,
                                  size: 24,)),
                              SizedBox(width: 24,),
                              Expanded(
                                child: FutureBuilder(
                                  future: wordsController.getWordsData(),
                                  builder: (context, AsyncSnapshot<List<WordsModel>> snapshot) {
                                    if (!snapshot.hasData) {
                                      return Text('Loading...');
                                    }
                                    return ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context,index) {
                                          if (snapshot.data![index].id.toString() == widget.id.toString()) {
                                            return Text(snapshot.data![index].english.toString(),style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18
                                            ),);
                                          }
                                          return SizedBox.shrink();
                                        }
                                    );
                                  },

                                ),
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(bottom: 10),
                      child: Center(
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                 Get.back();
                                },
                                child: FutureBuilder(
                                  future: wordsController.getWordsData(),
                                  builder: (context, AsyncSnapshot<List<WordsModel>> snapshot) {
                                    if (!snapshot.hasData) {
                                      return Text('Loading...');
                                    }
                                    return ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context,index) {
                                          if (snapshot.data![index].id.toString() == widget.id.toString()) {
                                            return      TextFormField(
                                              readOnly:  true,
                                              initialValue: snapshot.data![index].english,
                                              decoration: InputDecoration(
                                                  enabled:  false,
                                                  border: InputBorder.none,
                                                  prefixIcon:  Icon(Icons.search)

                                              ),
                                            );
                                          }
                                          return SizedBox.shrink();
                                        }
                                    );




                                  },

                                ),

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8,),
              FutureBuilder(
                future: wordsController.getWordsData(),
                builder: (context, AsyncSnapshot<List<WordsModel>> snapshot) {
                  if (!snapshot.hasData) {
                    return Text('Loading...');
                  }
                   return ListView.builder(
                     shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context,index) {
                          if (snapshot.data![index].id.toString() == widget.id.toString()) {
                            return Card(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  children: [
                                    SizedBox(height: 16,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(snapshot.data![index].pawari.toString(),
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.teal.shade900,
                                          ),),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text('[${snapshot.data![index].wordType1.toString()}]',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black54,

                                          ),),
                                      ],
                                    ),

                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .end,
                                      children: [
                                        Text(snapshot.data![index].hindi.toString(), style: TextStyle(
                                          fontSize: 18,

                                        ),),

                                      ],
                                    ),

                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .end,
                                      children: [
                                        Text(snapshot.data![index].english.toString(), style: TextStyle(
                                            fontSize: 16,
                                            height: 1.25
                                        ),),

                                      ],
                                    ),

                                    SizedBox(height: 6,),
                                    Divider(
                                      color: Colors.black26, thickness: 1.2,),
                                    SizedBox(height: 6,),

                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(
                                          'पंवारी वाक्य - ', style: TextStyle(
                                            fontSize: 16,
                                            height: 1.25
                                        ),),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Expanded(
                                          child: Text(
                                            snapshot.data![index].pawariSentence.toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                height: 1.25
                                            ),),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(
                                          'हिन्दी अनुवाद - ', style: TextStyle(
                                            fontSize: 16,
                                            height: 1.25
                                        ),),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Expanded(
                                          child: Text(
                                            snapshot.data![index].hindiSentence.toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                height: 1.25
                                            ),),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text('English translation - ',
                                          style: TextStyle(
                                              fontSize: 15,
                                              height: 1.25
                                          ),),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Expanded(
                                          child: Text(
                                            snapshot.data![index].englishSentence.toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                height: 1.25
                                            ),),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16,),

                                  ],
                                ),
                              ),
                            );
                          }
                          return SizedBox.shrink();
                        }
                      );




                },

              ),



            ],
          ),
        ),
      ),
    );
  }
}
