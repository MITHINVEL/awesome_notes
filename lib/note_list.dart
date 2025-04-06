import 'package:flutter/material.dart';
import 'package:awesome_notes/note_card.dart';
class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 7,
        clipBehavior: Clip.none,
        itemBuilder: 
      (context,index){
      
        return Notecard(isInGrid: false);
        // return Container(
      },
      
      separatorBuilder: (context, index) => SizedBox(
        height: 4,
      ),
      ),
    );
  }
}


