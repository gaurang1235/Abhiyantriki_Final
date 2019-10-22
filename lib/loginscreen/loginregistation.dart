import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:abhiyantriki/Register/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

class Mediator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MediatorState();
  }
}

GlobalKey<FormState> validatekey = GlobalKey<FormState>();
DateTime now = DateTime.now();
String string = DateFormat('dd').format(now);
String string1 = DateFormat('MM').format(now);
int date = int.parse(string);
int month = int.parse(string1);

class MediatorState extends State<Mediator> {
  String filepath;
  String filename;
  var loginclicked = false; //login or registation button
  var progressindicatorvariable = false; //progress indicator showing variable

  String password; //variable for entering textformfield password
  String email; //variable for entering textformfield email
  String scrollsId;

  //variable for entering textformfield scrollsid

  String teamname;
  //variables where fetch data and shared prefrences data stored
  String firstname;
  String lastname;
  String college;
  int hostelaccomodation;
  String syn_url;
  String isuploaded;
  String reupload;
  String div;
  String status;
  String downloadurl;
  String fetchemail;
  String mobilenumber;
  int domainid;
  String token;
  var uploadsynopsis = false;
  String team_name;
  bool downloading = false;
  var teamid;
  var scrollsid;
  var progresString = "";
  //variable for the logic of scaffold
  bool logic = false;
  String fullurlfordownloadpdf;

  //initfunction
  void initState() {
    super.initState();
    uploadsynopsis = false;
    progressindicatorvariable = false;

    checkedLogin();
  }

  int dayleftnow(int d, int m) {
    if (m == 9) {
      return 30 - d + 31 + 16;
    } else if (m == 10) {
      return 31 - d + 16;
    } else if (m == 11 && d <= 16) {
      return 16 - d;
    } else
      return -1;
  }

