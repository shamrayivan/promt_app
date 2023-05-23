import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Умный советчик"),
      ),
      body: Wrap(
        alignment: WrapAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //   margin: const EdgeInsets.all(15),
          //   color: Colors.black,
          //   width: MediaQuery.of(context).size.width / 2 - 30,
          //   height: MediaQuery.of(context).size.height / 5,
          //   child: const Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text(
          //         "помогу кинуть кубик",
          //         style: TextStyle(color: Colors.white),
          //       )
          //     ],
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/randomScreen');
            },
            child: Container(
              margin: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width / 2 - 30,
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(
                          1, 1), // changes position of shadow
                    ),
                  ],
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Карманный рандомайзер",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/coinScreen');
            },
            child: Container(
              margin: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width / 2 - 30,
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(
                          1, 1), // changes position of shadow
                    ),
                  ],
                  color: const Color(0xFF028E9B),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Электронная монетка\nДа / Нет",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/chooseScreen');
            },
            child: Container(
              margin: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width / 2 - 30,
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(
                          1, 1), // changes position of shadow
                    ),
                  ],
                  color: const Color(0xFFEB0072),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Сделай правильный выбор",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),),
        ],
      ),
    );
  }
}
