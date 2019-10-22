import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// import 'package:scrolls/loginscreen/loginregistation.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterState();
  }
}

String domain_name;
String topic_name;
bool hostel = false;
var pageloading = false;

class RegisterState extends State<Register> {
  GlobalKey<FormState> validatekey = GlobalKey<FormState>();

  String firstName;
  String lastName;
  String email;
  String numberofmember = '2';
  String teaName;

  String mobileNumber;

  String firstMemberfirstName;
  String firstMemberEmail;
  String secondMemberfirstName;
  String secondMemberEmail;
  String thirdMemberfirstName;
  String thirdMemberEmail;
  String thirdMemberLastname;
  String password;
  String confirmPassword;

  String member1lastname;
  String member2lastname;
  String division = '1';

  bool twomember = true;
  bool fourmember = false;
  bool threemember = false;

  Future<void> registationFunction() {

    pageloading = true;

    setState(() {
      
    });

    Map<String, dynamic> registationdata;

    //for 2 number of people

    if (numberofmember == "2") {
      registationdata = {
        "first_name": firstName,
        "email": email,
        "last_name": lastName,
        "team_name": teaName,
        "mob_no": mobileNumber,
        "member1_name": firstMemberfirstName,
        "member1_email": firstMemberEmail,
        "member1_last_name": member1lastname,
        "div": division,
        "password": password,
        "password_confirmation": confirmPassword,
        "no_member": numberofmember
      };
    }
    //for 3 number of people

    else if (numberofmember == "3") {
      registationdata = {
        "first_name": firstName,
        "email": email,
        "last_name": lastName,
        "team_name": teaName,
        "mob_no": mobileNumber,
        "member1_name": firstMemberfirstName,
        "member1_email": firstMemberEmail,
        "member1_last_name": member1lastname,
        "member2_name": secondMemberfirstName,
        "member2_last_name": member2lastname,
        "member2_email": secondMemberEmail,
        "div": division,
        "password": password,
        "password_confirmation": confirmPassword,
        "no_member": numberofmember
      };
    }
    //for 4 number of people

    else if (numberofmember == "4") {
      registationdata = {
        "first_name": firstName,
        "email": email,
        "last_name": lastName,
        "team_name": teaName,
        "mob_no": mobileNumber,
        "no_member": numberofmember,
        "member1_name": firstMemberfirstName,
        "member1_email": firstMemberEmail,
        "member1_last_name": member1lastname,
        "member2_name": secondMemberfirstName,
        "member2_last_name": member2lastname,
        "member2_email": secondMemberEmail,
        "member3_name": thirdMemberfirstName,
        "member3_last_name": thirdMemberLastname,
        "member3_email": thirdMemberEmail,
        "div": division,
        "password": password,
        "password_confirmation": confirmPassword
      };
    }

    http.post("https://abh2019.herokuapp.com/api/leader",
        body: json.encode(registationdata),
        headers: {
          "Content-Type": "application/json"
        }).then((http.Response response) {
      var responsedata = json.decode(response.body);
      print(responsedata);

      if(responsedata["status"]=="done")
      {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Color(0xffefb168),
                content: Text("Registration Success"),
                title: Text("Success"),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      "Okay",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                     
                      Navigator.pop(context);

                      // authkey.currentState.reset();
                    },
                  )
                ],
              );
            });

             pageloading=false;
             setState(() {
               
             });
      }
      else{
        if(responsedata["status"]=="failed")
        {
          descriptionbox("Failure", "${responsedata["errors"][0]["msg"]}");
          pageloading = false;
          setState(() {
            
          });
        }
      }
    });
  }

  // Future<void> registrationFunction() async {
  //   setState(() {
  //    pageloading=true;
  //   });
  //   Map<String, dynamic> registationdata;
  //   if(secondMemberfirstName==null || secondMemberEmail==null){
  //   registationdata = {
  //     "first_name": firstName,
  //     "email":email,
  //     "last_name": lastName,
  //     "team_name":teaName,
  //     "mob_no": mobileNumber,
  //     "college": collegeName,
  //     "member1_name":firstMemberfirstName ,
  //     "member1_email": firstMemberEmail,
  //     "member1_last_name":member1lastname,

  //     // "member2_email": secondMemberEmail,
  //     // "member2_name": secondMemberName,
  //     "domain_id":domainId,
  //     // "topic_id": 1,
  //     "status":"leader",
  //     "hostel_accomodation": 1,
  //     "password": password,
  //     "password_confirmation": confirmPassword
  //   };
  //   }
  //   else{
  //       registationdata = {
  //     "first_name": firstName,
  //     "email":email,
  //     "last_name": lastName,
  //     "team_name":teaName,
  //     "mob_no": mobileNumber,
  //     "college": collegeName,
  //     "member1_name": firstMemberfirstName,
  //     "member1_email": firstMemberEmail,
  //     "member2_email": secondMemberEmail,
  //     "member2_name": secondMemberfirstName,
  //     "member1_last_name":member1lastname,
  //     "member2_last_name":member2lastname,
  //     "domain_id":domainId,
  //     // "topic_id": 1,
  //     "status":"leader",
  //     "hostel_accomodation": 1,
  //     "password":password,
  //     "password_confirmation": confirmPassword
  //   };
  //   }

  //   http.post("https://scrolls19-backend.herokuapp.com/api/register/leader",
  //       body: json.encode(registationdata),
  //       headers: {"Content-Type": "application/json"}).then((http.Response response){
  //         var responsedata=json.decode(response.body);
  //         print("Shashak");
  //         print(response.body);
  //         print(response.statusCode);
  //         if(response.statusCode==200){
  //            showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             content: Text("Successfully Registered !! \n login"),
  //             title: Text("Sucess"),
  //             actions: <Widget>[
  //               FlatButton(
  //                 child: Text("Okay"),
  //                 onPressed: () {

  //           setState(() {
  //            pageloading=false;
  //           });
  //                   Navigator.of(context).pop();
  //                   Navigator.pop(context);
  //                  // authkey.currentState.reset();
  //                 },
  //               )
  //             ],
  //           );
  //         });
  //           // setState(() {
  //           //  pageloading=false;
  //           // });
  //           // Navigator.pop(context);
  //         }
  //         else if(response.statusCode==422){
  //            setState(() {
  //            pageloading=false;
  //           });
  //            showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             content: Text("User Already Exist"),
  //             title: Text("Failure"),
  //             actions: <Widget>[
  //               FlatButton(
  //                 child: Text("Okay"),
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                  // authkey.currentState.reset();
  //                 },
  //               )
  //             ],
  //           );
  //         });
  //         }
  //         else if(response.statusCode==500){
  //            setState(() {
  //            pageloading=false;
  //           });
  //            showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             content: Text("Member already exist"),
  //             title: Text("Failure"),
  //             actions: <Widget>[
  //               FlatButton(
  //                 child: Text("Okay"),
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                  // authkey.currentState.reset();
  //                 },
  //               )
  //             ],
  //           );
  //         });
  //         }
  //         else{
  //           setState(() {
  //            pageloading=false;
  //           });
  //            showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             content: Text("Something went wrong,please register again"),
  //             title: Text("Failure"),
  //             actions: <Widget>[
  //               FlatButton(
  //                 child: Text("Okay"),
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                  // authkey.currentState.reset();
  //                 },
  //               )
  //             ],
  //           );
  //         });
  //         }

  //       });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 423.5293998850261;
    double height = MediaQuery.of(context).size.height / 704.705862586474;
    // TODO: implement build
    return pageloading
        ? Scaffold(
            body: Center(
              child: SpinKitWave(
                color: Color(0xffefb168),
                type: SpinKitWaveType.start,
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Color(0xff1f1f1f),
            appBar: AppBar(
              leading: new IconButton(
                icon: new Icon(Icons.arrow_back, color: Color(0XFFEFB168)),
                onPressed: () => Navigator.of(context).pop(),
              ),
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
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      elevation: 20,
                      color: Color(0xff1f1f1f),
                      child: Container(
                        child: Form(
                          key: validatekey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Center(
                                  child: Text(
                                    "Let's Start with your Name",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xffefb168),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: TextFormField(
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                          validator: (value) {
                                            if (value == null) {
                                              return "Enter the First name";
                                            } else
                                              return null;
                                          },
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            // fillColor: Color(0xffefb168),
                                            hintText: "First Name",
                                            alignLabelWithHint: true,
                                            labelText: "First Name",
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white,
                                                  style: BorderStyle.solid,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xffffffff),
                                                  style: BorderStyle.solid,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                          ),
                                          onSaved: (value) {
                                            firstName = value;
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3.0,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: TextFormField(
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                          validator: (value) {
                                            if (value == null) {
                                              return "Enter the First name";
                                            } else
                                              return null;
                                          },
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            hintText: "Last Name",
                                            labelText: "Last Name",
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white,
                                                  style: BorderStyle.solid,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xffffffff),
                                                  style: BorderStyle.solid,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                          ),
                                          onSaved: (value) {
                                            lastName = value;
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(15.0),
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return "Enter the First name";
                                    } else
                                      return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                    labelText: "Email",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffffffff),
                                          style: BorderStyle.solid,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                  onSaved: (value) {
                                    email = value;
                                  },
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return "Enter the First name";
                                    } else
                                      return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "Mobile Number",
                                    labelText: "Mobile Number",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffffffff),
                                          style: BorderStyle.solid,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                  onSaved: (value) {
                                    mobileNumber = value;
                                  },
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(top: 20, bottom: 10),
                                child: Center(
                                  child: Text(
                                    "Now, a Good Name for the Team.",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xffefb168),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(15.0),
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
                                    hintText: "Team Name(Case Sensitive)",
                                    labelText: "Team Name",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffffffff),
                                          style: BorderStyle.solid,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                  onSaved: (value) {
                                    teaName = value;
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20, bottom: 10),
                                child: Center(
                                  child: Text(
                                    " Select Division ",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xffefb168),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),

                              //division row for registation
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 20),
                                      child: GestureDetector(
                                        onTap: () {
                                          division = '1';
                                          print(division);
                                          setState(() {});
                                        },
                                        child: Card(
                                          elevation: 10,
                                          color: division == "1"
                                              ? Color(0xffefb168)
                                              : Color(0xff1f1f1f),
                                          child: Container(
                                              height: 40,
                                              child: division == "1"
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons
                                                              .radio_button_checked,
                                                          color: Colors.white,
                                                          size: 13,
                                                        ),
                                                        SizedBox(
                                                          width: 7,
                                                        ),
                                                        Text("DIV 1",
                                                            style: TextStyle(
                                                              fontSize: 10,
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                      ],
                                                    )
                                                  : Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons
                                                              .radio_button_unchecked,
                                                          color:
                                                              Color(0xffefb168),
                                                          size: 13,
                                                        ),
                                                        SizedBox(
                                                          width: 7,
                                                        ),
                                                        Text(
                                                          "DIV 1",
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color: Color(
                                                                  0xffefb168)),
                                                        ),
                                                      ],
                                                    )),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          division = '2';
                                          print(division);
                                          setState(() {});
                                        },
                                        child: Card(
                                          elevation: 10,
                                          color: division == '2'
                                              ? Color(0xffefb168)
                                              : Color(0xff1f1f1f),
                                          child: Container(
                                              height: 40,
                                              child: division == '2'
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons
                                                              .radio_button_checked,
                                                          color: Colors.white,
                                                          size: 13,
                                                        ),
                                                        SizedBox(
                                                          width: 7,
                                                        ),
                                                        Text(
                                                          "DIV 2",
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ],
                                                    )
                                                  : Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons
                                                              .radio_button_unchecked,
                                                          color:
                                                              Color(0xffefb168),
                                                          size: 13,
                                                        ),
                                                        SizedBox(
                                                          width: 7,
                                                        ),
                                                        Text(
                                                          "DIV 2",
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color: Color(
                                                                  0xffefb168)),
                                                        ),
                                                      ],
                                                    )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 50,
                              ),
                              Text(
                                "Leader's Password",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xffefb168),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(15.0),
                                child: TextFormField(
                                  obscureText: true,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return "Enter the First name";
                                    } else
                                      return null;
                                  },
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    labelText: "Password",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffffffff),
                                          style: BorderStyle.solid,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                  onSaved: (value) {
                                    password = value;
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(15.0),
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return "Enter the confirm Password";
                                    } else
                                      return null;
                                  },
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Confirm Password",
                                    labelText: "Confirm Password",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffffffff),
                                          style: BorderStyle.solid,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                  onSaved: (value) {
                                    confirmPassword = value;
                                  },
                                ),
                              ),

                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "No. of Team Members",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xffefb168),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 20),
                                      child: GestureDetector(
                                        onTap: () {
                                          twomember = true;
                                          numberofmember = '2';
                                          threemember = false;
                                          fourmember = false;
                                          setState(() {});
                                        },
                                        child: Card(
                                          elevation: 10,
                                          color: twomember == true
                                              ? Color(0xffefb168)
                                              : Color(0xff1f1f1f),
                                          child: Container(
                                              height: 40,
                                              child: twomember == true
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons
                                                              .radio_button_checked,
                                                          color: Colors.white,
                                                          size: 13,
                                                        ),
                                                        SizedBox(
                                                          width: 7,
                                                        ),
                                                        Text("TWO MEMBERS",
                                                            style: TextStyle(
                                                              fontSize: 10,
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                      ],
                                                    )
                                                  : Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons
                                                              .radio_button_unchecked,
                                                          color:
                                                              Color(0xffefb168),
                                                          size: 13,
                                                        ),
                                                        SizedBox(
                                                          width: 7,
                                                        ),
                                                        Text(
                                                          "TWO MEMBERS",
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color: Color(
                                                                  0xffefb168)),
                                                        ),
                                                      ],
                                                    )),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          threemember = true;
                                          twomember = false;
                                          numberofmember = "3";
                                          fourmember = false;
                                          setState(() {});
                                        },
                                        child: Card(
                                          elevation: 10,
                                          color: threemember
                                              ? Color(0xffefb168)
                                              : Color(0xff1f1f1f),
                                          child: Container(
                                              height: 40,
                                              child: threemember
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons
                                                              .radio_button_checked,
                                                          color: Colors.white,
                                                          size: 13,
                                                        ),
                                                        SizedBox(
                                                          width: 7,
                                                        ),
                                                        Text(
                                                          "THREE MEMBERS",
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ],
                                                    )
                                                  : Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons
                                                              .radio_button_unchecked,
                                                          color:
                                                              Color(0xffefb168),
                                                          size: 13,
                                                        ),
                                                        SizedBox(
                                                          width: 7,
                                                        ),
                                                        Text(
                                                          "THREE MEMBERS",
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color: Color(
                                                                  0xffefb168)),
                                                        ),
                                                      ],
                                                    )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 80),
                                child: GestureDetector(
                                  onTap: () {
                                    fourmember = true;
                                    numberofmember = '4';
                                    twomember = false;
                                    threemember = false;
                                    // twomember = !twomember;
                                    setState(() {});
                                  },
                                  child: Card(
                                    elevation: 10,
                                    color: fourmember
                                        ? Color(0xffefb168)
                                        : Color(0xff1f1f1f),
                                    child: Container(
                                        height: 40,
                                        child: fourmember
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.radio_button_checked,
                                                    color: Colors.white,
                                                    size: 13,
                                                  ),
                                                  SizedBox(
                                                    width: 7,
                                                  ),
                                                  Text(
                                                    "FOUR MEMBERS",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              )
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons
                                                        .radio_button_unchecked,
                                                    color: Color(0xffefb168),
                                                    size: 13,
                                                  ),
                                                  SizedBox(
                                                    width: 7,
                                                  ),
                                                  Text(
                                                    "FOUR MEMBERS",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color:
                                                            Color(0xffefb168)),
                                                  ),
                                                ],
                                              )),
                                  ),
                                ),
                              ),
                              //yaha lagana hai
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0,
                                    right: 15.0,
                                    top: 35,
                                    bottom: 35),
                                child: twomember
                                    ? Text(
                                        "Member Details",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xffefb168),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : Container(),
                              ),
                              //buttons ui made only members name bache hai
                              threemember || fourmember
                                  ? Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Container(
                                        child: Text(
                                          "1st Member Details",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xffefb168),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ))
                                  : Container(),
                              // : Padding(
                              //     padding: EdgeInsets.only(top: 30, bottom: 20),
                              //     child: Container(
                              //       child: Text(
                              //         "Member Details",
                              //         style: TextStyle(
                              //           fontSize: 20,
                              //           color: Color(0xffefb168),
                              //           fontWeight: FontWeight.bold,
                              //         ),
                              //       ),
                              //     ),
                              //   ),

                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 10.0),
                                        child: TextFormField(
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                          validator: (value) {
                                            if (value == null) {
                                              return "Enter the First name";
                                            } else
                                              return null;
                                          },
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            // fillColor: Color(0xffefb168),
                                            hintText: "First Name",
                                            alignLabelWithHint: true,
                                            labelText: "First Name",
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white,
                                                  style: BorderStyle.solid,
                                                  width: 1),
                                              borderRadius: BorderRadius.circular(
                                                  15.0), //ye first member ka hai
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xffffffff),
                                                  style: BorderStyle.solid,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                          ),
                                          onSaved: (value) {
                                            firstMemberfirstName = value;
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3.0,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: TextFormField(
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                          validator: (value) {
                                            if (value == null) {
                                              return "Enter the First name";
                                            } else
                                              return null;
                                          },
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            hintText: "Last Name",
                                            labelText: "Last Name",
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white,
                                                  style: BorderStyle.solid,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xffffffff),
                                                  style: BorderStyle.solid,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                          ),
                                          onSaved: (value) {
                                            member1lastname =
                                                value; //ye first member ka hai
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 15, right: 15, bottom: 20),
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return "Enter the e-mail";
                                    } else
                                      return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    hintText: "Member e-mail",
                                    labelText: "Member e-mail",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffffffff),
                                          style: BorderStyle.solid,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                  onSaved: (value) {
                                    firstMemberEmail = value;
                                  },
                                ),
                              ),
                              threemember || fourmember
                                  ? Padding(
                                      padding:
                                          EdgeInsets.only(top: 40, bottom: 20),
                                      child: Container(
                                        child: Text(
                                          "2nd Member Details",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xffefb168),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                              threemember || fourmember
                                  ? Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, right: 10.0),
                                              child: TextFormField(
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                validator: (value) {
                                                  if (value == null) {
                                                    return "Enter the First name";
                                                  } else
                                                    return null;
                                                },
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  // fillColor: Color(0xffefb168),
                                                  hintText: "First Name",
                                                  alignLabelWithHint: true,
                                                  labelText: "First Name",
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white,
                                                        style:
                                                            BorderStyle.solid,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xffffffff),
                                                        style:
                                                            BorderStyle.solid,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0),
                                                  ),
                                                ),
                                                onSaved: (value) {
                                                  //ye second member ka hai
                                                  secondMemberfirstName = value;
                                                },
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3.0,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: TextFormField(
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                validator: (value) {
                                                  if (value == null) {
                                                    return "Enter the First name";
                                                  } else
                                                    return null;
                                                },
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  hintText: "Last Name",
                                                  labelText: "Last Name",
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white,
                                                        style:
                                                            BorderStyle.solid,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xffffffff),
                                                        style:
                                                            BorderStyle.solid,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0),
                                                  ),
                                                ),
                                                onSaved: (value) {
                                                  member2lastname =
                                                      value; //ye second member ka hai
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : Container(),
                              threemember || fourmember
                                  ? Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: TextFormField(
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                        validator: (value) {
                                          if (value == null) {
                                            return "Enter the First name";
                                          } else
                                            return null;
                                        },
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          hintText: "Member e-mail",
                                          labelText: "Member e-mail",
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                style: BorderStyle.solid,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffffffff),
                                                style: BorderStyle.solid,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                        ),
                                        onSaved: (value) {
                                          setState(() {
                                            secondMemberEmail = value;
                                          });
                                        },
                                      ),
                                    )
                                  : Container(),
                              fourmember
                                  ? Padding(
                                      padding:
                                          EdgeInsets.only(top: 30, bottom: 20),
                                      child: Container(
                                        child: Text(
                                          "3rd Member Details",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xffefb168),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ))
                                  : Container(),

                              //four member details
                              fourmember
                                  ? Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, right: 10.0),
                                              child: TextFormField(
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                validator: (value) {
                                                  if (value == null) {
                                                    return "Enter the First name";
                                                  } else
                                                    return null;
                                                },
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  // fillColor: Color(0xffefb168),
                                                  hintText: "First Name",
                                                  alignLabelWithHint: true,
                                                  labelText: "First Name",
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white,
                                                        style:
                                                            BorderStyle.solid,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xffffffff),
                                                        style:
                                                            BorderStyle.solid,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0),
                                                  ),
                                                ),
                                                onSaved: (value) {
                                                  //ye second member ka hai
                                                  thirdMemberfirstName = value;
                                                },
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3.0,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: TextFormField(
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                validator: (value) {
                                                  if (value == null) {
                                                    return "Enter the First name";
                                                  } else
                                                    return null;
                                                },
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  hintText: "Last Name",
                                                  labelText: "Last Name",
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white,
                                                        style:
                                                            BorderStyle.solid,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xffffffff),
                                                        style:
                                                            BorderStyle.solid,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0),
                                                  ),
                                                ),
                                                onSaved: (value) {
                                                  thirdMemberLastname =
                                                      value; //ye second member ka hai
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : Container(),
                              //four member emails

                              fourmember
                                  ? Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: TextFormField(
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                        validator: (value) {
                                          if (value == null) {
                                            return "Enter the First name";
                                          } else
                                            return null;
                                        },
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          hintText: "Member e-mail",
                                          labelText: "Member e-mail",
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                style: BorderStyle.solid,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffffffff),
                                                style: BorderStyle.solid,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                        ),
                                        onSaved: (value) {
                                          setState(() {
                                            thirdMemberEmail = value;
                                          });
                                        },
                                      ),
                                    )
                                  : Container(),

                              Builder(
                                builder: (context) => Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Center(
                                    child: RaisedButton(
                                      color: Color(0xffefb168),
                                      onPressed: () {
                                        // validatekey.currentState.validate();
                                        validatekey.currentState.save();
                                        if (twomember) {
                                          if (firstName.isEmpty ||
                                              lastName.isEmpty ||
                                              email.isEmpty ||
                                              teaName.isEmpty ||
                                              mobileNumber.isEmpty ||
                                              firstMemberEmail.isEmpty ||
                                              firstMemberfirstName.isEmpty ||
                                              password.isEmpty ||
                                              confirmPassword.isEmpty ||
                                              member1lastname.isEmpty) {
                                            _displaySnackBar(context,
                                                "Please Fill all the details");
                                          } else if (mobileNumber.length !=
                                              10) {
                                            _displaySnackBar(context,
                                                "Please Fill a valid mobile no.");
                                          } else if (password
                                                  .compareTo(confirmPassword) !=
                                              0) {
                                            _displaySnackBar(context,
                                                "Entered Passwords don't match.");
                                          } else if (!RegExp(
                                                  r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(email))
                                            _displaySnackBar(context,
                                                "Please Fill a valid Leader email");
                                          else if (!RegExp(
                                                      r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                  .hasMatch(email) &&
                                              !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                  .hasMatch(firstMemberEmail))
                                            _displaySnackBar(context,
                                                "Please Fill a valid Member email");
                                          else if (email == firstMemberEmail)
                                            _displaySnackBar(context,
                                                "Member's and Leader's email can not be same");
                                          else if (password.length < 8)
                                            _displaySnackBar(context,
                                                "Password must be atleast 8 characters long");
                                          else {
                                            registationFunction();
                                          }
                                        } else if (threemember) {
                                          if (firstName.isEmpty ||
                                              lastName.isEmpty ||
                                              email.isEmpty ||
                                              teaName.isEmpty ||
                                              mobileNumber.isEmpty ||
                                              firstMemberEmail.isEmpty ||
                                              firstMemberfirstName.isEmpty ||
                                              member1lastname.isEmpty ||
                                              password.isEmpty ||
                                              confirmPassword.isEmpty ||
                                              secondMemberEmail.isEmpty ||
                                              secondMemberfirstName.isEmpty ||
                                              member2lastname.isEmpty) {
                                            _displaySnackBar(context,
                                                "Please Fill all the details");
                                          } else if (mobileNumber.length !=
                                              10) {
                                            _displaySnackBar(context,
                                                "Please Fill a valid mobile no.");
                                          } else if (!RegExp(
                                                  r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(email))
                                            _displaySnackBar(context,
                                                "Please Fill a valid Leader email");
                                          else if (!RegExp(
                                                      r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                  .hasMatch(firstMemberEmail) &&
                                              !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                  .hasMatch(secondMemberEmail))
                                            _displaySnackBar(context,
                                                "Please Fill a valid Member email");
                                          else if (password.length < 8)
                                            _displaySnackBar(context,
                                                "Password must be atleast 8 characters long");
                                          else if (email == firstMemberEmail ||
                                              firstMemberEmail ==
                                                  secondMemberEmail)
                                            _displaySnackBar(context,
                                                "Member's and Leader's email can not be same");
                                          else if (email == secondMemberEmail)
                                            _displaySnackBar(context,
                                                "Member's and Leader's email can not be same");
                                          else if (password
                                                  .compareTo(confirmPassword) !=
                                              0) {
                                            _displaySnackBar(context,
                                                "Entered Passwords don't match.");
                                          } else {
                                            registationFunction();
                                          }
                                        } else if (fourmember) {
                                          if (firstName.isEmpty ||
                                              lastName.isEmpty ||
                                              email.isEmpty ||
                                              teaName.isEmpty ||
                                              mobileNumber.isEmpty ||
                                              firstMemberEmail.isEmpty ||
                                              firstMemberfirstName.isEmpty ||
                                              member1lastname.isEmpty ||
                                              password.isEmpty ||
                                              confirmPassword.isEmpty ||
                                              secondMemberEmail.isEmpty ||
                                              secondMemberfirstName.isEmpty ||
                                              member2lastname.isEmpty ||
                                              thirdMemberEmail.isEmpty ||
                                              thirdMemberfirstName.isEmpty ||
                                              thirdMemberLastname.isEmpty) {
                                            _displaySnackBar(context,
                                                "Please Fill all the details");
                                          } else if (mobileNumber.length !=
                                              10) {
                                            _displaySnackBar(context,
                                                "Please Fill a valid mobile no.");
                                          } else if (!RegExp(
                                                  r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(email))
                                            _displaySnackBar(context,
                                                "Please Fill a valid Leader email");
                                          else if (!RegExp(
                                                      r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                  .hasMatch(firstMemberEmail) &&
                                              !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                  .hasMatch(
                                                      secondMemberEmail) &&
                                              !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                  .hasMatch(thirdMemberEmail))
                                            _displaySnackBar(context,
                                                "Please Fill a valid Member email");
                                          else if (password.length < 8)
                                            _displaySnackBar(context,
                                                "Password must be atleast 8 characters long");
                                          else if (email == firstMemberEmail ||
                                              firstMemberEmail ==
                                                  secondMemberEmail ||
                                              firstMemberEmail ==
                                                  thirdMemberEmail ||
                                              thirdMemberEmail ==
                                                  secondMemberEmail ||
                                              thirdMemberEmail == email)
                                            _displaySnackBar(context,
                                                "Member's and Leader's email can not be same");
                                          else if (email == secondMemberEmail)
                                            _displaySnackBar(context,
                                                "Member's and Leader's email can not be same");
                                          else if (password
                                                  .compareTo(confirmPassword) !=
                                              0) {
                                            _displaySnackBar(context,
                                                "Entered Passwords don't match.");
                                          } else {
                                            registationFunction();
                                          }
                                        }
                                      },
                                      child: Text(
                                        "SUBMIT",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
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
          // style: TextStyle(
          //   color: Colors.white,
          //   fontSize: 18.0
          // ),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Color(0xffefb168),
      title: Text(
        title,
        // style: TextStyle(
        //   color: Color(0xffefb168),
        //   fontSize: 25.0,
        // ),
        textAlign: TextAlign.center,
      ),
      elevation: 20,
      actions: <Widget>[
        FlatButton(
          child: Text("Back", style: TextStyle(color: Colors.black),),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );

    showDialog(context: context, child: alert);
  }
}
