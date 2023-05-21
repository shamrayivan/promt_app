import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Умный советчик"),
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
              color: Colors.black,
              width: MediaQuery.of(context).size.width / 2 - 30,
              height: MediaQuery.of(context).size.height / 5,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Карманный рандомайзер",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.amberAccent, fontWeight: FontWeight.bold),
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
              color: Colors.brown,
              width: MediaQuery.of(context).size.width / 2 - 30,
              height: MediaQuery.of(context).size.height / 5,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Электронная монетка Да / Нет",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
