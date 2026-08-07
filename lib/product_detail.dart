import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key,
  required this.product,
  
  });
  final Map product;
  

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {


int quantity = 1;
  addToCart() async{
    final response = await http.post(
      Uri.parse("https://dummyjson.com/carts/add"),
      headers: {
        "Content-Type":"application/json",
      },
      body: jsonEncode({
        "userId":1,
        "products":[
          {
            "id": widget.product["id"],
            "quantity":quantity,
          }
        ]
      }),
    );

    print("Status Code: ${response.statusCode}");
print("Response: ${response.body}");

    if(response.statusCode==201){

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Product added Successfully"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
          ),
      );
      print("Product added successfully");
      print(response.body);
    }else{
      print("Failed to Add to cart");
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Failed to add product"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
          ),
       );
    }
  }
 

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),


      body: Padding(padding: const EdgeInsets.all(16.0),
      
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
  
          Text(widget.product["title"], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 40),

          Image.network(widget.product["thumbnail"],
          height: 200,
          fit:BoxFit.cover,),
          SizedBox(height: 40),

          Text(widget.product["description"],),
          SizedBox(height: 20),
          Text("\$${widget.product["price"]}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [


              Text("Category: ${widget.product["category"]}",),

          Text("Brand: ${widget.product["brand"]}",),
            ],
          ),
      

          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.product["availabilityStatus"],),

          Text(widget.product["shippingInformation"],),

            ],
          ),
          

          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Row(
                children: [
                  IconButton(onPressed: (){
                    if(quantity>1){
                      setState(() {
                        quantity--;
                      });
                    }
                  }, icon: Icon(Icons.remove),
                  ),

                  Text(quantity.toString(),),

                  IconButton(onPressed: (){
                    setState(() {
                      quantity++;
                    });
                  }, icon: Icon(Icons.add),
                  ),
                ],
              ),
                ElevatedButton(onPressed: () async{
                  await addToCart();
                },

          
          child: Text("Add to Cart"),
          ),

            ElevatedButton(onPressed: (){

          }, child: Text("Add to Wishlist"),),

            ],
          ),

        

          
        ]
      ),
      )
      ),
    );
  }
}