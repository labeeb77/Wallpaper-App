import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/view/widgets/brand_name.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  final String? searchQuery;
  const SearchScreen({super.key,this.searchQuery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
   final TextEditingController searchController = TextEditingController();
    List<WallpaperModel>walpapers = [];

    //-------- Search Function--------//
  Future getSearchedWallpapers(String query)async{
    const apiKey = "DAeLFOu4jl7evDyfLo0ZRMyiTSN0rr5XT5gRfEobibaa0P0A74QL8mv7";
    final url = "https://api.pexels.com/v1/search?query=$query&per_page=15&page=1";
    final response = await http.get(Uri.parse(url),headers: {
      "Authorization":apiKey
    });
    log(response.body.toString());

    Map<String,dynamic>jsonData = jsonDecode(response.body);
    List<dynamic>photos = jsonData["photos"];

    List<WallpaperModel> newWallpapers = [];
  for (var element in photos) {
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      newWallpapers.add(wallpaperModel);

    }
    setState(() {
      walpapers = newWallpapers;
    });

  }
  @override
  void initState() {
    getSearchedWallpapers(widget.searchQuery!);
    super.initState();
    searchController.text = widget.searchQuery!;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        title: bradndName(),
        elevation: 10,
        centerTitle: true,
        automaticallyImplyLeading: false,
        ),body:  SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 13),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 231, 220, 233),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(children: [
                      Expanded(child: 
                      TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "search wallpapers",
                          border: InputBorder.none
                        ),
                      )),
                      GestureDetector(
                    onTap: () {
                      getSearchedWallpapers(searchController.text);
                    },
                    child: Container(child: Icon(Icons.search)),
                      )
                    ],)
                  ),
            
                  const SizedBox(height: 20,),
                  wallpaperList(walpapers, context)
                ],
              ),
            ),
        ),

    );
  }
}