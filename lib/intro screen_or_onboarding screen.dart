import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:project_june1/splash2.dart';
import 'package:project_june1/stateful%20login%20with%20validation.dart';

void main(){
  runApp(MaterialApp(home: IntroScreen(),));
}
class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle:const TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 40,color: Colors.purple),
      bodyTextStyle: GoogleFonts.aBeeZee(
          fontStyle: FontStyle.italic,
          fontSize: 20,color: Colors.pinkAccent),
      boxDecoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.black,
          Colors.grey,
          Colors.white38,
        ],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft)
      )
    );
    return IntroductionScreen(
      pages: [
        PageViewModel(
          decoration: pageDecoration,
          title: 'First Page',
          body: "Introduction screen shows the details of the app and demo of pages",
          image: IntroImage("https://images.unsplash.com/photo-1663870244786-19cf8fe3ba40?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1032&q=80")
        ),
        PageViewModel(
            decoration: pageDecoration,
            title: 'Second Page',
            body: "Introduction screen shows the details of the app and demo of pages",
            image: IntroImage("https://plus.unsplash.com/premium_photo-1692193552327-3458ef3817c0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDd8eGpQUjRobGtCR0F8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=60")
        ),
        PageViewModel(
            decoration: pageDecoration,
            title: 'Third Page',
            body: "Introduction screen shows the details of the app and demo of pages",
            image: IntroImage("https://images.unsplash.com/photo-1691357045157-8ff460d12231?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDMwfHhqUFI0aGxrQkdBfHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=1000&q=60")
        )
      ],
      onDone: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Splash2())),
      onSkip: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login2())),
      showSkipButton: true,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward_rounded),
      done: const Text("Done"),
      dotsDecorator:  const DotsDecorator(
        size: Size(10, 12),
        color: Colors.grey,
        activeSize: Size(25, 12),
        activeColor: Colors.yellow,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))
        )),);}

  //custom widget
  Widget IntroImage(String image) {
    return Container(
      height: 700,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(image),))
    );
  }
}
