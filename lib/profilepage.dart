import 'package:flutter/material.dart';
import 'package:social_media_app/postcard.dart';

class ProfilePage extends StatelessWidget {
  final String nameSurname;
  final String userName;
  final String coverPhoto;
  final String profilePhoto;

  const ProfilePage({Key? key, required this.nameSurname, required this.userName, required this.coverPhoto, required this.profilePhoto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 230,

              ),
              Container(
                height: 180,
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    image: DecorationImage(
                      image: AssetImage("assets/$coverPhoto.png"),
                      fit: BoxFit.cover,
                    )),
              ),
              Positioned(
                left: 10.0,
                bottom: 0.0,
                child: Hero(
                  tag: userName,
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepPurpleAccent, width: 2.0),
                      borderRadius: BorderRadius.circular(60.0),
                      color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("assets/$profilePhoto.png"),
                          fit: BoxFit.cover,
                        )
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 130.0,
                top: 190.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.black,
                        )),
                    Text(nameSurname,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              Positioned(
                top: 130.0,
                right: 15.0,
                child: Container(
                    width: 100,
                    height: 40.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.grey[200],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle,
                          size: 18.0,
                        ),
                        SizedBox(width: 2.0),
                        Text("Follow",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    )),
              ),
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back, color: Colors.purpleAccent))
            ],
          ),
          SizedBox(height: 20.0,),

          Container(
            height: 70.0,
            color: Colors.grey.withOpacity(0.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                counter("20K", "Follower"),
                counter("1", "Follow"),
                counter("70", "Posts")
              ],
            )


          ),
          PostCard(
            Description: "From my last visit to NY",
            name_surname: "Ataberk Yavuzyaşar",
            postedPhoto: "ataberk_profile_post",
            profilePhoto: "ataberk",
            time: "8",
          ),
        ],
      ),
    );
  }

  Column counter(String firstRow, String secondRow) {
    return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(firstRow, style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
                  SizedBox(height: 1.0,),
                  Text(secondRow, style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  )),
                ],
              );
  }
}
