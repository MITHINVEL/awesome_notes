// ignore_for_file: avoid_unnecessary_containers

import 'package:awesome_notes/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> dropdownOptions = [
    "Date modified",
    "date created",
   
  ];

  late String dropdownValue = dropdownOptions.first;
 bool isDescending =  true;
 bool isgrid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Awesome Notes 📒",
          style: TextStyle(
            fontFamily: 'fredoka',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
            style: IconButton.styleFrom(
              backgroundColor: primary,
              foregroundColor: white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: black),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        foregroundColor: white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: black),
          
        ),
        onPressed: () {
        
        },
        child: FaIcon(FontAwesomeIcons.plus),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search notes...",
                hintStyle: TextStyle(fontSize: 17),
                
                prefixIcon:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search,size: 25,),
                ),
           
                fillColor: white,
                filled: true,
                isDense: true,
                contentPadding: EdgeInsets.zero,
                prefixIconConstraints: BoxConstraints(
                  minHeight: 30,
                  maxWidth: 30
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: const Color.fromARGB(255, 238, 241, 3)),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Row(
        children: [
          IconButton(
            onPressed: () {
              isDescending = !isDescending;
            },
           icon: FaIcon(
              isDescending
                  ? FontAwesomeIcons.arrowDown
                  : FontAwesomeIcons.arrowUp,
              size: 20,
              color: gray700,
            ),
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            constraints: const BoxConstraints(),
            style: IconButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            iconSize: 25,
            color: gray700,
          ),
          const SizedBox(width: 10),
          DropdownButton(
            value: dropdownValue,
          icon: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: FaIcon(FontAwesomeIcons.arrowDownWideShort,size: 18,
            color: gray700,),
          ),
          underline: SizedBox.shrink(),          
            isDense: true,
            items: dropdownOptions
                .map((e) => DropdownMenuItem(
                
                      value: e,
                      child:Row(
                        children: [
                          Text(e),
                          if (e == dropdownValue)
                            FaIcon(FontAwesomeIcons.check,size: 18,
                              color: primary,)
                       
                     ]
                     )
                    )
                    )
                .toList(),
            selectedItemBuilder: (context) =>
                dropdownOptions.map((e) => Text(e)).toList(),
            onChanged: (newValue) {
              setState(() {
                dropdownValue = newValue.toString();
                
              });
            },
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
            setState(() {
              isgrid = !isgrid;
            });
            },
            
            
           icon: FaIcon(
              isgrid
                  ? FontAwesomeIcons.tableCellsLarge
                  : FontAwesomeIcons.bars,
              size: 20,
              color: gray700,
            ),
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            constraints: const BoxConstraints(),
            style: IconButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            iconSize: 25,
            color: gray700,
          ),
        ],
      ),
          SizedBox(height: 10,),
          Expanded(
            child: isgrid ? notegrid() :NotesList(),
          )
          ],
        ),
      ),
    );
  
}

  }
  class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 11,
      itemBuilder: 
    (context,index){
    
      return Notecard(isInGrid: false);
      // return Container(
    },
    );
  }
}
class Notecard extends StatelessWidget {
  const Notecard({
    required this.isInGrid,
    super.key,
  });

  final bool isInGrid;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: primary, width: 2),
        boxShadow: [
          BoxShadow(
            color: primary.withOpacity(0.5),
            blurRadius: 4,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              "This is going to be a title",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'fredoka',
                fontSize: 16,
                color: gray900,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  3,
                  (index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(106, 189, 184, 184),
                    ),
                    margin: const EdgeInsets.only(right: 8),
                    child: const Text(
                      "  First chip  ",
                      style: TextStyle(
                        color: gray700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            if (isInGrid)
              const Expanded(
                child: Text(
                  "Some Content",
                  style: TextStyle(
                    color: gray700,
                  ),
                ),
              )
            else
              const Text(
                "Some Content",
                style: TextStyle(
                  color: gray700,
                ),
              ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    const Text(
                      "02 Nov, 2023",
                      style: TextStyle(
                        color: gray700,
                        fontSize: 15,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

GridView notegrid() {
  return GridView.builder(
    itemCount: 11,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 7,
      crossAxisSpacing: 7,
    ),
    itemBuilder: (context, int index) {
      return Notecard(isInGrid: true);
    },
  );
}