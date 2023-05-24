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
    return BlocProvider<RandomBloc>(
      create: (context) => RandomBloc(),
      child: BlocBuilder<RandomBloc, String>(
        builder: (context, state) {
          var randomBloc = BlocProvider.of<RandomBloc>(context);
          return Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton.extended(onPressed: () {
              print('${controllerFirst.text.isEmpty}');
              if (controllerFirst.value.text.isEmpty || controllerSecond.value.text.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                        "Заполните все поля!", textAlign: TextAlign.center,)));
              }
              else if (controllerFirst.value.text.contains("-", 1) ||
                  controllerSecond.value.text.contains("-", 1)) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "Минус должен быть только перед числом",textAlign: TextAlign.center,)));
              }
              else if (int.parse(controllerFirst.value.text) <
                  int.parse(controllerSecond.value.text)) {
                randomBloc.add(RandomIntEvent(
                    int.parse(controllerFirst.value.text),
                    int.parse(controllerSecond.value.text)));
              }
              else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                        "Первое число должно быть меньше",textAlign: TextAlign.center,)));
              }
            }
            , label: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  "Сгенерировать",
                  style: TextStyle(fontSize: MediaQuery.of(context).size.height/50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
            backgroundColor: Colors.black,),
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: Colors.white, //change your color here
              ),
              title: const Text(
                "Рандом",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black,
            ),
            body: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        Text(
                          "Введите диапазон:",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height / 50),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                              child: TextField(
                                cursorColor: Colors.black,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9-]')),
                                ],
                                controller: controllerFirst,
                                decoration: const InputDecoration(
                                    labelStyle: TextStyle(color: Colors.black),
                                    labelText: "первое число"),
                                keyboardType: const TextInputType.numberWithOptions(signed:true),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                              child: TextField(
                                cursorColor: Colors.black,
                                inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9-]'))
                                ],
                                controller: controllerSecond,
                                decoration: const InputDecoration(
                                  labelStyle: TextStyle(color: Colors.black),
                                    labelText: "второе число",),
                                keyboardType:  const TextInputType.numberWithOptions(signed: true),
                              ),
                            ),
                            // TextField(),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                                  fontSize:
                                      MediaQuery.of(context).size.height / 25),
                            ),
                          ],
                        ),
                      ],
              ),
            ),
          );
        },
      ),
    );
  }
}
