import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:countdown/countdown.dart';
//import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import 'package:abhiyantriki/Domain/domains.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

DateTime now = DateTime.now();
String string = DateFormat('dd').format(now);
String string1 = DateFormat('MM').format(now);
int date = int.parse(string);
int month = int.parse(string1);

int dayleft = 62;
int start = 25;

class HomeState extends State<Home> {
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

//   //computer varibles
//   List<String>computertopicsname=["Cloud Computing","Deep Learning","Machine Learning","IoT and IoT based Technologies","Cyber Security","Augmented Reality","Big Data and Analysis","Cryptocurrency (Blockchain)","Wireless Sensor Network (WSN)","Semantic Web: Sentament Analysis of Twitter/Facebook","Quantum Computing"];
//   // List<String>computertopicsdescription=["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ","FdsgfuyGFYGYUF","DGHSVFGSDFG","zfgbsvkfdg","chgSAYCFashjd"];
//   List<String>computerimageurl=["https://sevaa.com/app/uploads/2018/08/featured-image-cloud-computing.png","https://www.pngkey.com/png/detail/876-8762622_our-technology-deep-learning-icon-png.png","https://res.cloudinary.com/springboard-images/image/upload/q_auto,f_auto,fl_lossy/wordpress/2019/02/sb-blog-ai.png","https://www.happiestminds.com/Insights/internet-of-things/images1/what-is-lot.png","https://www.cpomagazine.com/wp-content/uploads/2018/11/does-ai-pose-more-of-a-threat-to-cybersecurity-than-we-think_1500.jpg","https://images.theconversation.com/files/245627/original/file-20181114-194494-1p82jkx.jpg?ixlib=rb-1.1.0&rect=44%2C368%2C4928%2C2464&q=45&auto=format&w=1356&h=668&fit=crop","https://progressive.in/wp-content/uploads/2018/01/big-data.png","https://s.yimg.com/ny/api/res/1.2/bzIv2VpDjWvBoSq8AULQ2g--~A/YXBwaWQ9aGlnaGxhbmRlcjtzbT0xO3c9NTMzO2g9MzU1/http://media.zenfs.com/en-US/homerun/coin_rivet_596/92b908a4572b1c51a3736dc5dfa2bc6b","https://i.ytimg.com/vi/W1aMmCZ25fw/maxresdefault.jpg","",""];
//   //mechanical varibles
//   List<String>mechanicaltopicsname=["Computer Aided Engineering(CAE)","Smart Materials","Anti-Locking Braking System","Green Manufacturing","Biomimetics - Innovation among Nature","Rapid Prototyping","MEMS - Micro Electro Mechanical System","Power Generation using Nanotubes","Automatic Transmission in Automobiles","Product Data Management","TQM Concepts of Zero Rejections","Nano Technology"];
//   // List<String>mechanicaltopicsdescription=["fbEGFYUgefyug","FdsgfuyGFYGYUF","DGHSVFGSDFG","zfgbsvkfdg","chgSAYCFashjd"];
//   List<String>mechanicalimageurl=["","","","","",""];
//  //electrical varibles
//   List<String>electricaltopicsname=["Wireless Power Transmission","Floating Power Plant: Power Ship","Hybrid Electric Vehicles","Humanoid Robotics","Power Quality Issues with Grid Connected Wind Energy Systems","Renewable Energy and Environment Protection","Smart Grid Technology","Electrodynamic Tether","Super Conducting Rotating Machine","Artificial Intelligence in Power Stations","Artificial Neural Network based Power System"];
//   // List<String>electricaltopicsdescription=["fbEGFYUgefyug","FdsgfuyGFYGYUF","DGHSVFGSDFG","zfgbsvkfdg","chgSAYCFashjd"];
//   List<String>electricalimageurl=["","","","","",""];
//     //electronics varibles
//   List<String>electonicstopicsname=["OLEDs(Organic Light Emitting Diodes)","Surveilance Cameras","Humanoid Robots","Autonomic Computing","Flexible Electronics & Displays","Laser Communication System","Biomedical Sensors","Hybrid Cars","Smart Antenna","Cellonics Technology"];
//   // List<String>electonicstopicsdescription=["fbEGFYUgefyug","FdsgfuyGFYGYUF","DGHSVFGSDFG","zfgbsvkfdg","chgSAYCFashjd"];
//   List<String>electonicsimageurl=["","","","","",""];
//   //civilvaribles
//   List<String>civiltopicsname=["Modern Concepts of Rural Road Developement","Underwater Concreting","Marine Pollution","Indian Railway: Ensuring last mile connectivity","Earthquake Engineering: Seismic Risk-reduction in NCR Region","Sanitation and Solid Waste Management through ICT","Storage Dams: Need for flood management","Equity and global climate agreement- A step towards a clean earth","Futuristic Architecture","Civil Engineering Models for- “Skill India”"];
//   // List<String>civiltopicsdescription=["fbEGFYUgefyug","FdsgfuyGFYGYUF","DGHSVFGSDFG","zfgbsvkfdg","chgSAYCFashjd"];
//   List<String>civilimageurl=["","","","","",""];
//     //management varibles
//   List<String>managementtopicsname=["Has Apple lost its charm after Steve Jobs?","Talent Management- An agile edge over competition","Traditional management concepts and evolution of Indian Management ethos for future","Is GNH More Important than GDP?","The impact of abolition of Article 370 on the state economy","Business Intelligence- Alignment of IT and Business","Social Networking is the prime catalyst in shaping the actions of Indian Youths","100% FDI in Indian Defense Sector: Boon or Bane","Rural Development is the right answer to our unemployment problem","Is economic power superior than nuclear power"];
//   // List<String>managementtopicsdescription=["fbEGFYUgefyug","FdsgfuyGFYGYUF","DGHSVFGSDFG","zfgbsvkfdg","chgSAYCFashjd"];
//   List<String>managementimageurl=["","","","","",""];
  List<String> computertopicsname = [
    "Cloud Computing",
    "Deep Learning",
    "Machine Learning",
    "IoT and IoT based Technologies",
    "Cyber Security",
    "Augmented Reality",
    "Big Data and Analysis",
    "Cryptocurrency (Blockchain)",
    "Wireless Sensor Network (WSN)",
    "Semantic Web: Sentament Analysis of Twitter/Facebook",
    "Quantum Computing"
  ];
  // List<String>computertopicsdescription=["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ","FdsgfuyGFYGYUF","DGHSVFGSDFG","zfgbsvkfdg","chgSAYCFashjd"];
  List<String> computerimageurl = [
    "di1.png",
    "di2.png",
    "di3.png",
    "di4.png",
    "di5.png",
    "di6.png",
    "di7.png",
    "di8.png",
    "div9.png",
    "icon_education.png",
  ];
  List<String> div1topics = [
    "Hospital Care Management System",
    "Library Management System",
    "Canteen Management System",
    "End to End Chat Application System",
    "Ticket Booking Management System",
    "Lifestyle E- Commerce Management System",
    "Job Finder Management System",
    "E- Dhobi Management System",
    "Product Delivery Management System",
    "Open Innovation"
  ];

