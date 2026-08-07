import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'footer.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String message = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  loginApi()async{
    final response = await http.post(Uri.parse('http://dummyjson.com/auth/login'),body:{
      'username': nameController.text,
      'password': passwordController.text,
     
    });

    if(response.statusCode==200){
      setState(() {
        message="";
        
      });
      
       Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context)=>FooterPage(),
       ),
       );
     
    }else{
      setState((){
        message = "Login failed";
      });
    }
  }
    

   
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText:"name",
              border: OutlineInputBorder(),
            ),

            validator:(value){
              if(value==null || value.isEmpty){
                return "please Enter name";
              }
              return null;
            },
          ),

          const SizedBox(height: 20),
          
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText:"password",
              border: OutlineInputBorder(),
            ),
            validator:(value){
              if(value==null || value.isEmpty){
                return "please Enter password";
              }
              if(value.length<8){
                return "password must be 8 character";
              }
              return null;
            },
           
          ),
          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: (){
              if(_formKey.currentState!.validate()){
                loginApi();
              }
            },
            child: const Text("Login"),
          ),
          const SizedBox(height: 20),
          Text(message,style:TextStyle(color: Colors.red,fontSize: 20),
          ),

         // Image.network("https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTExL3JtNTUxLTExLW1hY2Jvb2stMTFhLnBuZw.png"),
         //Image.asset("assets/images/img19.png"),

        ],),
     
      ),
      ),
    );
  }
}