import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promt_app/random_bloc/random_bloc.dart';

class RandomScreen extends StatelessWidget {
  const RandomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerFirst = TextEditingController();
    TextEditingController controllerSecond = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.amberAccent, //change your color here
        ),
        title: const Text(
          "Рандом",
          style: TextStyle(color: Colors.amberAccent),
        ),
        backgroundColor: Colors.black,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<RandomBloc>(
            create: (context) => RandomBloc(),
          ),
        ],
        child: BlocBuilder<RandomBloc, String>(
          builder: (context, state) {
            var randomBloc = BlocProvider.of<RandomBloc>(context);
            return Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height/20,),
                  Text(
                    "Введите диапазон:",
                    style: TextStyle(
                        fontSize: MediaQuery
                            .of(context)
                            .size
                            .height / 50),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 3,
                        child: TextField(
                          inputFormatters: <TextInputFormatter>[
                            // for below version 2 use this
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')),

// for version 2 and greater youcan also use this
//                             FilteringTextInputFormatter.digitsOnly,

                          ],
                          controller: controllerFirst,
                          decoration:
                          const InputDecoration(labelText: "первое число"),
                          keyboardType: TextInputType.number,

                        ),
                      ),
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 3,
                        child: TextField(
                          inputFormatters: <TextInputFormatter>[
                            // for below version 2 use this
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')),
// for version 2 and greater youcan also use this
//                             FilteringTextInputFormatter.digitsOnly

                          ],
                          controller: controllerSecond,
                          decoration:
                          const InputDecoration(labelText: "второе число"),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      // TextField(),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        if(int.parse(
                            controllerFirst.value.text)< int.parse(
                            controllerSecond.value.text)) {
                          BlocProvider.of<RandomBloc>(context).add(RandomIntEvent(int.parse(
                              controllerFirst.value.text), int.parse(
                              controllerSecond.value.text)));
                        }else ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Так нельзя! Первое число должно быть меньше")));
                      },
                      child: const Text("Сгенерировать")),
                  Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      const Text("Число:"),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        state,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery
                                .of(context)
                                .size
                                .height / 25),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
