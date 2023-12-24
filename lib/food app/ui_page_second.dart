import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(227, 231, 240, 1),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.8,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('asset/images/pc1.png'), fit: BoxFit.fill),
            ),
            child: const Column(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 160),
                    child: Image(
                      image: AssetImage('asset/images/pc.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            color: Colors.deepOrange,
            height: 50,
            minWidth: 360,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            onPressed: () {},
            child: const Text('Sign in', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(
            height: 10,
          ),

          Row(
            children: [
              const SizedBox(
                width: 24,
              ),
              Expanded(
                  child: Container(
                height: 1,
                color: Colors.grey,
              )),
              const Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text("or"),
              ),
              Expanded(
                  child: Container(
                height: 1,
                color: Colors.grey,
              )),
              const SizedBox(
                width: 24,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24,right: 24),
            child: MaterialButton(
              color: Colors.lightBlue,
              height: 50,
              minWidth: 360,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "asset/images/ic_google.png",
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(
                    width: 21,
                  ),
                  const Text('Continue with Google',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24,right: 24),
            child: MaterialButton(
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
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24,right: 24),
            child: MaterialButton(
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
          ),
          const SizedBox(
            height: 15,
          ),
          RichText(
            text: const TextSpan(children: <TextSpan>[
              TextSpan(text: 'Do not have an account?',
                  style: TextStyle(color: Colors.black)
              ),
              TextSpan(
                  text: ' Sign Up', style: TextStyle(color: Colors.deepOrange)),
            ]),
          ),
        ],
      ),

      // body: Column(
      //   children: [
      //     Stack(
      //       children: [
      //         Expanded(
      //           child: Image(
      //             height: MediaQuery.of(context).size.height,
      //             width: double.infinity,
      //             fit: BoxFit.cover,
      //             image: const AssetImage('asset/images/pc1.png'),
      //           ),
      //         ),
      //         const Image(
      //           height: 430,
      //           image: AssetImage('asset/images/pc.png'),
      //         ),
      //       ],
      //     ),
      //     const SizedBox(
      //       height: 5,
      //     ),
      //     Container(
      //       height: 50,
      //       width: 340,
      //       decoration: const BoxDecoration(
      //         borderRadius: BorderRadius.all(Radius.circular(35)),
      //         color: Colors.deepOrange,
      //       ),
      //       child: const Center(
      //         child: Text(
      //           "Sign in",
      //           style: TextStyle(fontSize: 16, color: Colors.white),
      //         ),
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 10,
      //     ),
      //     const Divider(
      //       thickness: 3,
      //     ),
      //     const SizedBox(
      //       height: 10,
      //     ),
      //     Container(
      //       height: 50,
      //       width: 340,
      //       decoration: const BoxDecoration(
      //         borderRadius: BorderRadius.all(Radius.circular(35)),
      //         color: Colors.blue,
      //       ),
      //       child: const Center(
      //         child: Text(
      //           "Continue with Google",
      //           style: TextStyle(fontSize: 16, color: Colors.white),
      //         ),
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 10,
      //     ),
      //     Container(
      //       height: 50,
      //       width: 340,
      //       decoration: const BoxDecoration(
      //         borderRadius: BorderRadius.all(Radius.circular(35)),
      //         color: Colors.blueAccent,
      //       ),
      //       child: const Center(
      //         child: Text(
      //           "Continue with Facebook",
      //           style: TextStyle(fontSize: 16, color: Colors.white),
      //         ),
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 10,
      //     ),
      //     Container(
      //       height: 50,
      //       width: 340,
      //       decoration: const BoxDecoration(
      //         borderRadius: BorderRadius.all(Radius.circular(35)),
      //         color: Colors.black,
      //       ),
      //       child: const Center(
      //         child: Text(
      //           "Continue with GoogleApple",
      //           style: TextStyle(fontSize: 16, color: Colors.white),
      //         ),
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 15,
      //     ),
      //     const Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Text("do not have an account?"),
      //         Text(
      //           "Sign Up",
      //           style: TextStyle(color: Colors.deepOrange),
      //         ),
      //       ],
      //     )
      //   ],
      // ),
    );
  }
}