  List<String> div2desc = [
    "Designing devices which would help in easing communication chennels between various communication devices and points.",
    "Designing devices that would help in managing healthcare better.",
    "Designing devices keeping in mind the need to enhance the primary sector of India - Agriculture and the lives of our Rural Population.",
    "Creating intelligent devices to improve commutation facilities, quality of travel experience and overall travel safety features hardware.",
    "Creating state of art solutions to manage and process our agriculture produce.",
    "There is a need design drones and robots that can solve some of the pressing challenges of India such as handling medical emergencies, search and rescue operations, etc.",
    "Solutions could be in the form of waste segregation, disposal, and improved transportation system.",
    "Creating state-of-the-art devices to improve distribution, management and purification of water.",
    "Innovative ideas that help manage and generate renewable sources more efficiently.",
    "Technology ideas in tertiary sectors like Hospitality, Financial Services, Entertainment, Tourism and Retail."
  ];

  List<String> div1desc = ["To develope the automated version of manaual system in hospitals, which aims to maintain day-to-day state of admission/discharge of pateints,doctors,report generation, and etc. It  keeps track of all the activities and their records in database ,so as to provide efficient and error free process.",
  "A college library management is a project that manages and stores books information electronically according to students needs. The system helps both students and library manager to keep a constant track of all the books available in the library. It allows both the admin and the student to search for the desired book.It becomes necessary for colleges to keep a continuous check on the books issued and returned and even calculate fine.",
  "The main aim of this project Canteen management system is to provide fast services to their college students, Staffs etc. This website will provide the list of different menu list with different categories. User can select any item from canteen and can order for it by using debit card payment or wallet Payment.Canteen Management system manages the all details of food items which contains name, description, image, price etc.", 
  "Teleconferencing is a method of using technology to bring people together despite the geographical barriers. It is made up of 2 applications the client servers,which runs on android devices and a server application ,which runs on any android device on the network.To start chatting the client should connect to the server where they could have private and group chat security measures.",
  "A ticket booking system is a project that allows users to check for available seats and can even book them at the same time. The project overcomes the situation of overbooking by automating the manual booking system, online. Users can make prior bookings for desired seats for their desired show at desired time and cost.",
  "Customer get many benefits via online shopping this helps e-commerce companies to build long-lasting and profitable relationship with their customers. For making strong relationship with these users it is very important to focus on the customer as a whole and making sense of a flood of real-time information that goes well beyond demographics or shopping behavior. There are two entities who will have the access to the system. One is the admin and another one will be the registered user.",
  "Job Finder Management system project which relates to HRMS department will maintain entire recruitment service and provide services for job vacancies.This project allows companies to post job vacancies with respect to the subject on which they are looking for employs and job seekers need to log in to their account with given login and password and check job vacancies. Job seekers can check their job application status from their account.",
  "It is an Integrated System of Laundries functional work, organize and maintain the Data necessary for operations.This can provide a user-friendly dashboards with login access for Admin, Web Admin, Accountant of Laundry. This System has modules to manage Customer Invoices for Pisces, weight, Package, Delivery of Pisces, weight, Package wise, and Barcode Generations many more. It has a fully-fledged Human Resource module to manage the payroll and pay slips.",
  "Courier service providers usually have a very large network across countries. A courier goes through several places including distribution center, aeroplane, ship, road transport etc. At this time even customer is conscious about where has his package reached. The customer can track his courier through a login where he may enter this courier number and track the location status of his package.",
  "Use of your information and knowledge to present your thoughts and ideas to do something creative."];
  

