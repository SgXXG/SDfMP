import 'package:app_client/blocs/notes_state.dart';
import 'package:app_client/constants/custom_colors.dart';
import 'package:app_client/ui/appbar/main_app_bar.dart';
import 'package:app_client/ui/main_screen_with_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../blocs/notes_cubit.dart';
import 'main_screen_empty.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<NotesCubit>();

    return Scaffold(
      appBar: MainAppBar(
        onInfoPress: () => openDialog(context),
        onSearchPress: () => Navigator.pushNamed(context, '/search'),
      ),
      body: StreamBuilder<NotesState>(
        initialData: cubit.state,
        stream: cubit.stream,
        builder: (context, snapshot) {
          if (snapshot.data!.currentNotes.isEmpty) {
            return const MainScreenEmpty();
          } else {
            return MainScreenWithContent(
              notes: snapshot.requireData.currentNotes.reversed.toList(),
            );
          }
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 16, bottom: 16),
        child: FloatingActionButton(
          onPressed: () => {
            Navigator.pushNamed(context, '/add'),
          },
          elevation: 24,
          backgroundColor: CustomColors.trueBlack,
          child: const Icon(Icons.add_rounded),
        ),
      ),
    );
  }


  // delete
  Future openDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SizedBox(
          width: 330,
          height: 236,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'to delete note use swipe',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'to search note use search icon',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'to add note use + icon',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'to edit note use tapping on note',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'u can change color on main screen of notes throught out the edit screen',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}