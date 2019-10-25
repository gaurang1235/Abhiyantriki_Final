import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rule extends StatefulWidget {
  @override
  _RuleState createState() => _RuleState();
}

class _RuleState extends State<Rule> {
  @override
  Widget build(BuildContext context) {
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/bgapp.jpg",
              ),
              fit: BoxFit.fitWidth),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Card(
                color: Color(0xff1f1f1f),
                elevation: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xff1f1f1f),
                  child: Image.asset("assets/rules.jpg"),
                  height: 80,
                ),
              ),
              Container(
                height: 5,
              ),
              Center(
                  child: Card(
                elevation: 20,
                color: Color(0xff1f1f1f),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Icon(
                                Icons.radio_button_checked,
                                color: Color(0xffefb168),
                                size: 13,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: Text(
                              "The hackathon is open to all the students of Ajay Kumar Garg Engineering College.",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.justify,
                            )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Icon(
                                Icons.radio_button_checked,
                                color: Color(0xffefb168),
                                size: 13,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: Text(
                              "Maximum of 4 and minimum of 2 members per team.",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.justify,
                            )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Icon(
                                Icons.radio_button_checked,
                                color: Color(0xffefb168),
                                size: 13,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: Text(
                              "Each team will have to submit a synopsis of 500-600 words. Based on the abstract, an experts committee will select the team for inclusion in the final hackathon.",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.justify,
                            )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Icon(
                                Icons.radio_button_checked,
                                color: Color(0xffefb168),
                                size: 13,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: Text(
                              "Teams will be judged on the basis for 4 criteria. Judges will weigh the criteria equally. During judging, participants should try to describe what they did for each criterion in their project. TECHNOLOGY, DESIGN, COMPLETION, LEARNING",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.justify,
                            )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Icon(
                                Icons.radio_button_checked,
                                color: Color(0xffefb168),
                                size: 13,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: Text(
                              "The first page to include title, name of author, their student number, telephone numbers as well as email address.",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.justify,
                            )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Icon(
                                Icons.radio_button_checked,
                                color: Color(0xffefb168),
                                size: 13,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: Text(
                              "The synopsis to be typed in single space, double column format, using Times New Roman font and size 12. A maximum number of pages to be 10 and the page should have no numbers. A margin of 1’’ all around to be left.",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.justify,
                            )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      
                    ],
                  ),
                  width: MediaQuery.of(context).size.width - 50,
                ),
              )),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  color: Color(0xff1f1f1f),
                  child: Text(
                    "The competition is just a part of the hackathon. To make the most out of a event, try something new, teach other people and make few friends.",
                    style: TextStyle(color: Color(0xffefb168)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