  List<String> div2topics = [
    "SMART COMMUNICATION",
    "HEALTHCARE  & BIOMEDICAL DEVICES",
    "AGRICULTURE & RURAL DEVELOPMENT",
    "SMART VEHICLES",
    "FOOD TECHNOLOGY",
    "ROBOTICS & DRONES",
    "WASTE MANAGEMENT",
    "CLEAN WATER",
    "RENEWABLE ENERGY",
    "MISCELLANEOUS"
  ];

  List<String> div2img = [
    "icon_communication.png",
    "icon_healthcare.png",
    "icon_technology.png",
    "icon_automobiles.png",
    "icon_agriculture.png",
    "icon_drone.png",
    "icon_waste.png",
    "icon_water.png",
    "icon_renewable.png",
    "icon_education.png"
  ];
  //mechanical varibles
//   List<String> mechanicaltopicsname = [
//     "Computer Aided Engineering(CAE)",
//     "Smart Materials",
//     "Anti-Locking Braking System",
//     "Green Manufacturing",
//     "Biomimetics - Innovation among Nature",
//     "Rapid Prototyping",
//     "MEMS - Micro Electro Mechanical System",
//     "Power Generation using Nanotubes",
//     "Automatic Transmission in Automobiles",
//     "Product Data Management",
//     "TQM Concepts of Zero Rejections",
//     "Nano Technology"
//   ];
//   // List<String>mechanicaltopicsdescription=["fbEGFYUgefyug","FdsgfuyGFYGYUF","DGHSVFGSDFG","zfgbsvkfdg","chgSAYCFashjd"];
//   List<String> mechanicalimageurl = [
//     "https://www.whatech.com/images/featured/5273/cae.png",
//     "http://physicsopenlab.org/wp-content/uploads/2017/04/IMG_20170326_160711-768x482.jpg",
//     "https://cdn.hswstatic.com/gif/anti-lock-brake1.jpg",
//     "https://mfgtalkradio.com/wp-content/uploads/2016/06/green-mfg.jpg",
//     "https://cdn.science101.com/wp-content/uploads/2018/09/Robot-frog-2.jpg",
//     "https://i.ytimg.com/vi/oDdOqLblmVQ/maxresdefault.jpg",
//     "https://www.vcnewsnetwork.com/wp-content/uploads/2017/12/Micro-Electro-Mechanical-Systems-MEMs-Sensors-Market-500x333.jpg",
//     "https://www.nanowerk.com/nanotechnology-news2/id50764.jpg",
//     "https://www.drivespark.com/img/2016/03/xautomatic-shifter-22-1458649069.jpg.pagespeed.ic.ZKFrLBAYSR.jpg",
//     "https://study.com/cimages/multimages/16/product_data_management.png",
//     "https://static.fibre2fashion.com/articleresources/images/1/44/images/44301.jpg",
//     "https://www.analyticsindiamag.com/wp-content/uploads/2019/01/Nanotechnology-768x384.jpg"
//   ];
//   //electrical varibles
//   List<String> electricaltopicsname = [
//     "Wireless Power Transmission",
//     "Floating Power Plant: Power Ship",
//     "Hybrid Electric Vehicles",
//     "Humanoid Robotics",
//     "Power Quality Issues with Grid Connected Wind Energy Systems",
//     "Renewable Energy and Environment Protection",
//     "Smart Grid Technology",
//     "Electrodynamic Tether",
//     "Super Conducting Rotating Machine",
//     "Artificial Intelligence in Power Stations",
//     "Artificial Neural Network based Power System",
//   ];
//   // List<String>electricaltopicsdescription=["fbEGFYUgefyug","FdsgfuyGFYGYUF","DGHSVFGSDFG","zfgbsvkfdg","chgSAYCFashjd"];
//   List<String> electricalimageurl = [
//     "https://www.elprocus.com/wp-content/uploads/2016/02/Wireless-Power-Transmission-Technology.jpg",
//     "https://static.independent.co.uk/s3fs-public/thumbnails/image/2019/04/25/16/d5avl-vxsaex9lr.jpg?w968h681",
//     "https://afdc.energy.gov/sp/assets/car_pages/plugin-b98fca6b853e4470c62d75b1ce3c2e9534531b60391068aaa622815258ca6839.jpg",
//     "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Atlas_from_boston_dynamics.jpg/220px-Atlas_from_boston_dynamics.jpg",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTePnPNCur34V11dAb0FnFpNTlKLhl988_rfNIed73K-TJDBoTGMA",
//     "https://previews.123rf.com/images/bbtreesubmission/bbtreesubmission1702/bbtreesubmission170202499/72485471-environmental-protection-renewable-energy-illustration.jpg",
//     "http://blogs.edf.org/energyexchange/files/2014/09/SmartGrid.jpg",
//     "https://upload.wikimedia.org/wikipedia/en/thumb/1/1c/Fig35_Orbit_Drag.PNG/250px-Fig35_Orbit_Drag.PNG",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_emjUI8EU2GPXt3lZQS80ETDhuvTjz2SDNfTVvGqs_-FWmJqzCg",
//     "https://image.slidesharecdn.com/aiinpowerplant-140220110009-phpapp01/95/ai-in-power-plant-6-638.jpg?cb=1392894089",
//     "http://engineering.electrical-equipment.org/wp-content/uploads/2013/05/Artificial-Neural-Network-Based-Power-System-Restoration-1.jpg"
//   ];
//   //electronics varibles
//   List<String> electonicstopicsname = [
//     "OLEDs(Organic Light Emitting Diodes)",
//     "Surveilance Cameras",
//     "Humanoid Robots",
//     "Autonomic Computing",
//     "Flexible Electronics & Displays",
//     "Laser Communication System",
//     "Biomedical Sensors",
//     "Hybrid Cars",
//     "Smart Antenna",
//     "Cellonics Technology"
//   ];
//   List<String> electonicsimageurl = [
//     "https://5.imimg.com/data5/YT/WS/YC/SELLER-14219418/organic-light-emitting-diodes-service-500x500.png",
//     "https://s18670.pcdn.co/wp-content/uploads/sites/2/2017/10/cameras-in-school.png",
//     "https://3.bp.blogspot.com/-6WKgL86hIB8/WlVezrCUdEI/AAAAAAAADJk/Cpe0r7TvQiUzTb6X_9pJ3x_LzbMsKMVhwCLcBGAs/s640/Sophia%2B%2BSuper%2Bintelligent%2Bhumanoid%2Brobot%2Breveals%2Bshe%2Bnow%2Bhas%2Blegs%2B%25281%2529.jpg",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCt6yOOSK6kYVeP7W1U8yfvKMFh6v-y33KEcvJryRp_KoinD8_",
//     "http://streetcommunication.com/wp-content/uploads/2016/10/OLED-flexible-innovative-screen-display-led-bendable.jpg",
//     "https://cdn.mos.cms.futurecdn.net/oAfUWzNJNStniw6fSAtjyW.jpg",
//     "https://www.researchgate.net/profile/Omprakash_Kaiwartya/publication/313872084/figure/fig1/AS:464842332086275@1487838456884/Typical-example-of-biomedical-sensor-BMS-deployment.png",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoLvouwBTy60XivMMEygr7_DWtPowXbxxBz_jUUuDoceylsQKx_Q",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8o7u4SPsbC9fv47iY8cYWklN7dtIQtDUEJKdrD5N_B3w6-6Dzg",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7hzXoM0bgbeNGJLAAC472sY_Mgt2rGnb2Hlnz7x95Gh4lqY5y"
//   ];
// //  List<String>electonicsimageurl=["","","","","",""];
//   //civilvaribles
//   List<String> civiltopicsname = [
//     "Modern Concepts of Rural Road Developement",
//     "Underwater Concreting",
//     "Marine Pollution",
//     "Indian Railway: Ensuring last mile connectivity",
//     "Earthquake Engineering: Seismic Risk-reduction in NCR Region",
//     "Sanitation and Solid Waste Management through ICT",
//     "Storage Dams: Need for flood management",
//     "Equity and global climate agreement- A step towards a clean earth",
//     "Futuristic Architecture",
//     "Civil Engineering Models for- “Skill India”"
//   ];
//   // List<String>civiltopicsdescription=["fbEGFYUgefyug","FdsgfuyGFYGYUF","DGHSVFGSDFG","zfgbsvkfdg","chgSAYCFashjd"];
//   List<String> civilimageurl = [
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxqUpMv3k95f1A8-TKndmLaRzPBWgZgF7KUAXvIXslLiA6mebe",
//     "http://www.dailycivil.com/wp-content/uploads/2016/12/tremie-1-300x192.jpg",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgsXnoTK46SvU6hXyPCD4ivBwj5wno6kIWJRd_UQv_sphMXoBQ2g",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF0DP7W8CFLw3DSro6i9YHY718PjdDi5PH8i11dMfusmlB6GBI",
//     "http://4.bp.blogspot.com/-6WfLj1Yzmbw/U4NEigg3tGI/AAAAAAAAAfA/W4ii_PT7080/s1600/japan-earthquake-.jpg",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTipWdUwqrCi4Fkv7saHj6tU9sGWgcPnWQKX9FBItiGz3d-VkyA",
//     "https://californiawaterblog.files.wordpress.com/2011/09/3_12_09_dsc_0066lg1.jpg",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPAVmW574RdhgqmZpLJRuvu2R1PhZPuepXng9glYZ4-EZhOp06",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQriSvm2Qq05yGAHjHZWl_yM5g41Rr7qTwd17aUqebHPw80MJy3MQ",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIf3dkci1_FAOCfPSL5DPwaEeGzVGUJBsnZRsxncpdOXiz-NdJHQ"
//   ];
//   //management varibles
//   List<String> managementtopicsname = [
//     "Has Apple lost its charm after Steve Jobs?",
//     "Talent Management- An agile edge over competition",
//     "Traditional management concepts and evolution of Indian Management ethos for future",
//     "Is GNH More Important than GDP?",
//     "The impact of abolition of Article 370 on the state economy",
//     "Business Intelligence- Alignment of IT and Business",
//     "Social Networking is the prime catalyst in shaping the actions of Indian Youths",
//     "100% FDI in Indian Defense Sector: Boon or Bane",
//     "Rural Development is the right answer to our unemployment problem",
//     "Is economic power superior than nuclear power"
//   ];
//   // List<String>managementtopicsdescription=["fbEGFYUgefyug","FdsgfuyGFYGYUF","DGHSVFGSDFG","zfgbsvkfdg","chgSAYCFashjd"];
//   List<String> managementimageurl = [
//     "https://fortunedotcom.files.wordpress.com/2016/06/134443366.jpg",
//     "https://i1.wp.com/cdn.cleverism.com/wp-content/uploads/2016/07/CLEVERISM.COM-magazine-The-Future-of-Talent-Management11.png?fit=740%2C513&ssl=1",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSndbl-XatnIu694tEaKM8GqXW8I8E8EhoPVQKjH3cWV2_FNXxh",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsEdcIRN1XcngHW99MFkTvP1SLwcK13OT72hfFJPrmS6FXjW5n",
//     "https://www.livelaw.in/h-upload/2019/08/05/362841-article-370.jpg",
//     "http://www.businessexpertadvice.com/wp-content/uploads/2019/03/1.jpg",
//     "https://www.greatbuyz.com/blog/wp-content/uploads/2018/09/social-networking-site.png",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmYliIXCBMNxj4T9g3U15R8b5MfcZGHXiYZrz4m0fLDJLG-b0DPg",
//     "https://csrbox.org/images/Schedule%20VII%20Theme%20Icons/Rural%20Development.jpg",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiMkbKkcAlSy44VOUml0IgCHzCBFA3ZgO68-dpObF0c1GjwlhHRA"
//   ];

