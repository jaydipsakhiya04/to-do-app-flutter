import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
        title: const Text(
          "Sign in",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          // color: Colors.redAccent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "phone number",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                decoration: InputDecoration(
                    hintText: "enter phone number", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Password",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.remove_red_eye),
                    hintText: "enter password",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Forgot password",
                style: TextStyle(color: Colors.deepOrangeAccent),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                minWidth: 360,
                height: 50,
                color: const Color.fromARGB(255, 225, 220, 220),
                onPressed: () {},
                child: const Text("Sign in"),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                     color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16),
                    child: const Text("or"),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey,

                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                color: Colors.lightBlue,
                height: 50,
                minWidth: 360,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('asset/images/ic_google.png',height: 24,width: 24,),
                    SizedBox(width: 10,),
                    const Text('Continue with Google',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                color: Colors.blueAccent,
                height: 50,
                minWidth: 360,
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('asset/images/icon_facebook.png',height: 24,width: 24,),
                    SizedBox(width: 10,),
                    const Text(
                      'Continue with facebook',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                color: Colors.black,
                height: 50,
                minWidth: 360,
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('asset/images/icon_apple.png'),
                    const SizedBox(width: 10,),
                    const Text('Continue with GoogleApple',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: RichText(
                  text: const TextSpan(children: <TextSpan>[
                    TextSpan(text: 'Do not have an account?',
                        style: TextStyle(color: Colors.black)
                    ),
                    TextSpan(
                        text: ' Sign Up',
                        style: TextStyle(color: Colors.deepOrange)),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
