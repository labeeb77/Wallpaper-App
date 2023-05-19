import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/view/widgets/brand_name.dart';

class CategoriesScreen extends StatefulWidget {
  final String? categoryName;
  const CategoriesScreen({super.key,this.categoryName});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
    List<WallpaperModel>walpapers = [];

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
    getSearchedWallpapers(widget.categoryName!);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: bradndName(),
        elevation: 10,
        centerTitle: true,
        automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
              child: Column(
                children: [
                 
            
                  const SizedBox(height: 20,),
                  wallpaperList(walpapers, context)
                ],
              ),
            ),
        ),

    );
  }
}