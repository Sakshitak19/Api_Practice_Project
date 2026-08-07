import 'package:flutter/material.dart';
import 'product_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List products = [];

   getProduct() async{
    final response = await http.get(Uri.parse("https://dummyjson.com/products"),
    );
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      setState((){
        products = data["products"];
      });
       print(products.length);
    }else{
print("Failed to fetch products");
    }
    }
  
  @override
  void initState(){
    super.initState();
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
     body: products.isEmpty ? const Center(child: CircularProgressIndicator(),) : ListView.builder(
      itemCount:products.length,
      itemBuilder: (context, index){
        return GestureDetector(
          onTap:() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailPage(
              product:products[index],
            ),
            ),
            );
           
          },

          child: Card(
            child: ListTile(
              title: Text(products[index]["title"]),
              subtitle: Text(products[index]["description"]),
              trailing: Text('\$${products[index]["price"]}'),
            ),
          ),

        );
      }
     ),

    );
  }
}