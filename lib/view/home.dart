import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:wallpaper_app/controller/category_data.dart';
import 'package:wallpaper_app/model/model.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/view/categories.dart';
import 'package:wallpaper_app/view/search.dart';
import 'package:wallpaper_app/view/widgets/brand_name.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/view/widgets/image_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel>categories = [];
  List<WallpaperModel>walpapers = [];
  List<WallpaperModel>searchedWallpapers = [];
   final TextEditingController searchController = TextEditingController();

  Future getTrendingWallpapers()async{
    const apiKey = "DAeLFOu4jl7evDyfLo0ZRMyiTSN0rr5XT5gRfEobibaa0P0A74QL8mv7";
    const url = "https://api.pexels.com/v1/curated?page=2&per_page=40";
    final response = await http.get(Uri.parse(url),headers: {
      "Authorization":apiKey
    });
    log(response.body.toString());

    Map<String,dynamic>jsonData = jsonDecode(response.body);
    List<dynamic>photos = jsonData["photos"];
 
List<WallpaperModel>newList = [];
    for (var element in photos) {
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      newList.add(wallpaperModel);

      
    }
    setState(() {
      walpapers = newList;
    });

  }


  @override
  void initState() {
    getTrendingWallpapers();
     categories = getCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: bradndName(),
        elevation: 10,
        centerTitle: true,
        ),
        body: SingleChildScrollView(
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
                      onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(searchQuery: searchController.text,),)),
                      child: Container(child: Icon(Icons.search),),
                    )
                  ],)
                ),
                const SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  height: 80,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                     CategoriesTile(
                      title: categories[index].categoriesName,
                       imageUrl: categories[index].imageUrl),
                       itemCount: categories.length,),
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

class CategoriesTile extends StatelessWidget{

  final String? imageUrl,title;
const CategoriesTile({super.key,required this.title,required this.imageUrl});
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesScreen(categoryName: title!.toLowerCase()),)),
      child: Container(
        margin: const EdgeInsets.only(right: 4),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(imageUrl!,width: 100,height: 60,fit: BoxFit.cover,),
          ),
          Container(
            
            width: 100,height: 60,
            alignment: Alignment.center,
            child: Text(title!,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15),),)
        ],),
      ),
    );
  }
}
 