import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/view/widgets/image_view.dart';

Widget bradndName(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Wallpaper",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
      Text("Wizard",style: TextStyle(color: Color.fromARGB(255, 35, 85, 37),fontWeight: FontWeight.w500),)
    ],
  );
}

Widget wallpaperList(List<WallpaperModel>wallpapers,context){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaperList) {
        return GridTile(
          child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ImageView(imageUrl: wallpaperList.src!.potrait,),)),
            child: Hero(
              tag:wallpaperList.src!.potrait!,
              child: Container(
                 child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(wallpaperList.src?.potrait ?? '',fit: BoxFit.cover,)),
            
              ),
            ),
          ));
      }).toList(),),
  );
}

 