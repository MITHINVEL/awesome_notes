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
                  child: Icon(Icons.search,size: 30,),
                ),
           
                fillColor: white,
                filled: true,
                isDense: true,
                contentPadding: EdgeInsets.zero,
                prefixIconConstraints: BoxConstraints(
                  minHeight: 42,
                  maxWidth: 42
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
            Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_downward),
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
              padding: const EdgeInsets.only(left: 8),
              child: const Icon(
                Icons.arrow_downward,
                size: 18,
                color: gray700,
              ),
            ),
          
            
            items: dropdownOptions
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: const TextStyle(
                          fontFamily: 'poppins',
                          color: gray700,
                        ),
                      ),
                    ))
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
            onPressed: () {},
            icon: const Icon(Icons.menu),
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
          SizedBox(height: 5,),
          Expanded(
            child: GridView.builder(
              itemCount: 11,
              
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
             // Adjusted spacing between grid items
              ),
              itemBuilder: (context, int index) {
                return Container(

                 decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: primary),
                 
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                    
                      children: [
                        const Text(
                          "This is going to be a title",
                          style: TextStyle(
                            fontFamily: 'fredoka',
                          ),
                        ),
                       
                       SizedBox(height: 6,),
                        Row(
                          children: const [
                             Text("First chip"),
                            
                          ],
                        ),
                          SizedBox(height: 6,),
                        const Text("Some Content"),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("02 Nov, 2023"),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
          ],
        ),
      ),
    );
  
}
}