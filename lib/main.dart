import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _currentStep = 0;
  int? selectedIndex = null;
  // double height = 200;
  List<String> myList = [
    "Activity 1",
    "Anshul GLS",
    "Activity 3",
    "Activity 4",
    "Activity 5",
    "Activity 6",
    "Activity 7",
    "Activity 8",
    "Activity 9",
    "Activity 10"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            children: List.generate(10, (index) {
              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Material(
                        color: Colors.transparent,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/member_${index + 1}.png"),
                              )),
                              child: Padding(
                                padding: const EdgeInsets.all(90.0),
                                child: Text(myList[index], style: const TextStyle(fontSize: 50, color: Colors.amber)),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: const LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment(0.2, 0.8),
                        colors: <Color>[
                          Color(0xff1f005c),
                          Color(0xff5b0060),
                          Color(0xff870160),
                          Color(0xffac255e),
                          Color(0xffca485c),
                          Color(0xffe16b5c),
                          Color(0xfff39060),
                          Color(0xffffb56b),
                        ],
                        tileMode: TileMode.mirror),
                    image: DecorationImage(
                      alignment: Alignment.center,
                      opacity: 0.5,
                      image: AssetImage(
                        'assets/images/member_${index + 1}.png',
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      myList[index],
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              );
            })),
      ),
    );
    // body: RefreshIndicator(
    //       onRefresh: _onRefresh,
    //       child: Column(
    //         children: [
    //           Center(

    //               child: Stepper(
    //                 steps: const [
    //                   Step(
    //                       title: Text("Step 1"),
    //                       content: Text("Complete this step 1")),
    //                   Step(
    //                       title: Text("Step 2"),
    //                       content: Text("Complete this step 2")),
    //                   Step(
    //                       title: Text("Step 3"),
    //                       content: Text("Complete this step 3")),
    //                 ],
    //                 onStepTapped: (int newIndex) {
    //                   setState(() {
    //                     _currentStep = newIndex;
    //                   });
    //                 },
    //                 currentStep: _currentStep,
    //                 onStepContinue: () {
    //                   if (_currentStep != 2) {
    //                     setState(() {
    //                       _currentStep += 1;
    //                     });
    //                   }
    //                 },
    //                 onStepCancel: () {
    //                   if (_currentStep != 0) {
    //                     setState(() {
    //                       _currentStep -= 1;
    //                     });
    //                   }
    //                 },
    //               ),
    //           ),
    //           AnimatedContainer(
    //             height: height,
    //             width: 200,
    //             duration: const Duration(seconds: 1),
    //             curve: Curves.bounceInOut,
    //             decoration: const BoxDecoration(
    //               gradient: LinearGradient(
    //                   begin: Alignment.topLeft,
    //                   end: Alignment(0.8, 1),
    //                   colors: <Color>[
    //                     Color(0xff1f005c),
    //                     Color(0xff5b0060),
    //                     Color(0xff870160),
    //                     Color(0xffac255e),
    //                     Color(0xffca485c),
    //                     Color(0xffe16b5c),
    //                     Color(0xfff39060),
    //                     Color(0xffffb56b),
    //                   ],
    //                   tileMode: TileMode.mirror),
    //             ),
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //               print('Flutter Icon Button was tapped!');
    //             },
    //             child: Padding(
    //               padding: const EdgeInsets.all(20.0),
    //               child: Container(
    //                 height: 50,
    //                 padding: const EdgeInsets.all(8),
    //                 margin: const EdgeInsets.symmetric(horizontal: 8),
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(5),
    //                   color: Colors.lightGreen[500],
    //                 ),
    //                 child: const Center(child: Icon(Icons.flutter_dash_rounded)),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }

    // Future<void> _onRefresh() async {
    //   setState(() {
    //     height = 0;
    //   });
    //   return Future.delayed(
    //     const Duration(seconds: 4),
    //   ).then((value) => setState(() {
    //         height = 210;
    //       }));
  }
}