  @override
  Widget build(BuildContext context) {
    //FlutterStatusbarcolor.setStatusBarColor(Colors.white);
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
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/bgapp.jpg",
                ),
                fit: BoxFit.fitWidth),
          ),
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  child: Center(
                    child: Card(
                      elevation: 20,
                      color: Color(0xff1f1f1f),
                      child: Container(
                        height: 90,
                        width: MediaQuery.of(context).size.width - 50,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Image.asset("assets/light.gif")
                              Padding(
                                padding: EdgeInsets.all(1),
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  child: Image(
                                    image: AssetImage("assets/light.gif"),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Container(
                                  child: Text(
                                    dayleftnow(date, month).toString(),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "DAYS TO GO",
                                              style: TextStyle(
                                                  color: Color(0xffefb168),
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              "FOR",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        // Expanded(
                                        //   child: Text("NOTIFICATION",
                                        //       textAlign: TextAlign.right,
                                        //       style: TextStyle(
                                        //           color: Colors.blue,
                                        //           fontSize: 12)),
                                        // )
                                      ],
                                    ),
                                    Text(
                                      "THE MAIN EVENT",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //       image: AssetImage(
                  //         "assets/bgapp.jpg",
                  //       ),
                  //       fit: BoxFit.fitWidth),
                  // ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  //height: 125,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/scrollsposter.jpg",
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        child: Image.asset("assets/domain.jpg",
                            fit: BoxFit.fitHeight),
                        height: 50,
                        width: 150,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),

                      Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Container(
                            //height: (MediaQuery.of(context).size.width - 53),
                            color: Color(0x001F1F1F),
                            width: MediaQuery.of(context).size.width - 50,
                            child: Column(
                              children: <Widget>[
                                Card(
                                  elevation: 20,
                                  color: Color(0xff1f1f1f),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Domains(
                                              "Division 1",
                                              div1topics,
                                              computerimageurl,
                                              div1desc),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      color: Color(0xff1f1f1f),
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 25),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              "DIVISION 1",
                                              style: TextStyle(
                                                color: Color(0xffefb168),
                                                fontSize: 25.0,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 15),
                                            ),
                                            Text(
                                              "For 1st Year Participants Only",
                                              style: TextStyle(
                                                fontSize: 10.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Card(
                                  elevation: 20,
                                  color: Color(0xff1f1f1f),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Domains(
                                              "Division 2",
                                              div2topics,
                                              div2img,
                                              div2desc),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      color: Color(0xff1f1f1f),
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 25),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              "DIVISION 2",
                                              style: TextStyle(
                                                color: Color(0xffefb168),
                                                fontSize: 25.0,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 15),
                                            ),
                                            Text(
                                              "For 2nd, 3rd, 4th Year Participants",
                                              style: TextStyle(
                                                fontSize: 10.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   child: Padding(
                      //     padding: EdgeInsets.symmetric(horizontal: 25),
                      //     child: Container(
                      //       height:
                      //           (MediaQuery.of(context).size.width - 53) * 2 / 3 +
                      //               40,
                      //       color: Color(0x001F1F1F),
                      //       width: MediaQuery.of(context).size.width - 50,
                      //       child: Column(
                      //         children: <Widget>[
                      //           Row(
                      //             children: <Widget>[
                      //               Expanded(
                      //                   child: Card(
                      //                 color: Color(0xff1f1f1f),
                      //                 clipBehavior: Clip.antiAlias,
                      //                 elevation: 20,
                      //                 child: Padding(
                      //                   padding: EdgeInsets.all(.5),
                      //                   child: Container(
                      //                       child: GestureDetector(
                      //                         child: Column(
                      //                           mainAxisAlignment:
                      //                               MainAxisAlignment.center,
                      //                           crossAxisAlignment:
                      //                               CrossAxisAlignment.center,
                      //                           children: <Widget>[
                      //                             Container(
                      //                               child: Image.asset(
                      //                                   "assets/computer.png"),
                      //                               height: 50,
                      //                               width: 50,
                      //                             ),
                      //                             Padding(
                      //                               padding:
                      //                                   const EdgeInsets.only(
                      //                                       top: 8.0,
                      //                                       left: 8,
                      //                                       right: 8),
                      //                               child: Text(
                      //                                 "COMPUTER SCIENCE",
                      //                                 style: TextStyle(
                      //                                   color: Color(0xffefb168),
                      //                                   fontSize: 10,
                      //                                 ),
                      //                                 textAlign: TextAlign.center,
                      //                               ),
                      //                             )
                      //                           ],
                      //                         ),
                      //                         onTap: () {
                      //                           Navigator.push(
                      //                               context,
                      //                               MaterialPageRoute(
                      //                                   builder: (context) => Domains(
                      //                                       "COMPUTER SCIENCE",
                      //                                       computertopicsname,
                      //                                       computerimageurl)));
                      //                         },
                      //                       ),
                      //                       height: (MediaQuery.of(context)
                      //                                   .size
                      //                                   .width -
                      //                               56) /
                      //                           3,
                      //                       width: (MediaQuery.of(context)
                      //                                   .size
                      //                                   .width -
                      //                               56) /
                      //                           3,
                      //                       color: Color(0x001f1f1f)),
                      //                 ),
                      //               )),
                      //               Expanded(
                      //                   child: Card(
                      //                 color: Color(0xff1f1f1f),
                      //                 clipBehavior: Clip.antiAlias,
                      //                 elevation: 20,
                      //                 child: Padding(
                      //                   padding: EdgeInsets.all(.5),
                      //                   child: Container(
                      //                     child: GestureDetector(
                      //                       child: Column(
                      //                         mainAxisAlignment:
                      //                             MainAxisAlignment.center,
                      //                         crossAxisAlignment:
                      //                             CrossAxisAlignment.center,
                      //                         children: <Widget>[
                      //                           Container(
                      //                             child: Image.asset(
                      //                                 "assets/mech.png"),
                      //                             height: 50,
                      //                             width: 50,
                      //                           ),
                      //                           Padding(
                      //                             padding: const EdgeInsets.only(
                      //                                 top: 8.0,
                      //                                 left: 8,
                      //                                 right: 8),
                      //                             child: Text(
                      //                               "MECHANICAL ENGINEERING",
                      //                               style: TextStyle(
                      //                                 color: Color(0xffefb168),
                      //                                 fontSize: 10,
                      //                               ),
                      //                               textAlign: TextAlign.center,
                      //                             ),
                      //                           )
                      //                         ],
                      //                       ),
                      //                       onTap: () {
                      //                         Navigator.push(
                      //                             context,
                      //                             MaterialPageRoute(
                      //                                 builder: (context) => Domains(
                      //                                     "MECHANICAL ENGINEERING",
                      //                                     mechanicaltopicsname,
                      //                                     mechanicalimageurl)));
                      //                         print("Shah");
                      //                       },
                      //                     ),
                      //                     height:
                      //                         (MediaQuery.of(context).size.width -
                      //                                 56) /
                      //                             3,
                      //                     width:
                      //                         (MediaQuery.of(context).size.width -
                      //                                 56) /
                      //                             3,
                      //                     color: Color(0x001f1f1f),
                      //                   ),
                      //                 ),
                      //               )),
                      //               Expanded(
                      //                   child: Card(
                      //                 color: Color(0xff1f1f1f),
                      //                 clipBehavior: Clip.antiAlias,
                      //                 elevation: 20,
                      //                 child: Padding(
                      //                   padding: EdgeInsets.all(.5),
                      //                   child: Container(
                      //                     child: GestureDetector(
                      //                       child: Column(
                      //                         mainAxisAlignment:
                      //                             MainAxisAlignment.center,
                      //                         crossAxisAlignment:
                      //                             CrossAxisAlignment.center,
                      //                         children: <Widget>[
                      //                           Container(
                      //                             child: Image.asset(
                      //                                 "assets/electrical.png"),
                      //                             height: 50,
                      //                             width: 50,
                      //                           ),
                      //                           Padding(
                      //                             padding: const EdgeInsets.only(
                      //                                 top: 8.0,
                      //                                 left: 8,
                      //                                 right: 8),
                      //                             child: Text(
                      //                               "ELECTRICAL ENGINEERING",
                      //                               style: TextStyle(
                      //                                 color: Color(0xffefb168),
                      //                                 fontSize: 10,
                      //                               ),
                      //                               textAlign: TextAlign.center,
                      //                             ),
                      //                           )
                      //                         ],
                      //                       ),
                      //                       onTap: () {
                      //                         print("Shah");
                      //                         Navigator.push(
                      //                           context,
                      //                           MaterialPageRoute(
                      //                             builder: (context) => Domains(
                      //                                 "ELECTRICAL ENGINEERING",
                      //                                 electricaltopicsname,
                      //                                 electricalimageurl),
                      //                           ),
                      //                         );
                      //                       },
                      //                     ),
                      //                     height:
                      //                         (MediaQuery.of(context).size.width -
                      //                                 56) /
                      //                             3,
                      //                     width:
                      //                         (MediaQuery.of(context).size.width -
                      //                                 56) /
                      //                             3,
                      //                     color: Color(0x001f1f1f),
                      //                   ),
                      //                 ),
                      //               )),
                      //             ],
                      //           ),
                      //           Row(
                      //             children: <Widget>[
                      //               Expanded(
                      //                 child: Card(
                      //                   color: Color(0xff1f1f1f),
                      //                   clipBehavior: Clip.antiAlias,
                      //                   elevation: 20,
                      //                   child: Padding(
                      //                     padding: EdgeInsets.all(.5),
                      //                     child: Container(
                      //                       child: GestureDetector(
                      //                         child: Column(
                      //                           mainAxisAlignment:
                      //                               MainAxisAlignment.center,
                      //                           crossAxisAlignment:
                      //                               CrossAxisAlignment.center,
                      //                           children: <Widget>[
                      //                             Container(
                      //                               child: Image.asset(
                      //                                   "assets/electronics.png"),
                      //                               height: 50,
                      //                               width: 50,
                      //                             ),
                      //                             Padding(
                      //                               padding:
                      //                                   const EdgeInsets.only(
                      //                                       top: 8.0,
                      //                                       left: 8,
                      //                                       right: 8),
                      //                               child: Text(
                      //                                 "ELECTRONICS ENGINEERING",
                      //                                 style: TextStyle(
                      //                                   color: Color(0xffefb168),
                      //                                   fontSize: 10,
                      //                                 ),
                      //                                 textAlign: TextAlign.center,
                      //                               ),
                      //                             )
                      //                           ],
                      //                         ),
                      //                         onTap: () {
                      //                           Navigator.push(
                      //                             context,
                      //                             MaterialPageRoute(
                      //                               builder: (context) => Domains(
                      //                                   "ELECTRONICS ENGINEERING",
                      //                                   electonicstopicsname,
                      //                                   electonicsimageurl),
                      //                             ),
                      //                           );
                      //                           print("Shah");
                      //                         },
                      //                       ),
                      //                       height: (MediaQuery.of(context)
                      //                                   .size
                      //                                   .width -
                      //                               56) /
                      //                           3,
                      //                       width: (MediaQuery.of(context)
                      //                                   .size
                      //                                   .width -
                      //                               56) /
                      //                           3,
                      //                       color: Color(0x001f1f1f),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //               Expanded(
                      //                 child: Card(
                      //                   color: Color(0xff1f1f1f),
                      //                   clipBehavior: Clip.antiAlias,
                      //                   elevation: 20,
                      //                   child: Padding(
                      //                     padding: EdgeInsets.all(.5),
                      //                     child: Container(
                      //                       child: GestureDetector(
                      //                         child: Column(
                      //                           mainAxisAlignment:
                      //                               MainAxisAlignment.center,
                      //                           crossAxisAlignment:
                      //                               CrossAxisAlignment.center,
                      //                           children: <Widget>[
                      //                             Container(
                      //                               child: Image.asset(
                      //                                   "assets/civil.png"),
                      //                               height: 50,
                      //                               width: 50,
                      //                             ),
                      //                             Padding(
                      //                               padding:
                      //                                   const EdgeInsets.only(
                      //                                       top: 8.0,
                      //                                       left: 8,
                      //                                       right: 8),
                      //                               child: Text(
                      //                                 "CIVIL ENGINEERING",
                      //                                 style: TextStyle(
                      //                                   color: Color(0xffefb168),
                      //                                   fontSize: 10,
                      //                                 ),
                      //                                 textAlign: TextAlign.center,
                      //                               ),
                      //                             )
                      //                           ],
                      //                         ),
                      //                         onTap: () {
                      //                           Navigator.push(
                      //                             context,
                      //                             MaterialPageRoute(
                      //                               builder: (context) => Domains(
                      //                                   "CIVIL ENGINEERING",
                      //                                   civiltopicsname,
                      //                                   civilimageurl),
                      //                             ),
                      //                           );
                      //                           print("Shah");
                      //                         },
                      //                       ),
                      //                       height: (MediaQuery.of(context)
                      //                                   .size
                      //                                   .width -
                      //                               56) /
                      //                           3,
                      //                       width: (MediaQuery.of(context)
                      //                                   .size
                      //                                   .width -
                      //                               56) /
                      //                           3,
                      //                       color: Color(0x001f1f1f),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //               Expanded(
                      //                 child: Card(
                      //                   color: Color(0xff1f1f1f),
                      //                   clipBehavior: Clip.antiAlias,
                      //                   elevation: 20,
                      //                   child: Padding(
                      //                     padding: EdgeInsets.all(.5),
                      //                     child: Container(
                      //                       child: GestureDetector(
                      //                         child: Column(
                      //                           mainAxisAlignment:
                      //                               MainAxisAlignment.center,
                      //                           crossAxisAlignment:
                      //                               CrossAxisAlignment.center,
                      //                           children: <Widget>[
                      //                             Container(
                      //                               child: Image.asset(
                      //                                   "assets/manag.png"),
                      //                               height: 50,
                      //                               width: 50,
                      //                             ),
                      //                             Padding(
                      //                               padding:
                      //                                   const EdgeInsets.only(
                      //                                       top: 8.0,
                      //                                       left: 8,
                      //                                       right: 8),
                      //                               child: Text(
                      //                                 "MANAGEMENT",
                      //                                 style: TextStyle(
                      //                                   color: Color(0xffefb168),
                      //                                   fontSize: 10,
                      //                                 ),
                      //                                 textAlign: TextAlign.center,
                      //                               ),
                      //                             )
                      //                           ],
                      //                         ),
                      //                         onTap: () {
                      //                           Navigator.push(
                      //                             context,
                      //                             MaterialPageRoute(
                      //                               builder: (context) => Domains(
                      //                                   "MANAGMENT",
                      //                                   managementtopicsname,
                      //                                   managementimageurl),
                      //                             ),
                      //                           );
                      //                           //print("Shah");
                      //                         },
                      //                       ),
                      //                       height: (MediaQuery.of(context)
                      //                                   .size
                      //                                   .width -
                      //                               56) /
                      //                           3,
                      //                       width: (MediaQuery.of(context)
                      //                                   .size
                      //                                   .width -
                      //                               56) /
                      //                           3,
                      //                       color: Color(0x001f1f1f),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
