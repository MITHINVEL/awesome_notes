// ignore_for_file: avoid_unnecessary_containers

import 'package:awesome_notes/core/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:awesome_notes/note_gride.dart';
import 'package:awesome_notes/note_list.dart';
import 'package:awesome_notes/note_search.dart';
import 'package:awesome_notes/not_fab.dart';
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
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: black),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatButton(),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            search_inputbox(),
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