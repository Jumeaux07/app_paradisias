import 'package:app_paradisias/model/api_response.dart';
import 'package:app_paradisias/screen/home_screen.dart';
import 'package:app_paradisias/service/user_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController textUername = TextEditingController();
  TextEditingController textPassword = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  bool _loading = false;

  void _login(String username, String password) async {
    ApiResponse apiResponse = await loginUser(username, password);
    if (apiResponse.error == null) {
      print("connecté");
      setState(() {
        _loading = false;
      });
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);
    } else {
      setState(() {
        _loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${apiResponse.error}'),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Form(
          key: key,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Icon Login or App
                Icon(
                  Icons.person,
                  color: Colors.teal,
                  size: 150,
                ),
                //Text Of App
                Text(
                  'Paradisias',
                  style: TextStyle(fontSize: 45),
                ),
                SizedBox(
                  height: 10,
                ),
                //Username TextFormFiled
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[200],
                      ),
                      child: TextFormField(
                        controller: textUername,
                        validator: (e) =>
                            e!.isEmpty ? 'Champ obligatoire' : null,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            border: InputBorder.none,
                            hintText: 'Username'),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                //Password TextFormFiled
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[200],
                      ),
                      child: TextFormField(
                        controller: textPassword,
                        validator: (e) =>
                            e!.isEmpty ? 'Champ obligatoire' : null,
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            border: InputBorder.none,
                            hintText: 'Password'),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                //Login Button
                GestureDetector(
                  onTap: () {
                    if (key.currentState!.validate()) {
                      setState(() {
                        _loading = true;
                      });
                      print('----Connexion----');
                      _login(textUername.text, textPassword.text);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.teal,
                        ),
                        padding: EdgeInsets.all(10),
                        child: Center(
                            child: _loading
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    'Connexion',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
