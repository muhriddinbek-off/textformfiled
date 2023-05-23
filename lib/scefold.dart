import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'cheack.dart';
import 'navigator.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {


  final _formfiled = GlobalKey<FormState>();
  final fullname = TextEditingController();
  final emailcontroller = TextEditingController();
  final numbercontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final password1controller = TextEditingController();

  Widget input ({
    required String source, 
    required String label, 
    required String error, 
    required TextInputType keyboardType,
    required IconData icon,
    required TextEditingController controller,
    int a = 0,
    }) {
    return TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(source)),
                ],
                keyboardType: keyboardType,
                validator: (value) {
                  if (value == null || value.toString().length<a){
                    return error;
                  }
                  return null;
                },
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  labelText: label,
                  suffixIcon: Icon(icon),
                ),
              );
  }

  Widget form () {
    return Form(
      key: _formfiled,
      child: 
        Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                children: [
                  input(
                        error: 'Xato', 
                        icon: Icons.person, 
                        keyboardType: TextInputType.text, 
                        label: 'Full Name', 
                        source: "[a-z A-Z'.-]",
                        controller: fullname,
                        a: 5,
                        ),
                        SizedBox(height: 20,),
                        input(
                        error: 'Login nato\'g\'ri', 
                        icon: Icons.mail, 
                        keyboardType: TextInputType.emailAddress, 
                        label: 'Email Adress', 
                        source: "[A-z a-z0-9 @gmail.]",
                        controller: emailcontroller,
                        a: 15,
                        ),
                        SizedBox(height: 20,),
                        input(
                        error: "nomer nato'g'ri", 
                        icon: Icons.call, 
                        keyboardType: TextInputType.number, 
                        label: 'Phone Number', 
                        source: "[0-9]",
                        controller: numbercontroller,
                        a: 8,
                        ),
                        SizedBox(height: 20,),
                        input(
                        error: "Parol nato'g'ri", 
                        icon: Icons.security, 
                        keyboardType: TextInputType.visiblePassword, 
                        label: 'Password', 
                        source: "[A-z a-z 0-9]",
                        controller: passwordcontroller,
                        a: 6,
                        ),
                        SizedBox(height: 20,),
                        input(
                        error: "Parol nato'g'ri", 
                        icon: Icons.check_circle, 
                        keyboardType: TextInputType.visiblePassword, 
                        label: 'Confirm Password', 
                        source: "[A-z a-z 0-9]",
                        controller: password1controller,
                        a: 6,
                        ),
                ],
              ),
            ),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Center(
              child: Text(
                'Create Account',
                style: TextStyle(fontSize: 32, 
                fontWeight: FontWeight.bold)),
            ),
          ),
          
            form(),
            
          onchange(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              height: 52,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))),
                ),
                onPressed: (){
                  setState(() {
                    if (_formfiled.currentState!.validate()){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => boshqasahifa()),
                      );
                    }
                  });
                }, child: const Text('Create Account', style: TextStyle(fontSize: 20),)),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 70),
                  child: Text('Already have an account?', style: TextStyle(color: Colors.blue.shade400, fontSize: 14),),
                ),
               const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Text('   Login', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}