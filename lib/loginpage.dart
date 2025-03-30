import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jeet_meet/profile_1.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  // Dio _dio = Dio();
  // var _responds = "";

  // Future<void> Login() async {
  //   print("hai ghjklghjk=============================== ");
  //   try {
  //     FormData formData = FormData.fromMap({
  //       "username": username.text,
  //       "password": password.text,
  //     });
  //     final response = await _dio.post(
  //         'https://jeetmeet.b4production.com/api/student/login',
  //         data: formData);
  //     print("${response.data}");
  //     setState(() {
  //       _responds = "Responds:${response.data}";

  //       print("${response.data}");
  //       if (response.statusCode == 200) {
  //         if (response.data['status'] == "success") {
  //           Navigator.push(context,
  //               MaterialPageRoute(builder: (context) => myprofileone()));
  //         }
  //       }
  //     });
  //   } catch (e) {
  //     setState(() {
  //       print(e);
  //       _responds = "error:$e";
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 70,
          ),
          Image.asset("assets/loginpage.png"),
          SizedBox(
            width: double.infinity,
            height: 20,
          ),
          Text(
            "Login",
            style: TextStyle(
                color: Colors.red, fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Text(
              "Lorem Ipsum is simply dummy text of the \n       printing and typesetting industry."),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "User Name"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Password"),
            ),
          ),
          TextButton(onPressed: () {}, child: Text("Forgot your password")),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => myprofileone()));
              // Login();
            },
            child: Text(
              "Login",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(370, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ],
      ),
    );
  }
}
