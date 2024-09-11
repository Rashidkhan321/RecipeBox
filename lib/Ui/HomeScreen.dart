import 'package:flutter/material.dart';
import 'package:recipebox/ApiBase/dataclass/recipeApidata.dart';
import 'package:recipebox/Ui/recipeDetail.dart';

import 'cat.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final obj = apidata();
  @override
  void initState() {
    obj.getdata();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Home Screen')),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       Categorycomponent(),
          Expanded(
            child:
            FutureBuilder(future: obj.getdata(), builder: (context, snapshot){
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
            
                  return Column(
                    children: [
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              recipeDetail(imageurl: snapshot.data!.meals![index].strMealThumb.toString(),
                                  strIngredient1: snapshot.data!.meals![index].strIngredient1.toString(),
                                  strIngredient2: snapshot.data!.meals![index].strIngredient2.toString(),
                                  strIngredient3:snapshot.data!.meals![index].strIngredient3.toString(),
                                  strIngredient4: snapshot.data!.meals![index].strIngredient4.toString(),
                                  strIngredient5:snapshot.data!.meals![index].strIngredient5.toString(),
                                  strMeasure1:snapshot.data!.meals![index]. strMeasure1.toString(),
                                  strMeasure2:snapshot.data!.meals![index]. strMeasure2.toString(),
                                  strMeasure3: snapshot.data!.meals![index]. strMeasure3.toString(),
                                  strMeasure4:snapshot.data!.meals![index]. strMeasure4.toString(),
                                  strMeasure5: snapshot.data!.meals![index].strMeasure5.toString(),
                                deatil: snapshot.data!.meals![index].strInstructions.toString(),
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






class imagepick extends StatelessWidget {

  final imageurl;
  final imagpet;
  double   height;
  double width;


  imagepick({Key? key,
    required this.imageurl,
    required this.imagpet,
    this.height = 400,
    this.width=900

  }) : super(key: key,

  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Image(
        fit: imagpet,
        image: NetworkImage(imageurl),
        loadingBuilder: ( BuildContext context, Widget child, ImageChunkEvent? loading ){

          if(loading==null)
            return child;
          return Container(
            height: height,
            width: width,
            // MediaQuery.of(context).size.height *
            //    0.4,
            // width: MediaQuery.of(context).size.width *
            //   0.9,
            decoration: BoxDecoration(
                color: Colors.green.shade200
            ),
            child: Center(


            ),
          );
        },
        errorBuilder: (contex, exception, stack){
          return Container(
            decoration: BoxDecoration(
                color: Colors.green.shade200
            ),

            height:
            MediaQuery.of(context).size.height *
                0.3,
            width: MediaQuery.of(context).size.width *
                0.9,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Icon(Icons.wifi_off, color: Colors.black,
                    size: 30,),
                  Container(
                      margin: EdgeInsets.only(bottom: 13),
                      child: Text('check internet connection!'))
                ],
              ),
            ),
          );
        },

      ),
    );
  }
}