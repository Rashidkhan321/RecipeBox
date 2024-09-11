import 'package:flutter/material.dart';

class recipeDetail extends StatefulWidget {
  final imageurl,strIngredient1,strIngredient2,
      strIngredient3,strIngredient4,strIngredient5;
  final strMeasure1,strMeasure2,strMeasure3,strMeasure4,
      strMeasure5,
      deatil;
  const recipeDetail({Key? key,
  //
  required this.imageurl,
    required this.strIngredient1,
    required this.strIngredient2,
    required this.strIngredient3,
    required this.strIngredient4,
    required this.strIngredient5,
    required this.strMeasure1,
    required this.strMeasure2,
    required this.strMeasure3,
    required this.strMeasure4,
    required this.strMeasure5,
    required this.deatil
  }) : super(key: key);

  @override
  State<recipeDetail> createState() => _recipeDetailState();
}

class _recipeDetailState extends State<recipeDetail> {
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
          child: Align(
            alignment: Alignment.bottomCenter,
            child:
                Center(
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
                                        child: Text(widget.strIngredient1, textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20,color: Colors.white),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(widget.strMeasure1, textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20,color: Colors.white),),
                                      )
                                    ]
                                ),
                                TableRow(
                        
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(widget.strIngredient2, textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20,color: Colors.white),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(widget.strMeasure2, textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20,color: Colors.white),),
                                      )
                                    ]
                                ),
                                TableRow(
                        
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(widget.strIngredient3, textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20,color: Colors.white),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(widget.strMeasure3, textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20,color: Colors.white),),
                                      )
                                    ]
                                ),
                                TableRow(
                        
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(widget.strIngredient4, textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20,color: Colors.white),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(widget.strMeasure4, textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20,color: Colors.white),),
                                      )
                                    ]
                                ),
                                TableRow(
                        
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(widget.strIngredient5, textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20,color: Colors.white),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(widget.strMeasure5, textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20,color: Colors.white),
                                        ),
                                      )
                                    ]
                                ),
                        
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text(widget.deatil.toString(),
                              style: TextStyle(fontSize: 18,color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),


          ),
        ),

    );
  }
}
