import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image(
                image: AssetImage("assets/AKGEC logo.png"),
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image(
                  image: AssetImage("assets/GMA.png"),
                ),
              ),
            ],
            title: Container(
              child: Image.asset(
                "assets/scroll19.jpg",
                fit: BoxFit.fitHeight,
              ),
              // height: 60,
              // width: 150,
              color: Color(0xff1f1f1f),
            ),
            backgroundColor: Color(0xff1f1f1f),
            centerTitle: true,
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/bgapp.jpg",
                  ),
                  fit: BoxFit.fitWidth)),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Padding(
                //   padding: EdgeInsets.all(20),
                //   child: Card(elevation: 15,
                //     color: Color(0xff1f1f1f),
                //     child: Padding(
                //       padding: const EdgeInsets.all(20.0),
                //       child: Container(

                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: <Widget>[
                //             Container(
                //               height: 180,
                //               child: Image(image: AssetImage("assets/scrollsposter.jpg",),fit: BoxFit.fitHeight,),
                //             ),
                //             SizedBox(height: 10,),
                //             Text("It's ON !!!",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color(0xffefb168)),),

                //             SizedBox(height: 10,),
                //             Text("Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. ",style: TextStyle(fontSize: 13,color: Color(0xffffffff)),textAlign: TextAlign.justify,),

                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.all(20),
                //   child: Card(elevation: 15,
                //     color: Color(0xff1f1f1f),
                //     child: Padding(
                //       padding: const EdgeInsets.all(20.0),
                //       child: Container(

                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: <Widget>[
                //             Container(
                //               height: 180,
                //               child: Image(image: AssetImage("assets/scrollsposter.jpg",),fit: BoxFit.fitHeight,),
                //             ),
                //             SizedBox(height: 10,),
                //             Text("A Few Days more..",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color(0xffefb168)),),

                //             SizedBox(height: 10,),
                //             Text("Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. ",style: TextStyle(fontSize: 13,color: Color(0xffffffff)),textAlign: TextAlign.justify,),

                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                SizedBox(
                  height: 30,
                ),
                Card(
                  color: Color(0xff1f1f1f),
                  elevation: 20,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xff1f1f1f),
                    child: Image.asset("assets/sched.jpg"),
                    height: 80,
                  ),
                ),
                Container(
                  height: 20,
                ),
                Center(
                    child: Card(
                  elevation: 20,
                  color: Color(0xff1f1f1f),
                  child: Container(
                      height: 90,
                      width: MediaQuery.of(context).size.width - 100,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                child: Text(
                                  "30",
                                  style: TextStyle(
                                      color: Color(0xffefb168), fontSize: 40),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("th OCTOBER",
                                            style: TextStyle(
                                                color: Color(0xffefb168),
                                                fontSize: 15)),
                                        Text("WEDNESDAY",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15)),
                                      ],
                                    ),
                                    Expanded(
                                      child: Text("LAST DATE FOR",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12)),
                                    )
                                  ],
                                ),
                                Text("SYNOPSIS SUBMISSION",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                              ],
                            ))
                          ],
                        ),
                      )),
                )),

                Container(
                  height: 20,
                ),
                Center(
                    child: Card(
                  elevation: 20,
                  color: Color(0xff1f1f1f),
                  child: Container(
                      height: 90,
                      width: MediaQuery.of(context).size.width - 100,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                child: Text(
                                  "02",
                                  style: TextStyle(
                                      color: Color(0xffefb168), fontSize: 40),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("nd NOVEMBER",
                                            style: TextStyle(
                                                color: Color(0xffefb168),
                                                fontSize: 15)),
                                        Text("SATURDAY",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15)),
                                      ],
                                    ),
                                    Expanded(
                                      child: Text("NOTIFICATION",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12)),
                                    )
                                  ],
                                ),
                                Text("OF ACCEPTANCE",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                              ],
                            ))
                          ],
                        ),
                      )),
                )),

                Container(
                  height: 20,
                ),
                // Center(
                //     child: Card(
                //       elevation: 20,
                //       color: Color(0xff1f1f1f),
                //       child: Container(
                //           height: 90,
                //           width: MediaQuery.of(context).size.width - 100,
                //           child: Padding(
                //             padding: const EdgeInsets.all(10.0),
                //             child: Row(
                //               children: <Widget>[
                //                 Padding(
                //                   padding: const EdgeInsets.only(top:8.0),
                //                   child: Container(
                //                     child: Text(
                //                       "20",style: TextStyle(color: Color(0xffefb168),fontSize: 40),
                //                     ),
                //                   ),
                //                 ),
                //                 SizedBox(width: 4,),
                //                 Expanded(
                //                     child: Column(
                //                       mainAxisAlignment: MainAxisAlignment.end,
                //                       crossAxisAlignment: CrossAxisAlignment.end,
                //                       children: <Widget>[
                //                         Row(
                //                           mainAxisAlignment: MainAxisAlignment.end,
                //                           crossAxisAlignment: CrossAxisAlignment.end,
                //                           children: <Widget>[
                //                             Column(
                //                               mainAxisAlignment: MainAxisAlignment.start,
                //                               crossAxisAlignment: CrossAxisAlignment.start,
                //                               children: <Widget>[
                //                                 Text("th OCTOBER",style: TextStyle(color: Color(0xffefb168),fontSize: 15)),
                //                                 Text("SATURDAY",style: TextStyle(color: Colors.white,fontSize: 15)),
                //                               ],
                //                             ),
                //                             Expanded(
                //                               child:  Text("SUBMISSION",textAlign: TextAlign.right,style: TextStyle(color: Colors.white,fontSize: 12)),
                //                             )
                //                           ],
                //                         ),
                //                         Text("OF FINAL PAPER",textAlign: TextAlign.right,style: TextStyle(color: Colors.white,fontSize: 12)),
                //                       ],
                //                     )
                //                 )
                //               ],
                //             ),
                //           )
                //       ),
                //     )),

                // Container(
                //   height: 20,
                // ),
                Center(
                    child: Card(
                  elevation: 20,
                  color: Color(0xff1f1f1f),
                  child: Container(
                      height: 90,
                      width: MediaQuery.of(context).size.width - 100,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                child: Text(
                                  "16",
                                  style: TextStyle(
                                      color: Color(0xffefb168), fontSize: 40),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("th NOVEMBER",
                                            style: TextStyle(
                                                color: Color(0xffefb168),
                                                fontSize: 15)),
                                        Text("SATURDAY",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15)),
                                      ],
                                    ),
                                    // Expanded(
                                    //   child:  Text("LAST DATE FOR",textAlign: TextAlign.right,style: TextStyle(color: Color(0XFF1F1F1F),fontSize: 12)),
                                    // )
                                  ],
                                ),
                                Text("MAIN EVENT",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                              ],
                            ))
                          ],
                        ),
                      )),
                )),
                Container(
                  height: 20,
                ),
                Center(
                    child: Card(
                  elevation: 20,
                  color: Color(0xff1f1f1f),
                  child: Container(
                      height: 90,
                      width: MediaQuery.of(context).size.width - 100,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                child: Text(
                                  "18",
                                  style: TextStyle(
                                      color: Color(0xffefb168), fontSize: 40),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("th NOVEMBER",
                                            style: TextStyle(
                                                color: Color(0xffefb168),
                                                fontSize: 15)),
                                        Text("MONDAY",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15)),
                                      ],
                                    ),
                                    Expanded(
                                      child: Text("RESULT",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12)),
                                    )
                                  ],
                                ),
                                Text("ANNOUNCEMENT",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                              ],
                            ))
                          ],
                        ),
                      )),
                )),
                Container(
                height: 20,
              ),
              Center(
                  child: Card(
                    elevation: 20,
                    color: Color(0xff1f1f1f),
                    child: Container(
                        height: 90,
                        width: MediaQuery.of(context).size.width - 100,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top:8.0),
                                child: Container(
                                  child: Text(
                                    "20",style: TextStyle(color: Color(0xffefb168),fontSize: 40),
                                  ),
                                ),
                              ),
                              SizedBox(width: 4,),
                              Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text("th NOVEMBER",style: TextStyle(color: Color(0xffefb168),fontSize: 15)),
                                              Text("WEDNESDAY",style: TextStyle(color: Colors.white,fontSize: 15)),
                                            ],
                                          ),
                                          Expanded(
                                            child:  Text("PRICE",textAlign: TextAlign.right,style: TextStyle(color: Colors.white,fontSize: 12)),
                                          )
                                        ],
                                      ),
                                      Text("DISTRIBUTION",textAlign: TextAlign.right,style: TextStyle(color: Colors.white,fontSize: 12)),
                                    ],
                                  )
                              )
                            ],
                          ),
                        )
                    ),
                  )),
                Container(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
