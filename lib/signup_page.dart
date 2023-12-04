import 'package:ecommerce_2/home_screen.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  String selectedvalue = "English";
  bool isSelected = false;
 final _formkey =GlobalKey<FormState>();
TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  TextEditingController firstnameController = TextEditingController();
  TextEditingController secondnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //DROPDOWNBUTTOM
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height / 5,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Card(
                          elevation: 8,
                          child: DropdownButton(
                              // padding: const EdgeInsets.symmetric(horizontal:5, vertical :5),
                              alignment: Alignment.center,
                              isDense: true,
                              elevation: 0,
                              focusColor: Colors.white,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Color.fromARGB(255, 6, 125, 223),
                              ),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 6, 125, 223),
                                fontWeight: FontWeight.bold,
                              ),
                              value: selectedvalue,
                              items: menuItems,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedvalue = newValue!;
                                });
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2.5,
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: TextFormField(
                                validator: (value) {
                              if(value!.isEmpty){return "name is required!!";}else if (
                                !RegExp( r'^[a-zA-Z ]+$').hasMatch(value)){
                                  return "Enter a correct name";
                                }
                              else
                             { return null;}
                            },
                                controller: firstnameController,
                                decoration: const InputDecoration(
                                    isDense: true,
                                    hintText: "First Name",
                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      // fontWeight: FontWeight.bold
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none
                                        // borderRadius: BorderRadius.all(Radius.circular(20)),
                                        )),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2.5,
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: TextFormField(
                                validator: (value) {
                              if(value!.isEmpty){return "name is required!!";}else if (
                                !RegExp( r'^[a-zA-Z ]+$').hasMatch(value)){
                                  return "Enter a correct name";
                                }
                              else
                             { return null;}
                            },
                                controller: secondnameController,
                                decoration: const InputDecoration(
                                    isDense: true,
                                    hintText: "Last Name",
                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      // fontWeight: FontWeight.bold
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none
                                        // borderRadius: BorderRadius.all(Radius.circular(20)),
                                        )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .01,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: TextFormField(
                            validator: (value) {
                              if(value!.isEmpty){return "email is required!!";}else if (
                                !RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$').hasMatch(value)){
                                  return "Enter a valid email";
                                }
                              else
                             { return null;}
                            },
                            controller: emailController,
                            decoration: const InputDecoration(
                                isDense: true,
                                hintText: "Email",
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  // fontWeight: FontWeight.bold
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none
        
                                    // borderRadius: BorderRadius.all(Radius.circular(20)),
                                    )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .01,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: TextFormField(
                           
                            obscureText: true,
                            validator: (value) {
                              if(value!.isEmpty){return "password is required!!";}else if (
                                !RegExp( r'^[a-zA-Z0-9]+$').hasMatch(value)){
                                  return "password should be combination of numbers and alphabets";
                                }
                              else
                             { return null;}
                            },
                            controller: passwordController,
                            decoration: const InputDecoration(
                                isDense: true,
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  // fontWeight: FontWeight.bold
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none
                                    // borderRadius: BorderRadius.all(Radius.circular(20)),
                                    )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .01,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: TextFormField(

                            validator: (value) {
                              if(value!.isEmpty){return "confirm password";}else if (
                                confirmpasswordController.text!=passwordController.text){
                                  return "password does match";
                                }
                              else
                             { return null;}
                            },
                            controller: confirmpasswordController,
                            decoration: const InputDecoration(
                                isDense: true,
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  // fontWeight: FontWeight.bold
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none
                                    // borderRadius: BorderRadius.all(Radius.circular(20)),
                                    )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * .01),
                    const Text(
                      "or Create with",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * .01),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .06,
                      width: MediaQuery.sizeOf(context).width / 2.3,
                      child: Card(
                        elevation: 0.00,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                                style: BorderStyle.solid, color: Colors.grey)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * .04,
                              width: MediaQuery.sizeOf(context).width / 10,
                              child: Image.asset(
                                "assets/images/google.png",
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * .04,
                              width: MediaQuery.sizeOf(context).width / 10,
                              child: Image.asset(
                                "assets/images/ios.png",
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * .04,
                              width: MediaQuery.sizeOf(context).width / 10,
                              child: Image.asset(
                                "assets/images/facebook.png",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: Colors.blue,
                            value: isSelected,
                            onChanged: (value) {
                              setState(() {
                                isSelected = !isSelected;
                              });
                            }),
                    const Text("By creating an account you agree to our "),
                    const Text(
                      "Terms and",
                      style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                      ),
                    ),
                               
                      ],
                    ),
                     const Padding(
                       padding: EdgeInsets.only(left: 30),
                       child: Row(
                        children: [
                                       Text(
                        "Condition",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                        ),
                                       ),
                                       Text(" and "),
                                       Text(
                        "Privacy Policy",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                        ),
                                       ),
                        ],
                                       ),
                     ),
                    SizedBox(
                              height: MediaQuery.sizeOf(context).height * .01),
                ElevatedButton(
                  style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                    backgroundColor: const MaterialStatePropertyAll(Colors.amber)
                  ),
          onPressed: () {
                  if (_formkey.currentState!.validate()) {
                   
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const HomeScreen();
                    }));
                  }
                }, child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100,vertical: 13),
                    child: Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ), ),
                   SizedBox(
                              height: MediaQuery.sizeOf(context).height * .01),
                 const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( "Already have an account? ",style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),),
                        Text("Login",style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                        ),)
                  ],
                )
                
                  ],
                ),
             
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<DropdownMenuItem<String>> menuItems = [
  const DropdownMenuItem(
    value: "English",
    child: Text("English"),
  ),
  const DropdownMenuItem(
    value: "French",
    child: Text("French"),
  ),
  const DropdownMenuItem(
    value: "Spanish",
    child: Text("Spanish"),
  ),
  const DropdownMenuItem(
    value: "Fante",
    child: Text("Fante"),
  ),
  const DropdownMenuItem(
    value: "Arabic",
    child: Text("Arabic"),
  ),
];
