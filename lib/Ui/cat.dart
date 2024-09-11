import 'package:flutter/material.dart';
import 'package:recipebox/ApiBase/dataclass/catapidata.dart';
import 'package:recipebox/ApiBase/dataclass/subcatapidata.dart';
import 'package:recipebox/Ui/subcatmodalScreen.dart';

import 'HomeScreen.dart';

class Categorycomponent extends StatefulWidget {
  const Categorycomponent({Key? key}) : super(key: key);

  @override
  State<Categorycomponent> createState() => _CategorycomponentState();
}

class _CategorycomponentState extends State<Categorycomponent> {
   final obj = catapi();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child:   FutureBuilder(future: obj.getdata(), builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(child: Container());
        }
        else if(snapshot.hasError){
          return Center(child: Text(snapshot.hasError.toString()));
        }
        else{
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.meals!.length,
              itemBuilder: (context, index){

                return
                  Row(
                    children: [
                      SizedBox(width: 4,),

                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              CategoryScreen(catname: snapshot.data!.meals![index].strCategory.toString(),)));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            height: 30,
                            color: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(snapshot.data!.meals![index].strCategory.toString(), style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );

              });
        }
      }),
    );
  }
}
class CategoryScreen extends StatefulWidget {
  final catname;
  const CategoryScreen({Key? key, required this.catname}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final obj = subcatapidata();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text(widget.catname.toString())),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(future: obj.getdata(widget.catname.toString()), builder: (context, snapshot){
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }
              else if(snapshot.hasError){
                return Center(child: Text(snapshot.hasError.toString()));
              }
              else{
                return ListView.builder(
                    itemCount: snapshot.data!.meals!.length,
                    itemBuilder: (context, index){
print(widget.catname);
                      return Column(
                        children: [
                          SizedBox(height: 10,),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                  subcatdetailScreen(imageurl: snapshot.data!.meals![index].strMealThumb.toString(),
                                    idmeal: snapshot.data!.meals![index].idMeal.toString(),
                               )));
                            },
                            child: ClipRRect(

                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                child: imagepick(imageurl: snapshot.data!.meals![index].strMealThumb.toString(),
                                    imagpet: BoxFit.cover),
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              }
            }),
          )
        ],
      ),
    );
  }
}

