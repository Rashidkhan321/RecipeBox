import 'package:flutter/material.dart';
import 'package:recipebox/ApiBase/dataclass/subcatdeatilapidata.dart';

class subcatdetailScreen extends StatefulWidget {
  final imageurl,idmeal;
  const subcatdetailScreen({Key? key,
    //
    required this.imageurl,
    required this.idmeal

  }) : super(key: key);

  @override
  State<subcatdetailScreen> createState() => _subcatdetailScreenState();
}

class _subcatdetailScreenState extends State<subcatdetailScreen> {
  final obj = subcatdeatilapidata();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.imageurl),
                fit: BoxFit.fill
            )
        ),
        child: FutureBuilder(future: obj.getdata( widget.idmeal.toString()
            ), builder: (context, snapshot){
          print(widget.idmeal);
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }
          else if(snapshot.hasError){
            return Center(child: Text(snapshot.hasError.toString()));
          }
          else{
            return ListView.builder(
              itemCount: snapshot.data!.meals!.length,
              itemBuilder: ( context,  index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4)
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 300,),

                            Table(
                              border: TableBorder.all(),
                              children: [
                                TableRow(
                                    decoration: BoxDecoration(color: Colors.grey[300]),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Components', textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Quantity', textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20,),),
                                      )
                                    ]
                                ),
                                TableRow(

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(snapshot.data!.meals![index].strIngredient1.toString(), textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20,color: Colors.white),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(snapshot.data!.meals![index].strMeasure1.toString(), textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20,color: Colors.white),),
                                      )
                                    ]
                                ),
                                TableRow(

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(snapshot.data!.meals![index].strIngredient2.toString(), textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20,color: Colors.white),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(snapshot.data!.meals![index].strMeasure2.toString(), textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20,color: Colors.white),),
                                      )
                                    ]
                                ),
                                TableRow(

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(snapshot.data!.meals![index].strIngredient3.toString(), textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20,color: Colors.white),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(snapshot.data!.meals![index].strMeasure3.toString(), textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20,color: Colors.white),),
                                      )
                                    ]
                                ),
                                TableRow(

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(snapshot.data!.meals![index].strIngredient4.toString(), textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20,color: Colors.white),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(snapshot.data!.meals![index].strMeasure4.toString(), textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20,color: Colors.white),),
                                      )
                                    ]
                                ),
                                TableRow(

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(snapshot.data!.meals![index].strIngredient5.toString(), textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20,color: Colors.white),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(  snapshot.data!.meals![index].strMeasure5.toString(), textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20,color: Colors.white),
                                        ),
                                      )
                                    ]
                                ),

                              ],
                            ),
                            SizedBox(height: 10,),
                            Text(snapshot.data!.meals![index].strInstructions.toString(),
                              style: TextStyle(fontSize: 18,color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },

            );
          }
        }),
      ),

    );
  }
}
