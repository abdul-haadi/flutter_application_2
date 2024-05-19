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
    return GridView.builder(
  padding: const EdgeInsets.all(20),
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2),
  itemBuilder: (BuildContext context, int index) {
    return ImageItem(
      index: index,
      title: myList[index],
     imageAsset: 'assets/images/member_${index + 1}.png',
    );
  });
  }
}

class ImageItem extends StatefulWidget {
  final int index;
  final String title;
  final String imageAsset;

  const ImageItem({
    super.key,
    required this.index,
    required this.title,
    required this.imageAsset,
  });

  @override
  State<ImageItem> createState() => _ImageItemState();
}

class _ImageItemState extends State<ImageItem> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "image_${widget.index}", // Unique tag for animation
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImageDetailScreen(
                index: widget.index,
                title: widget.title,
                imageAsset: widget.imageAsset,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                tileMode: TileMode.mirror,
              ),
              image: DecorationImage(
                alignment: Alignment.center,
                opacity: 0.5,
                image: AssetImage(widget.imageAsset),
              ),
            ),
            child: Center(
              child: Text(
                widget.title,
                style: const TextStyle(color: Colors.black, decoration: TextDecoration.none, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ImageDetailScreen extends StatefulWidget {
  final int index;
  final String title;
  final String imageAsset;

  const ImageDetailScreen({
    super.key,
    required this.index,
    required this.title,
    required this.imageAsset,
  });

  @override
  State<ImageDetailScreen> createState() => _ImageDetailScreenState();
}

class _ImageDetailScreenState extends State<ImageDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Hero(
              tag: "image_${widget.index}", // Same tag for animation
              child: Center(
                child: Image.asset(
                  widget.imageAsset,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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