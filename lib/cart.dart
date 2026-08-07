import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List allProduct=[];

  getCart() async{
    final response = await http.get(Uri.parse("https://dummyjson.com/carts"),
    );

    if(response.statusCode==200){
      final Data = jsonDecode(response.body);
      
      List carts = Data["carts"];

       setState(() {
    allProduct.clear();

    for (var cart in carts) {
      allProduct.addAll(cart["products"]);
    }
  });

    }else{
      print("failed to fetch the cart");
    }

  }

Widget productCart(Map<String,dynamic> product){
  return Card(
    child: ListTile(
      leading: Image.network(product["thumbnail"],
      width: 60,
      height: 60,),

      title: Text(product["title"]),
      subtitle: Text("Quantity: ${product["quantity"]}"),
      trailing: Text("\$${product["price"]}"),
    ),
  );
}



  @override

  void initState(){
    super.initState();
    getCart();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
      ),

      body: allProduct.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
      :ListView.builder(
       
        itemCount: allProduct.length,
        itemBuilder: (context,index){

          return productCart(allProduct[index]);

        //   List products = carts[cartIndex]["products"];

        //   return Card(

        //     margin: const EdgeInsets.all(10),
        //     child: Padding(padding: 
        //     const EdgeInsets.all(10),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [


        //         Text(
        //                   "Cart ID : ${carts[cartIndex]["id"]}",
        //                   style: const TextStyle(
        //                     fontSize: 18,
        //                     fontWeight: FontWeight.bold,
        //                   ),
        //                 ),

        //                 const SizedBox(height: 10),



        //         ListView.builder(
        //            shrinkWrap: true,
        //                   physics: const NeverScrollableScrollPhysics(),
        //           itemCount: products.length,
        //           itemBuilder:(context,productIndex) {

        //             return ListTile(
        //               leading: Image.network(
        //                 products[productIndex]["thumbnail"],
        //                 width: 50,

        //                 height: 50,
        //               ),

        //               title: Text(products[productIndex]["title"]),
        //               subtitle: Text("Quantity:${products[productIndex]["quantity"]}"),

        //               trailing: Text("\$${products[productIndex]["price"]}",),

                      
        //             );
                

        //         },
        //         ),
        //       ],
        //     ),
        //     ),
        //   );

       

         },
      ),
      
      

        
      
    );
  }
}