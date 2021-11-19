import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String profilePhoto;
  final String name_surname;
  final String time;
  final String postedPhoto;
  final String Description;

  const PostCard({Key? key, required this.profilePhoto, required this.name_surname, required this.time, required this.postedPhoto, required this.Description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(25.0),
        child: Container(
            height: 390.0,
            width: double.infinity,
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(25.0),
                              image: DecorationImage(
                                image: AssetImage("assets/$profilePhoto.png"),
                                fit: BoxFit.cover,
                              )),
                        ),
                        SizedBox(
                          width: 9.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name_surname,
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )),
                            Text("$time hours ago",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.more_vert),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(Description,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18.0,
                    )),
                SizedBox(
                  height: 10.0,
                ),
                Image.asset(
                  "assets/$postedPhoto.png",
                  height: 200.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    createIconAndButton(myIcon: Icons.favorite, myString: "Like", func: (){print("Liked");}),
                    createIconAndButton(myIcon: Icons.comment, myString: "Comment",func: (){print("Comment");}),
                    createIconAndButton(myIcon: Icons.share, myString: "Share",func: (){print("Shared");}),
                  ],
                )
              ],
            )),
      ),
    );
  }
}

class createIconAndButton extends StatelessWidget {

  final IconData myIcon;
  final String myString;
  final func;
  createIconAndButton({required this.myIcon, required this.myString, this.func});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: func,
        child: Container(
          padding: EdgeInsets.all(5.0),
            child: Row(
          children: [
            Icon(myIcon, color: Colors.deepPurpleAccent),
            SizedBox(
              width: 8.0,
            ),
            Text(myString,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ))
          ],
        )),
      ),
    );
  }
}
