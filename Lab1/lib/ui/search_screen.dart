import 'package:app_client/blocs/notes_search_state.dart';
import 'package:app_client/ui/appbar/search_app_bar.dart';
import 'package:app_client/ui/main_screen_with_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocs/notes_cubit.dart';
import '../blocs/notes_search_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: SearchAppBar(),
      body: const NotesNotFoundScreen(),
    );
  }
}

class NotesNotFoundScreen extends StatelessWidget {
  const NotesNotFoundScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchCubit = context.read<NotesSearchCubit>();

    return Container(
      child: StreamBuilder<NotesSearchState>(
          stream: searchCubit.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MainScreenWithContent(notes: snapshot.data!.currentNotes);
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    //Image.asset('assets/images/no_notes.png'),
                    Text(
                      'File not found. Try searching again',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
