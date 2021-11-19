import 'package:flutter/material.dart';
import 'package:social_media_app/postcard.dart';
import 'package:social_media_app/profilepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Projem',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: homePage());
  }
}

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
            iconSize: 32.0,
            color: Colors.grey[400],
          ),
          title: Text(
            "S.O.S",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 25.0,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                showModalBottomSheet(context: context, builder: (BuildContext context) {
                  return Column(
                    children: [
                      notificationBuilder("Ahmet followed you", "3 minutes ago"),
                      notificationBuilder("Ayşe sent you a message", "1 hour ago"),
                      notificationBuilder("Fatma followed you back","1 day ago"),
                    ],
                  );
                });
              },
              iconSize: 32.0,
              color: Colors.deepPurple,
            ),
          ],
        ),
        body: ListView(
          children: [
            Container(
                decoration: BoxDecoration(color: Colors.grey[100], boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple,
                    offset: Offset(0, 4.0),
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                  )
                ]),
                height: 100.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildProfile("Ayça", "ayca", "Ayçişko","melih"),
                    buildProfile("Ataberk", "ataberk","Atakirk","ataberk_background"),
                    buildProfile("Gülfem", "gulfo","zgulfemaydin","gulfem_background"),
                    buildProfile("Seda", "seda","sedasdas","seda_av"),
                    buildProfile("Çağrı", "cagri","Anarshia","cagri_background"),
                    buildProfile("Melih", "melih","eustrone","ayca"),
                    buildProfile("Gülbike", "gulbike","Gülbik","gulbike_background"),
                  ],
                )),
            SizedBox(
              height: 15,
            ),
            PostCard(
              Description: "What a nice day in a school",
              name_surname: "Ataberk Yavuzyaşar",
              postedPhoto: "kafake",
              profilePhoto: "ataberk",
              time: "2",
            ),
            PostCard(
              Description: "Dolar is raising",
              name_surname: "Pusholder",
              postedPhoto: "dolar",
              profilePhoto: "pusholder",
              time: "4",
            ),
            PostCard(
              Description: "Data structures and Algorithms exam will be on next Monday",
              name_surname: "AGU",
              postedPhoto: "data",
              profilePhoto: "agu",
              time: "6",
            ),
            PostCard(
              Description: "With my bae",
              name_surname: "Ayça Dolar Öztorun",
              postedPhoto: "melihayca",
              profilePhoto: "ayca",
              time: "8",
            ),
            PostCard(
              Description: "Views of my school",
              name_surname: "Sedanur Aslan",
              postedPhoto: "seda_av",
              profilePhoto: "seda",
              time: "10",
            ),
            PostCard(
              Description: "Just before we drink the poison",
              name_surname: "Melih Öztorun",
              postedPhoto: "melihke",
              profilePhoto: "melih",
              time: "12",
            ),
          ],
        ),
      floatingActionButton: FloatingActionButton(onPressed: (){},
      backgroundColor: Colors.deepPurpleAccent,
      child: Icon(Icons.add_a_photo,color: Colors.white,),),
    );
  }

  Padding notificationBuilder(String message, String time) {
    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(message,style: TextStyle(
                            fontSize: 15.0,
                          )),
                          Text(time),
                        ],
                      ),
                    );
  }

  Widget buildProfile(String userName, String imageName, String nameSurname, String coverPhoto) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ProfilePage(profilePhoto:imageName , userName: userName,coverPhoto: coverPhoto,nameSurname: nameSurname,)));
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 3.0),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Hero(
                    tag:userName,
                    child: Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/$imageName.png"),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.deepPurple,
                            width: 2.0,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                    ),
                  ),
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(color: Colors.white, width: 2.0),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(userName,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

