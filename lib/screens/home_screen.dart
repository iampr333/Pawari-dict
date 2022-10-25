import 'package:flutter/material.dart';

import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:hin_khoj/controller/WordsController.dart';
import 'package:hin_khoj/screens/about_us%20_screen.dart';
import 'package:hin_khoj/screens/contact_us_screen.dart';
import 'package:hin_khoj/screens/privacy_policy_screen.dart';
import 'package:hin_khoj/screens/search_word_screen.dart';

import '../model/WordsModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  WordsController wordsController = WordsController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: ListView(

            padding: EdgeInsets.zero,
            children: <Widget>[
               Container(
                 color: Colors.blue.shade600,
                 padding: EdgeInsets.symmetric(horizontal: 16),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(
                       height: 16,
                     ),
                     CircleAvatar(
                       backgroundImage: AssetImage('images/pawari_logo.png'),
                       radius: 50,
                     ),
                     SizedBox(
                       height: 16,
                     ),
                   ],
                 ),
               ),
              ListTile(
                leading: Icon(Icons.info_rounded), title: Text("About Us"),
                onTap: () {
                  Get.to(() => AboutUsScreen());
                },
              ),
              ListTile(
                leading: Icon(Icons.insert_drive_file_rounded), title: Text("Privacy Policy"),
                onTap: () {
                  Get.to(() => PrivacyPolicyScreen());
                },
              ),
              ListTile(
                leading: Icon(Icons.contacts), title: Text("Contact Us"),
                onTap: () {
                  Get.to(() => ContactUsScreen());
                },
              ),
            ],
          ),
        ),
             body: Column(
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
                       Row(
                         children: [
                           InkWell(
                               onTap: (){
                                 _scaffoldKey.currentState!.openDrawer();
                               },
                               child: Icon(Icons.dehaze,color: Colors.white,)),
                           SizedBox(width: 24,),
                           Text('Pawaridict',style: TextStyle(
                             color: Colors.white,
                             fontSize: 16
                           ),),
                         ],
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
                         Get.to( () => SearchWordScreen());
                              },
                              child: TextFormField(
                                readOnly:  true,
                              decoration: InputDecoration(
                               enabled:  false,
                                hintText: 'Search Word',
                                border: InputBorder.none,
                                prefixIcon:  Icon(Icons.search)

                              ),
                              ),
                            ),
                          ),
                           Icon(Icons.mic),
                           SizedBox(width: 8,),
                         ],
                       ),
                     ),
                   ),
                   Container(
                     child: Row(
                       children: [
                       ],
                     ),
                   )
                 ],
               ),
             ),
               Expanded(
                 child: SingleChildScrollView(
                   child: Column(
                     children: [
                       SizedBox(
                         height: 8,
                       ),
                       SizedBox(
                         height: 140,
                         child: Swiper(
                           itemBuilder: (BuildContext context, int index) {
                             return   Card(
                                 child: Container(
                                   margin: EdgeInsets.only(left: 16),
                                   child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         SizedBox(
                                           height: 4,
                                         ),
                                         Row(
                                           children: [
                                             Icon(Icons.calendar_month,size: 30,),
                                             SizedBox(width: 16,),
                                             Text('Word of the day'),
                                           ],
                                         ),
                                         Container(
                                           margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*.11),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               SizedBox(height: 4,),
                                               FutureBuilder(
                                                 future: wordsController.getWordsData(),
                                                 builder: (context, AsyncSnapshot<List<WordsModel>> snapshot) {
                                                   if (!snapshot.hasData) {
                                                     return Text('Loading...');
                                                   } else {
                                                     return Text(snapshot.data![index].english.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),);
                                                   }
                                                 },
                                               ),
                                               FutureBuilder(
                                                 future: wordsController.getWordsData(),
                                                 builder: (context, AsyncSnapshot<List<WordsModel>> snapshot) {
                                                   if (!snapshot.hasData) {
                                                     return Text('Loading...');
                                                   } else {
                                                     return Text(snapshot.data![index].hindi.toString());

                                                   }
                                                 },
                                               ),
                                               FutureBuilder(
                                                 future: wordsController.getWordsData(),
                                                 builder: (context, AsyncSnapshot<List<WordsModel>> snapshot) {
                                                   if (!snapshot.hasData) {
                                                     return Text('Loading...');
                                                   } else {
                                                     return Text(snapshot.data![index].pawari.toString());

                                                   }
                                                 },
                                               ),
                                             ],
                                           ),
                                         ),
                                       ]
                                   ),
                                 )
                             );
                           },
                           indicatorLayout: PageIndicatorLayout.SCALE,
                           itemCount: 5,
                           pagination: new SwiperPagination(),
                           control: new SwiperControl(),
                           fade: 1.0,
                           viewportFraction: 0.85,
                         ),
                       ),
                       SizedBox(
                         height: 8,
                       ),
                       SizedBox(
                         height: 175,
                         child: Swiper(
                           itemBuilder: (BuildContext context, int index) {
                             return   Card(
                                 child: Container(
                                   margin: EdgeInsets.only(left: 16),
                                   child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         SizedBox(
                                           height: 4,
                                         ),
                                         Row(
                                           children: [
                                             Icon(Icons.calendar_month,size: 30,),
                                             SizedBox(width: 16,),
                                             Text('Sentence of the day'),
                                           ],
                                         ),

                                         Container(
                                           margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*.11),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               SizedBox(height: 4,),
                                               FutureBuilder(
                                                 future: wordsController.getWordsData(),
                                                 builder: (context, AsyncSnapshot<List<WordsModel>> snapshot) {
                                                   if (!snapshot.hasData) {
                                                     return Text('Loading...');
                                                   } else {
                                                     return Text(snapshot.data![index].englishSentence.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),);
                                                   }
                                                 },
                                               ),
                                               FutureBuilder(
                                                 future: wordsController.getWordsData(),
                                                 builder: (context, AsyncSnapshot<List<WordsModel>> snapshot) {
                                                   if (!snapshot.hasData) {
                                                     return Text('Loading...');
                                                   } else {
                                                     return Text(snapshot.data![index].hindiSentence.toString());

                                                   }
                                                 },
                                               ),
                                               FutureBuilder(
                                                 future: wordsController.getWordsData(),
                                                 builder: (context, AsyncSnapshot<List<WordsModel>> snapshot) {
                                                   if (!snapshot.hasData) {
                                                     return Text('Loading...');
                                                   } else {
                                                     return Text(snapshot.data![index].pawariSentence.toString());

                                                   }
                                                 },
                                               ),
                                             ],
                                           ),
                                         ),
                                       ]
                                   ),
                                 )
                             );
                           },
                           indicatorLayout: PageIndicatorLayout.SCALE,
                           itemCount: 5,
                           pagination: new SwiperPagination(),
                           control: new SwiperControl(),
                           fade: 1.0,
                           viewportFraction: 0.85,
                         ),
                       ),
                       SizedBox(
                         height: 8,
                       ),
                       Card(
                         child: Container(
                           margin: EdgeInsets.symmetric(horizontal: 8,),
                           padding: EdgeInsets.symmetric(vertical: 8),
                           child: Column(
                             children: [
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Row(
                                     children: [
                                       Icon(Icons.trending_up,color: Colors.blue.shade700,),
                                       SizedBox(width: 8,),
                                       Text('Trending Words',style: TextStyle(
                                           color: Colors.blue.shade700,
                                           fontWeight: FontWeight.w500
                                       ),),
                                     ],
                                   ),
                                   Row(
                                     children: [
                                       Container(
                                         padding: EdgeInsets.symmetric(vertical: 2,horizontal: 6),
                                         decoration: BoxDecoration(
                                             border: Border.all(color: Colors.blue)
                                         ),
                                         child: Text('ENGLISH',style: TextStyle(
                                             fontWeight: FontWeight.w500,
                                             fontSize: 10
                                         ),),
                                       ),
                                       SizedBox(
                                         width: 4,
                                       ),
                                       Container(
                                         padding: EdgeInsets.symmetric(vertical: 2,horizontal: 6),
                                         decoration: BoxDecoration(
                                             border: Border.all(color: Colors.blue)
                                         ),
                                         child: Text('HINDI',style: TextStyle(
                                             fontWeight: FontWeight.w500,
                                             fontSize: 10
                                         ),),
                                       ),

                                     ],
                                   )
                                 ],
                               ),
                               SizedBox(
                                 height: 12,
                               ),

                               Row(children: [


                                 Expanded(
                               child:    FutureBuilder(
                                     future: wordsController.getWordsData(),
                                     builder: (context, AsyncSnapshot<List<WordsModel>> snapshot) {
                                       if (!snapshot.hasData) {
                                         return Text('Loading...');
                                       } else {
                                         return Container(
                                             padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                                             decoration: BoxDecoration(
                                                 color: Colors.black12,
                                                 borderRadius: BorderRadius.circular(6)
                                             ),
                                             child: Center(child:
                                             Text(snapshot.data![0].english.toString(),style: TextStyle(
                                                 color: Colors.black54
                                             ),)
                                           ),);

                                       }
                                     },
                                   ),

                                 ),
                                 SizedBox(width: 8,),
                                 Expanded(
                                   child:    FutureBuilder(
                                     future: wordsController.getWordsData(),
                                     builder: (context, AsyncSnapshot<List<WordsModel>> snapshot) {
                                       if (!snapshot.hasData) {
                                         return Text('Loading...');
                                       } else {
                                         return Container(
                                           padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                                           decoration: BoxDecoration(
                                               color: Colors.black12,
                                               borderRadius: BorderRadius.circular(6)
                                           ),
                                           child: Center(child:
                                           Text(snapshot.data![1].english.toString(),style: TextStyle(
                                               color: Colors.black54
                                           ),)
                                           ),);

                                       }
                                     },
                                   ),

                                 ),
                                 SizedBox(width: 8,),
                                 Expanded(
                                   child:    FutureBuilder(
                                     future: wordsController.getWordsData(),
                                     builder: (context, AsyncSnapshot<List<WordsModel>> snapshot) {
                                       if (!snapshot.hasData) {
                                         return Text('Loading...');
                                       } else {
                                         return Container(
                                           padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                                           decoration: BoxDecoration(
                                               color: Colors.black12,
                                               borderRadius: BorderRadius.circular(6)
                                           ),
                                           child: Center(child:
                                           Text(snapshot.data![2].english.toString(),style: TextStyle(
                                               color: Colors.black54
                                           ),)
                                           ),);

                                       }
                                     },
                                   ),

                                 ),
                               ],),
                               SizedBox(
                                 height: 6,
                               ),
                               Row(children: [
                                 Expanded(
                                   child:    FutureBuilder(
                                     future: wordsController.getWordsData(),
                                     builder: (context, AsyncSnapshot<List<WordsModel>> snapshot) {
                                       if (!snapshot.hasData) {
                                         return Text('Loading...');
                                       } else {
                                         return Container(
                                           padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                                           decoration: BoxDecoration(
                                               color: Colors.black12,
                                               borderRadius: BorderRadius.circular(6)
                                           ),
                                           child: Center(child:
                                           Text(snapshot.data![0].english.toString(),style: TextStyle(
                                               color: Colors.black54
                                           ),)
                                           ),);

                                       }
                                     },
                                   ),

                                 ),
                                 SizedBox(width: 8,),
                                 Expanded(
                                   child:    FutureBuilder(
                                     future: wordsController.getWordsData(),
                                     builder: (context, AsyncSnapshot<List<WordsModel>> snapshot) {
                                       if (!snapshot.hasData) {
                                         return Text('Loading...');
                                       } else {
                                         return Container(
                                           padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                                           decoration: BoxDecoration(
                                               color: Colors.black12,
                                               borderRadius: BorderRadius.circular(6)
                                           ),
                                           child: Center(child:
                                           Text(snapshot.data![0].english.toString(),style: TextStyle(
                                               color: Colors.black54
                                           ),)
                                           ),);

                                       }
                                     },
                                   ),

                                 ),
                                 SizedBox(width: 8,),
                                 Expanded(
                                   child:    FutureBuilder(
                                     future: wordsController.getWordsData(),
                                     builder: (context, AsyncSnapshot<List<WordsModel>> snapshot) {
                                       if (!snapshot.hasData) {
                                         return Text('Loading...');
                                       } else {
                                         return Container(
                                           padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                                           decoration: BoxDecoration(
                                               color: Colors.black12,
                                               borderRadius: BorderRadius.circular(6)
                                           ),
                                           child: Center(child:
                                           Text(snapshot.data![0].english.toString(),style: TextStyle(
                                               color: Colors.black54
                                           ),)
                                           ),);

                                       }
                                     },
                                   ),

                                 ),
                               ],),
                               SizedBox(
                                 height: 6,
                               ),
                               Row(children: [
                                 Expanded(
                                   child:    FutureBuilder(
                                     future: wordsController.getWordsData(),
                                     builder: (context, AsyncSnapshot<List<WordsModel>> snapshot) {
                                       if (!snapshot.hasData) {
                                         return Text('Loading...');
                                       } else {
                                         return Container(
                                           padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                                           decoration: BoxDecoration(
                                               color: Colors.black12,
                                               borderRadius: BorderRadius.circular(6)
                                           ),
                                           child: Center(child:
                                           Text(snapshot.data![0].english.toString(),style: TextStyle(
                                               color: Colors.black54
                                           ),)
                                           ),);

                                       }
                                     },
                                   ),

                                 ),
                                 SizedBox(width: 8,),
                                 Expanded(
                                   child:    FutureBuilder(
                                     future: wordsController.getWordsData(),
                                     builder: (context, AsyncSnapshot<List<WordsModel>> snapshot) {
                                       if (!snapshot.hasData) {
                                         return Text('Loading...');
                                       } else {
                                         return Container(
                                           padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                                           decoration: BoxDecoration(
                                               color: Colors.black12,
                                               borderRadius: BorderRadius.circular(6)
                                           ),
                                           child: Center(child:
                                           Text(snapshot.data![0].english.toString(),style: TextStyle(
                                               color: Colors.black54
                                           ),)
                                           ),);

                                       }
                                     },
                                   ),

                                 ),
                                 SizedBox(width: 8,),
                                 Expanded(
                                   child:    FutureBuilder(
                                     future: wordsController.getWordsData(),
                                     builder: (context, AsyncSnapshot<List<WordsModel>> snapshot) {
                                       if (!snapshot.hasData) {
                                         return Text('Loading...');
                                       } else {
                                         return Container(
                                           padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                                           decoration: BoxDecoration(
                                               color: Colors.black12,
                                               borderRadius: BorderRadius.circular(6)
                                           ),
                                           child: Center(child:
                                           Text(snapshot.data![0].english.toString(),style: TextStyle(
                                               color: Colors.black54
                                           ),)
                                           ),);

                                       }
                                     },
                                   ),

                                 ),
                               ],),
                             ],
                           ),
                         ),
                       ),
                       Card(
                         child: Container(
                           child: Column(
                             children: [
                               SizedBox(
                                 height: 12,
                               ),
                               Text('Like & Follow us on',style: TextStyle(),),
                               SizedBox(
                                 height: 12,
                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                   SizedBox(
                                       height: 40,
                                       child: Image.asset('images/facebook.png')),
                                   SizedBox(
                                       height: 40,
                                       child: Image.asset('images/twitter.png')),
                                   SizedBox(
                                       height: 40,
                                       child: Image.asset('images/instagram.png')),
                                   SizedBox(
                                       height: 50,
                                       child: Image.asset('images/youtube.png')),
                                 ],
                               ),

                             ],
                           ),
                         ),
                       )
                     ],
                   ),
                 ),
               ),
              ],),
      ),
    );
  }
}

