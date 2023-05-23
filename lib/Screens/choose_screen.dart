import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promt_app/choose_bloc/choose_bloc.dart';

class ChooseScreen extends StatelessWidget {
  ChooseScreen({Key? key}) : super(key: key);

  // final List<TextEditingController> controllers = [TextEditingController(),];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChooseBloc(),
        ),
      ],
      child: BlocBuilder<ChooseBloc, List<TextEditingController>>(
        builder: (context, state) {
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton.extended(
                backgroundColor: Color(0xFFEB0072),
                onPressed: () {
                  List<String> a = [];
                  bool showSnackBar = false;
                  state.forEach((element) {
                    if(element.value.text == "" ){
                      showSnackBar = true;
                    }else {
                      a.add(element.value.text);
                      print(' a - $a');
                    }});
                  if (showSnackBar) {ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Есть пустые поля")));}
                  else if(a.length != 0) {BlocProvider.of<ChooseBloc>(context)
                      .add(GenerateAnswerEvent(a));
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text(state.length.toString()),
                    );
                  });
                };},
                label: Text(
                  "Выбрать подходящий вариант",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height / 50,
                  ),
                )),
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: Colors.white, //change your color here
              ),
              title: const Text(
                "Выбор",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: const Color(0xFFEB0072),
            ),
            body: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Впишите все возможные действия или исходы, а мы подскажем какой вариант выбрать",
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: TextField(
                                maxLines: null,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                cursorColor: Colors.black,
                                controller: state[index],
                                decoration: InputDecoration(
                                    labelStyle:
                                        const TextStyle(color: Colors.black),
                                    floatingLabelAlignment:
                                        FloatingLabelAlignment.center,
                                    labelText: "Вариант ${index + 1}"),
                              ),
                            ),
                            GestureDetector(
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.remove_circle_outline,
                                    color: Color(0xFFEB0072),
                                  ),
                                  Text(
                                    "удалить",
                                    style: TextStyle(
                                      color: Color(0xFFEB0072),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                BlocProvider.of<ChooseBloc>(context)
                                    .add(DeleteNewTextFieldEvent(index));
                              },
                            )
                          ],
                        );
                      }),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                GestureDetector(
                  onTap: () {
                    // if (state is AddChooseState) {
                    BlocProvider.of<ChooseBloc>(context)
                        .add(AddNewTextFieldEvent());
                    // }
                    // else {
                    //   print(state.toString());
                    // }
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.add_box_outlined,
                        size: MediaQuery.of(context).size.height / 20,
                        color: const Color(0xFFEB0072),
                      ),
                      const Text(
                        "добавить вариант",
                        style: TextStyle(
                          color: Color(0xFFEB0072),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
