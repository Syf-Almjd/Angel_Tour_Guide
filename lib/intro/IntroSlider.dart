import 'package:Angel/intro/WidgetMaking/EachPage.dart';
import 'package:Angel/screens/login/login.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';

class IntroSlider extends StatefulWidget {
  const IntroSlider({super.key});

  @override
  _IntroSliderState createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  PageController controller = PageController();

  final titlemessage = [
    "Slide right for More!",
    "Safe",
    "Easy",
    "Adventurous",
    "Get on started!"
  ];
  final messages = [
    "We try to help millions of navigate around.\n\n\n\n Get more by Sliding right!",
    "We provide you with links to different places with information and more. ",
    "This allows you to go wherever you need with us",
    "All you need is packaged!",
    "We got your back, there is no need to worry any more! \n \n What are you still waiting for?"
  ];
  final images = [
    'assets/slide1.gif',
    'assets/slide2.gif',
    'assets/slide3.gif',
    'assets/slide4.gif',
    'assets/slide5.gif',
  ];
  int numberOfPages = 5;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemCount: numberOfPages,
            itemBuilder: (BuildContext context, int index) {
              return EachPage(
                  titlemessage[index], messages[index], images[index]);
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Flexible(
                    child: (currentPage == numberOfPages - 1)
                        ? GestureDetector(
                            onTap: () {},
                            child: MyButton(
                              onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                              ),
                              buttonText: 'Start',
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              controller.jumpToPage(numberOfPages - 1);
                            },
                            child: const Text(
                              "\n SKIP",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
