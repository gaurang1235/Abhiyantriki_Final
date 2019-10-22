import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Team extends StatelessWidget {
  void call(String number) => launch("tel:$number");
  void sendEmail(String email) => launch("mailto:$email");
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width / 423.5293998850261;
    // double height = MediaQuery.of(context).size.height / 704.705862586474;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xff1f1f1f),
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

      /*appBar: AppBar(
        elevation: 0,
        title: Container(
            height: 60,
            width: 130,
            color: Color(0xff1f1f1f),
            child: Image.asset(
              "assets/REGISTER.png",
              fit: BoxFit.fitWidth,
            )),
        centerTitle: true,
        backgroundColor: Color(0xff1f1f1f),
      ),*/
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/bgapp.jpg",
                ),
                fit: BoxFit.fitHeight),
          ),
          child: Column(
            children: <Widget>[
              // SizedBox(
              //   height: 40,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: <Widget>[
              //     Expanded(
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: <Widget>[
              //           Container(
              //             height: 50,
              //             child: Image(
              //               image: AssetImage("assets/AKGEC logo.png"),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //     Container(
              //       child: Center(
              //           child: Container(
              //               height: 60,
              //               child: Image(
              //                 image: AssetImage("assets/scroll19.jpg"),
              //               ))),
              //     ),
              //     Expanded(
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.end,
              //         crossAxisAlignment: CrossAxisAlignment.end,
              //         children: <Widget>[
              //           Container(
              //             height: 50,
              //             child: Image(
              //               image: AssetImage("assets/GMA.png"),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  child: Text(
                    "ABHIYANTRIKI helps in pushing one out of the comfort zone and provides a great opportunity to learn new things. The time constraints of the hackathon encourage teams to work together quickly and stay as focused as possible. ABHIYANTRIKI will provide a golden opportunity to the first-year students by providing them with a platform to learn and work on new technologies at an early stage which will be beneficial for them in the long run. It will also provide a glimpse of a competitive environment to the students where they compete to form a new product which is helpful for the society. Such a competitive environment will make them ready to face Global Hackathons such as SIH, where they can thrive with what they learn from this event.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              // Container(
              //     height: 30,
              //     color: Color(0xff1f1f1f),
              //     child: Column(
              //       children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "ORGANISING ",
                    style: TextStyle(
                        color: Color(0xffefb168),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "TEAM",
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 2,
                width: 250,
                color: Color(0xffefb168),
              ),
              //   ],
              // )),
              SizedBox(
                height: 30,
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                elevation: 20,
                color: Color(0xff1f1f1f),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 75,
                          backgroundColor: Color(0xffefb168),
                          backgroundImage: AssetImage("assets/dranu.png"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Dr. Anu Chaudhary",
                          style: TextStyle(color: Color(0xffefb168)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "HOD IT Department",
                          style: TextStyle(color: Color(0xffffffff)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                elevation: 20,
                color: Color(0xff1f1f1f),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Color(0xffefb168),
                          backgroundImage: AssetImage("assets/rahul.png"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Mr. Rahul Sharma",
                          style:
                              TextStyle(color: Color(0xffefb168), fontSize: 11),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Faculty Coordinator",
                          style:
                              TextStyle(color: Color(0xffffffff), fontSize: 11),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 20,
                      color: Color(0xff1f1f1f),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Color(0xffefb168),
                                backgroundImage:
                                    AssetImage("assets/sushil.jpg"),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Dr. Sushil Kumar",
                                style: TextStyle(
                                    color: Color(0xffefb168), fontSize: 11),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Faculty Coordinator",
                                style: TextStyle(
                                    color: Color(0xffffffff), fontSize: 11),
                              )
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 20,
                      color: Color(0xff1f1f1f),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Color(0xffefb168),
                                backgroundImage: AssetImage("assets/anu.png"),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Ms. Anu Gupta",
                                style: TextStyle(
                                    color: Color(0xffefb168), fontSize: 11),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Faculty Coordinator",
                                style: TextStyle(
                                    color: Color(0xffffffff), fontSize: 11),
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
              // SizedBox(
              //   height: 20,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: <Widget>[
              //     Card(
              //         clipBehavior: Clip.antiAlias,
              //         elevation: 20,
              //         color: Color(0xff1f1f1f),
              //         child: Padding(
              //           padding: const EdgeInsets.all(20.0),
              //           child: Container(
              //             child: Column(
              //               children: <Widget>[
              //                 CircleAvatar(
              //                   radius: 50,
              //                   backgroundColor: Color(0xffefb168),
              //                   backgroundImage:
              //                       AssetImage("assets/SHRUTI.PNG"),
              //                 ),
              //                 SizedBox(
              //                   height: 10,
              //                 ),
              //                 Text(
              //                   "Shruti Singh",
              //                   style: TextStyle(
              //                       color: Color(0xffefb168), fontSize: 11),
              //                 ),
              //                 SizedBox(
              //                   height: 10,
              //                 ),
              //                 Text(
              //                   "Student Convener",
              //                   style: TextStyle(
              //                       color: Color(0xffffffff), fontSize: 11),
              //                 )
              //               ],
              //             ),
              //           ),
              //         )),
              //     SizedBox(
              //       width: 20,
              //     ),
              //     Card(
              //         clipBehavior: Clip.antiAlias,
              //         elevation: 20,
              //         color: Color(0xff1f1f1f),
              //         child: Padding(
              //           padding: const EdgeInsets.all(20.0),
              //           child: Container(
              //             child: Column(
              //               children: <Widget>[
              //                 CircleAvatar(
              //                   radius: 50,
              //                   backgroundColor: Color(0xffefb168),
              //                   backgroundImage:
              //                       AssetImage("assets/APOORV.PNG"),
              //                 ),
              //                 SizedBox(
              //                   height: 10,
              //                 ),
              //                 Text(
              //                   "Harshika Tomar",
              //                   style: TextStyle(
              //                       color: Color(0xffefb168), fontSize: 11),
              //                 ),
              //                 SizedBox(
              //                   height: 10,
              //                 ),
              //                 Text(
              //                   "Student Convener",
              //                   style: TextStyle(
              //                       color: Color(0xffffffff), fontSize: 11),
              //                 )
              //               ],
              //             ),
              //           ),
              //         )),
              //   ],
              // ),
              SizedBox(
                height: 40,
              ),
              // Container(
              //   height: 30,
              //   color: Color(0xff1f1f1f),
              //   child: Column(
              //     children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "DEVELOPERS ",
                    style: TextStyle(
                        color: Color(0xffefb168),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "TEAM",
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 2,
                width: 250,
                color: Color(0xffefb168),
              ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 20,
                      color: Color(0xff1f1f1f),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Color(0xffefb168),
                                backgroundImage: AssetImage("assets/pf.jpg"),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Siddharth Singh",
                                style: TextStyle(
                                    color: Color(0xffefb168), fontSize: 11),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Event Head",
                                style: TextStyle(
                                    color: Color(0xffffffff), fontSize: 9),
                              )
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 20,
                      color: Color(0xff1f1f1f),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Color(0xffefb168),
                                backgroundImage:
                                    AssetImage("assets/aryan.jpeg"),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Aryan Chaudhary",
                                style: TextStyle(
                                    color: Color(0xffefb168), fontSize: 11),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Event Head",
                                style: TextStyle(
                                    color: Color(0xffffffff), fontSize: 9),
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 20,
                      color: Color(0xff1f1f1f),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Color(0xffefb168),
                                backgroundImage:
                                    AssetImage("assets/shashank.jpg"),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Shashank Sahai",
                                style: TextStyle(
                                    color: Color(0xffefb168), fontSize: 11),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Flutter Developer",
                                style: TextStyle(
                                    color: Color(0xffffffff), fontSize: 9),
                              )
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 20,
                      color: Color(0xff1f1f1f),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Color(0xffefb168),
                                backgroundImage:
                                    AssetImage("assets/Gaurang.jpeg"),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Gaurang Agarwal",
                                style: TextStyle(
                                    color: Color(0xffefb168), fontSize: 11),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Flutter Developer",
                                style: TextStyle(
                                    color: Color(0xffffffff), fontSize: 9),
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 20,
                      color: Color(0xff1f1f1f),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Color(0xffefb168),
                                backgroundImage: AssetImage("assets/ripu.jpeg"),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Ripudaman Singh",
                                style: TextStyle(
                                    color: Color(0xffefb168), fontSize: 11),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Backend Developer",
                                style: TextStyle(
                                    color: Color(0xffffffff), fontSize: 9),
                              )
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 20,
                      color: Color(0xff1f1f1f),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Color(0xffefb168),
                                backgroundImage:
                                    AssetImage("assets/deepak.jpg"),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Deepak Chaurasia",
                                style: TextStyle(
                                    color: Color(0xffefb168), fontSize: 11),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Designer",
                                style: TextStyle(
                                    color: Color(0xffffffff), fontSize: 9),
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "CONTACT ",
                    style: TextStyle(
                        color: Color(0xffefb168),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "US",
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 2,
                width: 250,
                color: Color(0xffefb168),
              ),
              Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 20,
                  color: Color(0xff1f1f1f),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        child: Row(children: <Widget>[
                      Icon(
                        Icons.call,
                        color: Color(0xffefb168),
                      ),
                      SizedBox(
                        width: 25.0,
                      ),
                      GestureDetector(
                          onTap: () {
                            //print("7065500677");
                            call("7065500677");
                          },
                          child: Text("7065500677",
                              style: TextStyle(color: Colors.white)))
                    ])),
                  )),
              GestureDetector(
                onTap: () {
                  sendEmail("bdcoe.akgec@gmail.com");
                },
                child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 20,
                    color: Color(0xff1f1f1f),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                          child: Row(children: <Widget>[
                        Icon(
                          Icons.email,
                          color: Color(0xffefb168),
                        ),
                        SizedBox(
                          width: 25.0,
                        ),
                        Text("bdcoe.akgec@gmail.com",
                            style: TextStyle(color: Colors.white))
                      ])),
                    )),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
