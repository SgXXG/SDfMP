import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/style/app_style.dart';
import 'package:untitled/widgets/note_card.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}): super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        elevation: 0,
        title: Text("Notes"),
        centerTitle: true,
        backgroundColor: AppStyle.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your recent notes",
              style: GoogleFonts.roboto(color: Colors.white,
                fontWeight: FontWeight.bold, fontSize: 22,),),
            SizedBox(
              height: 20,),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("Notes").snapshots(),
              builder: (context, AsyncSnapshot snapshot){
                if (snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: LinearProgressIndicator(),
                  );
                }
                if (snapshot.hasData){}
                return Text("there's no notes",
                  style: GoogleFonts.nunito(color: Colors.white),);
              },
            )
          ],
        ),
      ),
    );
  }

}