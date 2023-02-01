import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/screens/note_editor.dart';
import 'package:untitled/screens/note_reader.dart';
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
        title: Text("Notes",
          style: GoogleFonts.jetBrainsMono(color: Colors.white,
          fontWeight: FontWeight.bold, fontSize: 30),),
        centerTitle: true,
        backgroundColor: AppStyle.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Recent notes",
              style: GoogleFonts.jetBrainsMono(color: Colors.white,
                fontWeight: FontWeight.bold, fontSize: 22,),),
            SizedBox(
              height: 20,),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("Notes").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: LinearProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData){
                    return GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,),
                      children: snapshot.data!.docs
                          .map((note) => noteCard(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NoteReaderScreen(note),));
                      }, note))
                          .toList(),
                    );
                  }
                  return Text("there's no notes",
                    style: GoogleFonts.nunito(color: Colors.white),);
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NoteEditorScreen()));
        },
        label: Text("Add Note"),
        icon: Icon(Icons.add),),
    );
  }

}