  void download() async {
    setState(() {
      progressindicatorvariable = true;
      logic = false;
    });
    Directory dir = await getExternalStorageDirectory();
    Dio dio = Dio();
    final RegExp regex = RegExp('([^?/]*\.(pdf))');

    print(dir.path.toString());

    await new Directory(dir.path.toString())
        .create(recursive: true)
        .then((data) {
      print("file created");
    });
    print("shashank saahi");
    print(dir.path.toString());
    await dio.download(
        "https://firebasestorage.googleapis.com/v0/b/hackathon-360db.appspot.com/o/sample-1.pdf?alt=media&token=599a0a33-1101-44cf-8c48-ffbf22349d27",
        "${dir.path.toString()}" + "/Abhiyantriki" + "Sample Synopsis.pdf",
        onReceiveProgress: (rec, total) {
      // setState(() {
      //  progressindicatorvariable=true;
      // });
      //   print("rec:${rec}");
      // print("total:${total}");
      // pop(downloading, progresString);
      // setState(() {
      //   downloading = true;
      //   progresString = ((rec / total) * 100).toStringAsFixed(0) + "%";
      // });
    });
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
                "Your File is Downloaded in Android/data/com.example.Abhiyantriki/files"),
            title: Text("Success"),
            actions: <Widget>[
              FlatButton(
                child: Text("Okay"),
                onPressed: () {
                  setState(() {
                    progressindicatorvariable = false;
                    logic = true;
                  });
                  Navigator.of(context).pop();
                  // authkey.currentState.reset();
                },
              )
            ],
          );
        });
    // setState(() {
    //  progressindicatorvariable=false;
    //  logic=true;
    // });
    //     setState(() {
    //    downloading=false;
    //   progresString = 'completed';
    // });
  }

  Future<bool> upload(String _filename, String _path) async {
    progressindicatorvariable = true;
    logic = false;
    setState(() {});
    final StorageReference storageRef =
        FirebaseStorage.instance.ref().child(_filename);
    final StorageUploadTask uploadTask = storageRef.putFile(File(_path));
    final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
    downloadurl = (await downloadUrl.ref.getDownloadURL());
    var urldata = {"syn_url": "${downloadurl}"};
    //print(token);
    //print("${downloadurl}");
    http.post("https://abh2019.herokuapp.com/api/login/upload",
        body: json.encode(urldata),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer " + token
        }).then((http.Response response)async {
      //print(json.decode(response.body));
      var data = json.decode(response.body);
      //print(data["syn_url"]);
      progressindicatorvariable = false;
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("is_upload", data["is_upload"]);
      logic = true;
      setState(() {
        isuploaded = "1";
        reupload = isuploaded;
      });
      if (data["status"] == "done") {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Color(0xffefb168),
                content: Text("Synopsis Uploaded"),
                title: Text("Success"),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      "Okay",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      // authkey.currentState.reset();
                    },
                  )
                ],
              );
            });
      }
    });

    if (downloadurl != null) {
      return true;
    } else {
      return false;
    }
    
  }

  // void upload()async
  // {
  //   setState(() {
  //    progressindicatorvariable=true;
  //    logic=false;
  //   });
  //   // print(token);
  //   // print(teamid);
  //   // print(scrollsid);
  //                        Map<String,dynamic>data={
  //                              "team_id":teamid,
  //                              "scrolls_id":scrollsid

  //                                                };
  //         http.post("https://scrolls19-backend.herokuapp.com/api/leader/${scrollsid}/upload",body: json.encode(data),headers: {
  //     "Content-Type": "application/json","Authorization":"Bearer " + token
  //                         }).then((http.Response response)async{
  //                              print(response.body);
  //                            var responsedataforuploading=json.decode(response.body);
  //                            var url =responsedataforuploading["data"]["pre_signed_url"];
  //                            fullurlfordownloadpdf=responsedataforuploading["data"]["full_url"];

  //                    SharedPreferences prefer = await SharedPreferences.getInstance();
  //                       prefer.setString("full_url", fullurlfordownloadpdf);

  //      http.put(url,
  //     body: File(filepath).readAsBytesSync(),
  //     headers: {"Content-Type": "multipart/form-data"}).then((http.Response response)async{
  //       print(response.body);
  //       if(response.statusCode==200){
  //         SharedPreferences pref = await SharedPreferences.getInstance();
  //         pref.setBool("uploadsynopsis", true);
  //         setState(() {
  //          uploadsynopsis=true;
  //         });
  //         showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         content: Text("Your File is Uploaded"),
  //         title: Text("Success"),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: Text("Okay"),
  //             onPressed: () {
  //               setState(() {
  //                progressindicatorvariable=false;
  //                logic=true;
  //               });
  //               Navigator.of(context).pop();
  //              // authkey.currentState.reset();
  //             },
  //           )
  //         ],
  //       );
  //     });
  //       }
  //       else{
  //          showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         content: Text("Something went wrong"),
  //         title: Text("Failure"),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: Text("Okay"),
  //             onPressed: () {
  //               setState(() {
  //                progressindicatorvariable=false;
  //               });
  //               Navigator.of(context).pop();
  //              // authkey.currentState.reset();
  //             },
  //           )
  //         ],
  //       );
  //     });

  //       }
  //       print(response.statusCode);
  //     });
  //   });
  // }
  void filepicker() async {
    filepath =
        await FilePicker.getFilePath(type: FileType.ANY, fileExtension: "pdf");
    filename = filepath.split("/").last;
    print(filepath);
    setState(() {
      filepath = filepath;
    });
    print(filename);
    setState(() {});
  }

  Future<void> checkedLogin() async {
    print("loginchecked");
    setState(() {
      progressindicatorvariable = true;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
    print(token);
    if (token != null) {
      print("loginconfirmed");
      teamname = pref.getString("team_name");
      syn_url = pref.getString("syn_url");
      isuploaded = pref.getString("is_upload");
      reupload = isuploaded;
      div = pref.getString("div");
      email = pref.getString("email");
      firstname = pref.getString("name");
      setState(() {
        progressindicatorvariable = false;
        logic = true;
      });
    } else {
      print("token notfound");
      loginclicked = false;
      progressindicatorvariable = false;
      setState(() {});
    }

    // if (log == "confirmed") {
    //  if(pref.getBool("uploadsynopsis")!=null)
    //  {
    //   uploadsynopsis=pref.getBool("uploadsynopsis");
    //   }

    //   firstname = pref.getString("firstname");
    //   team_name = pref.getString("team_name");
    //   lastname = pref.getString("lastname");
    //   fetchemail = pref.getString("fetchemail");
    //   college = pref.getString("college");
    //   status = pref.getString("status");
    //   mobilenumber = pref.getString("mobnumber");
    //   domainid = pref.getInt("domain_id");
    //   token=pref.getString("fetchtoken");
    //   scrollsid=pref.getString("scrolls_id");
    //   fullurlfordownloadpdf=pref.getString("full_url");
    //   teamid=pref.getInt("team_id");
    //   setState(() {
    //     logic = true;
    //     progressindicatorvariable=false;
    //   });
    // }
  }

  // Future<void> loginFunction() async {
  //   setState(() {
  //     progressindicatorvariable = true;
  //   });
  //   Map<String, dynamic> logindata;
  //   logindata = {
  //     "team_name": teamname,
  //     "password": password,

  //   };

  //   http.post("https://abh2019.herokuapp.com/api/login",
  //       body: json.encode(logindata),
  //       headers: {
  //         "Content-Type": "application/json"
  //       }).then((http.Response response) async {
  //      print(response.body);
  //     print(response.statusCode);
  //     var responsedata = json.decode(response.body);
  //     var user = responsedata['user'];

  //   if(response.statusCode==200)
  //   {

  //        bool registered=user["registered"];
  //         teamid=user["team_id"];
  //        var email=user["email"];
  //        scrollsid=user["scrolls_id"];
  //         token=responsedata["token"];
  //        if(!registered)
  //        {
  //       Navigator.push(context, MaterialPageRoute(builder: (context)=>MemberRegistation(token,scrollsid,teamid,email))).then((onValue){
  //         setState(() {
  //        progressindicatorvariable=false;
  //       });
  //       });

  //        }

  //     else
  //     {
  //           SharedPreferences pref = await SharedPreferences.getInstance();
  //                if (response.statusCode == 200&&registered)
  //                 {
  //                           pref.setString('login', "confirmed");
  //                           pref.setInt("domain_id", user["domain_id"]);
  //                           domainid = user["domain_id"];
  //                           pref.setString("fetchtoken", responsedata["token"]);
  //                           token=responsedata["token"];
  //                           pref.setString("firstname", user["first_name"]);
  //                           firstname = user["first_name"];
  //                           pref.setString("lastname", user["last_name"]);
  //                           lastname = user["last_name"];
  //                           pref.setString("college", user["college"]);
  //                           college = user["college"];
  //                           pref.setString("status", user["status"]);
  //                           status = user["status"];
  //                           pref.setString("mobnumber", user["mob_no"]);
  //                           mobilenumber = user["mob_no"];
  //                           pref.setString("fetchemail", user["email"]);
  //                           fetchemail = user["email"];
  //                           pref.setString("scrolls_id", user["scrolls_id"]);
  //                           scrollsId=user['scrolls_id'];
  //                           teamid=user['team_id'];
  //                           pref.setInt("team_id", user["team_id"]);
  //                           pref.setString("team_name", user["team_name"]);
  //                           team_name=user['team_name'];
  //                                   setState(() {
  //                                                 progressindicatorvariable = false;
  //                                                  logic = true;

  //                                           });
  //                  }
  //     }
  //   }
  //   else if(response.statusCode==422){
  //     showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             content: Text("Incorrect Login Details"),
  //             title: Text("Failure"),
  //             actions: <Widget>[
  //               FlatButton(
  //                 child: Text("Okay"),
  //                 onPressed: () {
  //                   setState(() {
  //                    progressindicatorvariable=false;
  //                   });
  //                   Navigator.of(context).pop();
  //                  // authkey.currentState.reset();
  //                 },
  //               )
  //             ],
  //           );
  //         });
  //   }

  //     // print(registered);
  //     // print(responsedata);

  //   });
  // }

  Future<void> loginFunction() {
    setState(() {
      progressindicatorvariable = true;
    });
    Map<String, dynamic> logindata;
    logindata = {
      "team_name": teamname,
      "password": password,
    };
    http.post("https://abh2019.herokuapp.com/api/login",
        body: json.encode(logindata),
        headers: {
          "Content-Type": "application/json"
        }).then((http.Response response) async {
      var responsedata = json.decode(response.body);
      print(responsedata);
      print(response.statusCode);
      status = responsedata["status"];
      if (response.statusCode == 200 && status == 'done') {
        token = responsedata['token'];
        print(token);
        teamname = responsedata['team_name'];
        syn_url = responsedata['syn_url'];
        isuploaded = responsedata["is_upload"];
        reupload = isuploaded;
        div = responsedata['div'];
        firstname = responsedata['name'];
        email = responsedata["email"];
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString("token", responsedata["token"]);
        var tk = pref.getString("token");
        print(tk);
        pref.setString("team_name", responsedata["team_name"]);
        pref.setString("syn_url", responsedata["syn_url"]);
        pref.setString("is_upload", responsedata["is_upload"]);
        pref.setString("div", responsedata["div"]);
        pref.setString("email", responsedata["email"]);
        pref.setString("name", responsedata["name"]);
        setState(() {
          progressindicatorvariable = false;
          logic = true;
        });
      }
      if (response.statusCode == 422) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Color(0xffefb168),
                content: Text("${responsedata["errors"][0]["msg"]}"),
                title: Text("Failure"),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      "Okay",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      // authkey.currentState.reset();
                    },
                  )
                ],
              );
            });
        progressindicatorvariable = false;
        loginclicked = false;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return logic
        ? Stack(
            children: <Widget>[
              Scaffold(
                //drawer: Drawer(child: Column(),),
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
                body: SingleChildScrollView(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                        "assets/bgapp.jpg",
                      ))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 28.0),
                        child: Column(children: <Widget>[
                          Container(
                            child: Center(
                                child: Card(
                              elevation: 20,
                              color: Color(0xff1f1f1f),
                              child: Container(
                                  height: 100,
                                  width: MediaQuery.of(context).size.width - 50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.all(1),
                                          child: Container(
                                              height: 60,
                                              width: 50,
                                              child: Image(
                                                image: AssetImage(
                                                    "assets/light.gif"),
                                              )),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Container(
                                            child: Text(
                                              dayleftnow(date, month)
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Color(0xffefb168),
                                                  fontSize: 40),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Expanded(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text("DAYS TO GO",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xffefb168),
                                                            fontSize: 15)),
                                                    Text("FOR",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15)),
                                                  ],
                                                ),
                                                Expanded(
                                                  child: Text("NOTIFICATION",
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: TextStyle(
                                                          color:
                                                              Color(0X00FFFFFF),
                                                          fontSize: 12)),
                                                )
                                              ],
                                            ),
                                            Text("THE MAIN EVENT",
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18)),
                                          ],
                                        ))
                                      ],
                                    ),
                                  )),
                            )),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      "assets/bgapp.jpg",
                                    ),
                                    fit: BoxFit.fitWidth)),
                          ),
                          Container(
                            // height: MediaQuery.of(context).size.width/1.1+200,
                            width: MediaQuery.of(context).size.width / 1.1,

                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      "assets/bgapp.jpg",
                                    ),
                                    fit: BoxFit.fitWidth)),
                            child: Column(
                              children: <Widget>[
                                Card(
                                  elevation: 20,
                                  color: Color(0xff1f1f1f),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      isuploaded == "1"
                                          ? Container()
                                          : Container(
                                              //include the variable
                                              color: Color(0xffefb168),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.error,
                                                      color: Color(0xff1f1f1f),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 20),
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                            child: Text(
                                                      "You have not uploaded a synopsis yet !",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff1f1f1f),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14),
                                                    )))
                                                  ],
                                                ),
                                              ),
                                            ),
                                      Container(
                                        child: Padding(
                                          padding: EdgeInsets.all(20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      "WELCOME TEAM ",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xffefb168),
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Container(
                                                height: 2,
                                                width: 250,
                                                color: Color(0xffefb168),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                teamname,
                                                style: TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      "Leader Name: ",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xffefb168),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Expanded(
                                                        child: Text(
                                                      firstname,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xffffffff),
                                                      ),
                                                    )),
                                                    // RaisedButton(onPressed: (){
                                                    //     filepicker();

                                                    // },child: Text("Choose"),),
                                                    // RaisedButton(onPressed: (){
                                                    //     upload();
                                                    // },child: Text("Upload"),),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      "Leader E-mail: ",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xffefb168),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Expanded(
                                                        child: Text(
                                                      email,
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xffffffff)),
                                                    )),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      "College: ",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xffefb168),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Expanded(
                                                        child: Text(
                                                      "Ajay Kumar Garg ",
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xffffffff)),
                                                    )),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      "Team Name: ",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xffefb168),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Expanded(
                                                        child: Text(
                                                      teamname,
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xffffffff)),
                                                    )),
                                                  ],
                                                ),
                                              ),

                                              Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      "Division: ",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xffefb168),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Expanded(
                                                        child: Text(
                                                      div,
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xffffffff)),
                                                    )),
                                                  ],
                                                ),
                                              ),

                                              //       RaisedButton(onPressed: (){
                                              //     filepicker();

                                              // },child: Text("Choose"),),

                                              //       RaisedButton(onPressed: (){
                                              //     upload();
                                              // },child: Text("Upload"),),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),

                                //                  Padding(
                                //                     padding: EdgeInsets.all(10.0),
                                //                     child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                //                       children: <Widget>[
                                //                         Center(child: Text("Topic: ",style: TextStyle(color: Color(0xffefb168),fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
                                //                          domainid==1?
                                //  Padding(
                                //         padding: const EdgeInsets.symmetric(horizontal:25.0,vertical: 15),
                                //         child: Row(
                                //           mainAxisAlignment: MainAxisAlignment.center,
                                //           crossAxisAlignment: CrossAxisAlignment.center,
                                //           children: <Widget>[

                                //             DropdownButton<String>(
                                //               isExpanded: true,
                                //             items: [
                                //               DropdownMenuItem(child: Text("Cloud Computing",style: TextStyle(color: Color(0xffffffff)),),value: "Cloud Computing",),
                                //               DropdownMenuItem(child: Text("Deep Learning",style: TextStyle(color: Color(0xffffffff)),),value: "Deep Learning",),
                                //               DropdownMenuItem(child: Text("Machine Learning",style: TextStyle(color: Color(0xffffffff)),),value: "Machine Learning",),
                                //               DropdownMenuItem(child: Text("IoT and IoT based Tchnologies",style: TextStyle(color: Color(0xffffffff)),),value: "IoT and IoT based Tchnologies",),
                                //               DropdownMenuItem(child: Text("Cyber Security",style: TextStyle(color: Color(0xffffffff)),),value: "Cyber Security",),
                                //               DropdownMenuItem(child: Text("Augmented Reality",style: TextStyle(color: Color(0xffffffff)),),value: "Augmented Reality",),
                                //               DropdownMenuItem(child: Text("Big Data and Analysis",style: TextStyle(color: Color(0xffffffff)),),value: "Big Data and Analysis",),
                                //               DropdownMenuItem(child: Text("Cryptocurrency (Blockchain)",style: TextStyle(color: Color(0xffffffff)),),value: "Cryptocurrency (Blockchain)",),
                                //               DropdownMenuItem(child: Text("Wireless Sensor Network (WSN)",style: TextStyle(color: Color(0xffffffff)),),value: "Wireless Sensor Network (WSN)",),
                                //               DropdownMenuItem(child: Text("Semantic Web: Sentament Analysis of Twitter/Facebook",style: TextStyle(color: Color(0xffffffff)),),value: "Big Data and Analysis",),
                                //               DropdownMenuItem(child: Text("Quantum Computing",style: TextStyle(color: Color(0xffffffff)),),value: "Cryptocurrency (Blockchain)",),
                                //             ],
                                //               onChanged: (value){
                                //                 topic_name= value;
                                //                 setState(() {
                                //                  topic_name= value;
                                //                 });
                                //               },
                                //               hint: topic_name==null?Text("Synopsis Topic"): Text("$topic_name",style: TextStyle(color: Colors.white),),

                                //             ),
                                //           ],
                                //         ),
                                //  ):
                                // domainid==2?
                                // Padding(
                                //       padding: const EdgeInsets.symmetric(horizontal:25.0,vertical: 15),
                                //       child: Row(
                                //         mainAxisAlignment: MainAxisAlignment.center,
                                //         crossAxisAlignment: CrossAxisAlignment.center,
                                //         children: <Widget>[

                                //           DropdownButton<String>(
                                //             items: [
                                //               DropdownMenuItem(child: Text("Computer Aided Engineering(CAE)",style: TextStyle(color: Color(0xffffffff)),),value: "Computer Aided Engineering(CAE)",),
                                //               DropdownMenuItem(child: Text("Smart Materials",style: TextStyle(color: Color(0xffffffff)),),value: "Smart Materials",),
                                //               DropdownMenuItem(child: Text("Anti-Locking Braking System",style: TextStyle(color: Color(0xffffffff)),),value: "Anti-Locking Braking System",),
                                //               DropdownMenuItem(child: Text("Green Manufacturing",style: TextStyle(color: Color(0xffffffff)),),value: "Green Manufacturing",),
                                //               DropdownMenuItem(child: Text("Biomimetics - Innovation among Nature",style: TextStyle(color: Color(0xffffffff)),),value: "Biomimetics - Innovation among Nature",),
                                //               DropdownMenuItem(child: Text("Rapid Prototyping",style: TextStyle(color: Color(0xffffffff)),),value: "Rapid Prototyping",),
                                //               DropdownMenuItem(child: Text("MEMS - Micro Electro Mechanical System",style: TextStyle(color: Color(0xffffffff)),),value: "MEMS - Micro Electro Mechanical System",),
                                //               DropdownMenuItem(child: Text("Power Generation using Nanotubes",style: TextStyle(color: Color(0xffffffff)),),value: "Power Generation using Nanotubes",),
                                //               DropdownMenuItem(child: Text("Automatic Transmission in Automobiles",style: TextStyle(color: Color(0xffffffff)),),value: "Automatic Transmission in Automobiles",),
                                //               DropdownMenuItem(child: Text("Product Data Management",style: TextStyle(color: Color(0xffffffff)),),value: "Product Data Management",),
                                //               DropdownMenuItem(child: Text("TQM Concepts of Zero Rejections",style: TextStyle(color: Color(0xffffffff)),),value: "TQM Concepts of Zero Rejections",),
                                //               DropdownMenuItem(child: Text("Nano Technology",style: TextStyle(color: Color(0xffffffff)),),value: "Nano Technology",),
                                //             ],
                                //             onChanged: (value){
                                //               topic_name= value;
                                //               setState(() {
                                //                 topic_name= value;
                                //               });
                                //             },
                                //             hint: topic_name==null?Text("Synopsis Topic"): Text("$topic_name",style: TextStyle(color: Colors.white),),

                                //           ),
                                //         ],
                                //       ),
                                // ):
                                // domainid==3?
                                // Padding(
                                //       padding: const EdgeInsets.symmetric(horizontal:25.0,vertical: 15),
                                //       child: Row(
                                //         mainAxisAlignment: MainAxisAlignment.center,
                                //         crossAxisAlignment: CrossAxisAlignment.center,
                                //         children: <Widget>[

                                //           DropdownButton<String>(
                                //             // isExpanded: true,is
                                //             items: [
                                //               DropdownMenuItem(child: Text("Wireless Power Transmission",style: TextStyle(color: Color(0xffffffff)),),value: "Wireless Power Transmission",),
                                //               DropdownMenuItem(child: Text("Floating Power Plant: Power Ship",style: TextStyle(color: Color(0xffffffff)),),value: "Floating Power Plant: Power Ship",),
                                //               DropdownMenuItem(child: Text("Hybrid Electric Vehicles",style: TextStyle(color: Color(0xffffffff)),),value: "Hybrid Electric Vehicles",),
                                //               DropdownMenuItem(child: Text("Humanoid Robotics",style: TextStyle(color: Color(0xffffffff)),),value: "Humanoid Robotics",),
                                //               DropdownMenuItem(child: Text("Power Quality Issues with Grid Connected Wind Energy Systems",style: TextStyle(color: Color(0xffffffff)),),value: "Power Quality Issues with Grid Connected Wind Energy Systems",),
                                //               DropdownMenuItem(child: Text("Renewable Energy and Environment Protection",style: TextStyle(color: Color(0xffffffff)),),value: "Renewable Energy and Environment Protection",),
                                //               DropdownMenuItem(child: Text("Smart Grid Technology",style: TextStyle(color: Color(0xffffffff)),),value: "Smart Grid Technology",),
                                //               DropdownMenuItem(child: Text("Electrodynamic Tether",style: TextStyle(color: Color(0xffffffff)),),value: "Electrodynamic Tether",),
                                //               DropdownMenuItem(child: Text("Super Conducting Rotating Machine",style: TextStyle(color: Color(0xffffffff)),),value: "Super Conducting Rotating Machine",),
                                //               DropdownMenuItem(child: Text("Artificial Intelligence in Power Stations",style: TextStyle(color: Color(0xffffffff)),),value: "Artificial Intelligence in Power Stations",),
                                //               DropdownMenuItem(child: Text("Artificial Neural Network based Power System",style: TextStyle(color: Color(0xffffffff)),),value: "Artificial Neural Network based Power System",),
                                //             ],
                                //             onChanged: (value){
                                //               topic_name= value;
                                //               setState(() {
                                //                 topic_name= value;
                                //               });
                                //             },
                                //             hint: topic_name==null?Text("Synopsis Topic"): Text("$topic_name",style: TextStyle(color: Colors.white),),

                                //           ),
                                //         ],
                                //       ),
                                // ):
                                // domainid==4?
                                // Padding(
                                //       padding: const EdgeInsets.symmetric(horizontal:25.0,vertical: 15),
                                //       child: Row(
                                //         mainAxisAlignment: MainAxisAlignment.center,
                                //         crossAxisAlignment: CrossAxisAlignment.center,
                                //         children: <Widget>[

                                //           DropdownButton<String>(
                                //             items: [
                                //               DropdownMenuItem(child: Text("OLEDs(Organic Light Emitting Diodes)",style: TextStyle(color: Color(0xffffffff)),),value: "OLEDs(Organic Light Emitting Diodes)",),
                                //               DropdownMenuItem(child: Text("Surveilance Cameras",style: TextStyle(color: Color(0xffffffff)),),value: "Surveilance Cameras",),
                                //               DropdownMenuItem(child: Text("Humanoid Robots",style: TextStyle(color: Color(0xffffffff)),),value: "Humanoid Robots",),

                                //               DropdownMenuItem(child: Text("Autonomic Computing",style: TextStyle(color: Color(0xffffffff)),),value: "Autonomic Computing",),
                                //               DropdownMenuItem(child: Text("Flexible Electronics & Displays",style: TextStyle(color: Color(0xffffffff)),),value: "Flexible Electronics & Displays",),
                                //               DropdownMenuItem(child: Text("Laser Communication System",style: TextStyle(color: Color(0xffffffff)),),value: "Laser Communication System",),
                                //               DropdownMenuItem(child: Text("Biomedical Sensors",style: TextStyle(color: Color(0xffffffff)),),value: "Biomedical Sensors",),
                                //               DropdownMenuItem(child: Text("Hybrid Cars",style: TextStyle(color: Color(0xffffffff)),),value: "Hybrid Cars",),
                                //               DropdownMenuItem(child: Text("Smart Antenna",style: TextStyle(color: Color(0xffffffff)),),value: "Smart Antenna",),
                                //               DropdownMenuItem(child: Text("Cellonics Technology",style: TextStyle(color: Color(0xffffffff)),),value: "Cellonics Technology",),
                                //              ],
                                //             onChanged: (value){
                                //               topic_name= value;
                                //               setState(() {
                                //                 topic_name= value;
                                //               });
                                //             },
                                //             hint: topic_name==null?Text("Synopsis Topic"): Text("$topic_name",style: TextStyle(color: Colors.white),),

                                //           ),
                                //         ],
                                //       ),
                                // ):
                                // domainid==5?
                                // Padding(
                                //       padding: const EdgeInsets.symmetric(horizontal:25.0,vertical: 15),
                                //       child: Row(
                                //         mainAxisAlignment: MainAxisAlignment.center,
                                //         crossAxisAlignment: CrossAxisAlignment.center,
                                //         children: <Widget>[

                                //           DropdownButton<String>(
                                //             items: [
                                //               DropdownMenuItem(child: Text("Modern Concepts of Rural Road Developement",style: TextStyle(color: Color(0xffffffff)),),value: "Modern Concepts of Rural Road Developement",),
                                //               DropdownMenuItem(child: Text("Underwater Concreting",style: TextStyle(color: Color(0xffffffff)),),value: "Underwater Concreting",),
                                //               DropdownMenuItem(child: Text("Marine Pollution",style: TextStyle(color: Color(0xffffffff)),),value: "Marine Pollution",),

                                //               DropdownMenuItem(child: Text("Indian Railway: Ensuring last mile connectivity",style: TextStyle(color: Color(0xffffffff)),),value: "Indian Railway: Ensuring last mile connectivity",),
                                //               DropdownMenuItem(child: Text("Earthquake Engineering: Seismic Risk-reduction in NCR Region",style: TextStyle(color: Color(0xffffffff)),),value: "Earthquake Engineering: Seismic Risk-reduction in NCR Region",),
                                //               DropdownMenuItem(child: Text("Sanitation and Solid Waste Management through ICT",style: TextStyle(color: Color(0xffffffff)),),value: "Sanitation and Solid Waste Management through ICT",),
                                //               DropdownMenuItem(child: Text("Storage Dams: Need for flood management",style: TextStyle(color: Color(0xffffffff)),),value: "Storage Dams: Need for flood management",),
                                //               DropdownMenuItem(child: Text("Equity and global climate agreement- A step towards a clean earth",style: TextStyle(color: Color(0xffffffff)),),value: "Equity and global climate agreement- A step towards a clean earth",),
                                //               DropdownMenuItem(child: Text("Futuristic Architecture",style: TextStyle(color: Color(0xffffffff)),),value: "Futuristic Architecture",),
                                //               DropdownMenuItem(child: Text("Civil Engineering Models for- “Skill India”",style: TextStyle(color: Color(0xffffffff)),),value: "Civil Engineering Models for- “Skill India”",),
                                //             ],
                                //             onChanged: (value){
                                //               topic_name= value;
                                //               setState(() {
                                //                 topic_name= value;
                                //               });
                                //             },
                                //             hint: topic_name==null?Text("Synopsis Topic"): Text("$topic_name",style: TextStyle(color: Colors.white),),

                                //           ),
                                //         ],
                                //       ),
                                // ):
                                // domainid==6?
                                // Padding(
                                //       padding: const EdgeInsets.symmetric(horizontal:25.0,vertical: 15),
                                //       child: Row(
                                //         mainAxisAlignment: MainAxisAlignment.center,
                                //         crossAxisAlignment: CrossAxisAlignment.center,
                                //         children: <Widget>[

                                //           DropdownButton<String>(
                                //             items: [
                                //               DropdownMenuItem(child: Text("Has Apple lost its charm after Steve Jobs?",style: TextStyle(color: Color(0xffffffff)),),value: "Has Apple lost its charm after Steve Jobs?",),
                                //               DropdownMenuItem(child: Text("Talent Management- An agile edge over competition",style: TextStyle(color: Color(0xffffffff)),),value: "Talent Management- An agile edge over competition",),
                                //               DropdownMenuItem(child: Text("Traditional management concepts and evolution of Indian Management ethos for future.",style: TextStyle(color: Color(0xffffffff)),),value: "Traditional management concepts and evolution of Indian Management ethos for future.",),
                                //               DropdownMenuItem(child: Text("Is GNH More Important than GDP?",style: TextStyle(color: Color(0xffffffff)),),value: "Is GNH More Important than GDP?",),
                                //               DropdownMenuItem(child: Text("The impact of abolition of Article 370 on the state economy.",style: TextStyle(color: Color(0xffffffff)),),value: "The impact of abolition of Article 370 on the state economy.",),
                                //               DropdownMenuItem(child: Text("Business Intelligence- Alignment of IT and Business.",style: TextStyle(color: Color(0xffffffff)),),value: "Business Intelligence- Alignment of IT and Business.",),
                                //               DropdownMenuItem(child: Text("Social Networking is the prime catalyst in shaping the actions of Indian Youths.",style: TextStyle(color: Color(0xffffffff)),),value: "Social Networking is the prime catalyst in shaping the actions of Indian Youths.",),
                                //               DropdownMenuItem(child: Text("100% FDI in Indian Defense Sector: Boon or Bane.",style: TextStyle(color: Color(0xffffffff)),),value: "100% FDI in Indian Defense Sector: Boon or Bane.",),
                                //               DropdownMenuItem(child: Text("Rural Development is the right answer to our unemployment problem.",style: TextStyle(color: Color(0xffffffff)),),value: "Rural Development is the right answer to our unemployment problem.",),
                                //               DropdownMenuItem(child: Text("Is economic power superior than nuclear power.",style: TextStyle(color: Color(0xffffffff)),),value: "Is economic power superior than nuclear power.",),
                                //             ],
                                //             onChanged: (value){
                                //               topic_name= value;
                                //               setState(() {
                                //                 topic_name= value;
                                //               });
                                //             },
                                //             hint: topic_name==null?Text("Synopsis Topic"): Text("$topic_name",style: TextStyle(color: Colors.white),),

                                //           ),
                                //         ],
                                //       ),
                                // ):
                                //  Container(),

                                //                       ],
                                //                     ),
                                //                   ),
                                SizedBox(
                                  height: 10,
                                ),

                                reupload == "1"
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            reupload = "0";
                                          });
                                        },
                                        child: Card(
                                            color: Color(0xffefb168),
                                            clipBehavior: Clip.antiAlias,
                                            child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.5,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons
                                                            .markunread_mailbox,
                                                        color:
                                                            Color(0xff1f1f1f),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          "Re-upload Synopsis",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff1f1f1f)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ))),
                                      )
                                    : Container(
                                        child: Column(
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () {
                                                //filepicked = true;
                                                filepicker();
                                              },
                                              child: Card(
                                                  color: Color(0xffefb168),
                                                  clipBehavior: Clip.antiAlias,
                                                  child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.5,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Icon(
                                                              Icons
                                                                  .markunread_mailbox,
                                                              color: Color(
                                                                  0xff1f1f1f),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                "Choose File",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xff1f1f1f)),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ))),
                                            ),

                                            //SizedBox(height: 5,),

                                            filepath != null
                                                ? Container(
                                                    child: Text(
                                                    "(File Selected Successfully)",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        color: Colors.white),
                                                  ))
                                                : Container(
                                                    child: Text(
                                                      "(Name of the file must be same as the name of your Team)",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                            SizedBox(
                                              height: 20,
                                            ),

                                            Builder(
                                              builder: (context) =>
                                                  GestureDetector(
                                                onTap: () {
                                                  if (filepath == null ||
                                                      filename == null) {
                                                    _displaySnackBar(context,
                                                        "Please Choose a file before uploading");
                                                  } else {
                                                    upload(filename, filepath);
                                                  }
                                                },
                                                child: Card(
                                                    color: Color(0xffefb168),
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            1.5,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: <Widget>[
                                                              Icon(
                                                                Icons
                                                                    .file_upload,
                                                                color: Color(
                                                                    0xff1f1f1f),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Text(
                                                                  "Upload",
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xff1f1f1f)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ))),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                SizedBox(
                                  height: 10,
                                ),

                                GestureDetector(
                                  onTap: () {
                                    download();
                                  },
                                  child: Card(
                                      color: Color(0xffefb168),
                                      clipBehavior: Clip.antiAlias,
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.5,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.file_download,
                                                  color: Color(0xff1f1f1f),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Download Sample Synopsis",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff1f1f1f)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ))),
                                ),
                                downloading == true
                                    ? Container(
                                        height: 120.0,
                                        width: 200.0,
                                        child: Card(
                                          color: Colors.black,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              CircularProgressIndicator(),
                                              SizedBox(
                                                height: 10.0,
                                              ),
                                              Text(
                                                "Downloading ${progresString}",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ]),
                      )),
                ),
              ),
            ],
          )
        : (progressindicatorvariable)
            ? Scaffold(
                body: Center(
                  child: Container(
                      child: SpinKitWave(
                    color: Color(0xffefb168),
                    type: SpinKitWaveType.start,
                  )),
                ),
              )
            : Scaffold(
                body: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/bgapp.jpg",
                          ),
                          fit: BoxFit.fitWidth)),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        loginclicked
                            ? Container()
                            : Padding(
                                padding: EdgeInsets.only(bottom: 30, top: 30),
                                child: Image.asset("assets/gg.png"),
                              ),

                        loginclicked
                            ? Container()
                            : GestureDetector(
                                child: Card(
                                    color: Color(0xffefb168),
                                    child: Container(
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                150,
                                        child: Center(
                                            child: Text(
                                          "Login",
                                          style: TextStyle(
                                              color: Color(0xff1f1f1f),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )))),
                                onTap: () {
                                  setState(() {
                                    loginclicked = true;
                                  });
                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                                },
                              ),
                        loginclicked
                            ? Center(
                                child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Card(
                                  color: Color(0xff1f1f1f),
                                  elevation: 20,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Form(
                                      key: validatekey,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                loginclicked = false;
                                              });
                                            },
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Icon(
                                                Icons.arrow_back,
                                                color: Color(0xffefb168),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 30, top: 30),
                                            child: Image.asset("assets/gg.png"),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: TextFormField(
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                              validator: (value) {
                                                if (value == null) {
                                                  return "Enter the Team name";
                                                } else
                                                  return null;
                                              },
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                // fillColor: Color(0xffefb168),
                                                hintText: "Team Name(Case Sensitive)",
                                                alignLabelWithHint: true,
                                                labelText: "Team Name",
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xffefb168),
                                                      style: BorderStyle.solid,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xffffffff),
                                                      style: BorderStyle.solid,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                              ),
                                              onSaved: (value) {
                                                teamname = value;
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 10.0),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: TextFormField(
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                              validator: (value) {
                                                if (value == null) {
                                                  return "Enter the Password";
                                                } else
                                                  return null;
                                              },
                                              keyboardType: TextInputType.text,
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                // fillColor: Color(0xffefb168),
                                                hintText: "Password",
                                                alignLabelWithHint: true,
                                                labelText: "Password",
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xffefb168),
                                                      style: BorderStyle.solid,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xffffffff),
                                                      style: BorderStyle.solid,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                              ),
                                              onSaved: (value) {
                                                password = value;
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 10.0),
                                          GestureDetector(
                                            onTap: () {
                                              validatekey.currentState.save();
                                              if (teamname.isEmpty ||
                                                  password.isEmpty)
                                                _displaySnackBar(context,
                                                    "Please Fill all the entries");
                                              else
                                                loginFunction();

                                              print(password);
                                            },
                                            child: Card(
                                                color: Color(0xffefb168),
                                                clipBehavior: Clip.antiAlias,
                                                child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1.5,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons.person,
                                                            color: Color(
                                                                0xff1f1f1f),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Text(
                                                              "Log-in",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff1f1f1f)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ))),
                                          ),
                                          /*RaisedButton(
                                                onPressed: () {
                                                  loginFunction();
                                                },
                                                child: Text("Login"),
                                              )*/
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                            : Container(),
                        loginclicked
                            ? Container()
                            : GestureDetector(
                                child: Card(
                                    color: Color(0xffefb168),
                                    child: Container(
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                150,
                                        child: Center(
                                            child: Text(
                                          "Register",
                                          style: TextStyle(
                                              color: Color(0xff1f1f1f),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )))),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register()));
                                },
                              ),
                        // Image.asset("assets/Light.gif",height: 200,)
                      ],
                    ),
                  ),
                ),
              );
  }

  _displaySnackBar(BuildContext context, String a) {
    final snackBar = SnackBar(content: Text(a));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  descriptionbox(String title, String descript) {
    var alert = AlertDialog(
      content: Container(
        child: Text(
          descript,
          style: TextStyle(color: Colors.white, fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Color(0xffefb168),
      title: Text(
        title,
        style: TextStyle(
          color: Color(0xffefb168),
          fontSize: 25.0,
        ),
        textAlign: TextAlign.center,
      ),
      elevation: 20,
      actions: <Widget>[
        FlatButton(
          child: Text("Back"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );

    showDialog(context: context, child: alert);
  }
}
