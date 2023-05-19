import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  final String? imageUrl;
  
  const ImageView({super.key,required this.imageUrl});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Hero(
              tag: widget.imageUrl!,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(widget.imageUrl!,fit: BoxFit.cover,)),
            ),
              Container(
                 height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomCenter,
               
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                   GestureDetector(
                    onTap: () => Navigator.pop(context),
                     child: Stack(children: [
                      Container(
                         width: MediaQuery.of(context).size.width/2,
                         height: 55,
                         color: Color(0xff1C1B1B).withOpacity(0.8),
                      ),
                       Container(
                        width: MediaQuery.of(context).size.width/2,
                        height: 55,
                        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white60,width: 1),
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(colors: [
                            Color(0x36FFFFFF),
                            Color(0x36FFFFFF),
                          ]
                          )
                        ),
                        child: Column(
                          children: [
                            Text("Set Wallpaper",style: TextStyle(fontSize: 16,color: Colors.white70)),
                            Text("Image will be saved in gallery",style: TextStyle(fontSize: 10,color: Colors.white70),)
                          ],
                        ),
                        
                   
                      ),
                     ],),
                   ),
                    const SizedBox(height: 5,),
                    Text("Cancel",style: TextStyle(color: Colors.white),),
                    const SizedBox(height: 50,)
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}