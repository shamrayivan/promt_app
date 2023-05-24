import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promt_app/choose_bloc/choose_bloc.dart';

class ChooseScreen extends StatelessWidget {
  static final List<TextEditingController> controllers = [
    TextEditingController(),
  ];

  ChooseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChooseBloc(),
        ),
      ],
      child: BlocBuilder<ChooseBloc, ChooseState>(
        builder: (context, state) {
          ScrollController scrollController = ScrollController();
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton.extended(
                backgroundColor: Color(0xFFEB0072),
                onPressed: () {
                  List<String> a = [];
                  bool showSnackBar = false;

                  controllers.forEach((element) {
                    if (element.value.text == "") {
                      showSnackBar = true;
                    } else {
                      a.add(element.value.text);
                      print(' a - $a');
                    }
                  });
                  if (showSnackBar) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Есть пустые поля", textAlign: TextAlign.center,)));
                  } else {
                    // if(a.length != 0){
                    BlocProvider.of<ChooseBloc>(context)
                        .add(GenerateAnswerEvent(controllers));
                  }
                  if (state is GenerateAnswerState) {
                    print("hi");
                  }
                  // };
                },
                label: Text(
                  "Выбрать подходящий вариант",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height / 50,
                  ),
                )),
            appBar: AppBar(
              leading:  IconButton(
                icon:  Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
                onPressed: () async{
                  FocusManager.instance.primaryFocus?.unfocus();
                  await Future.delayed(Duration(milliseconds: 200));
                  Navigator.of(context).pop();},
              ),
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
                // SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Впишите все возможные действия или исходы, а мы подскажем какой вариант выбрать",
                      textAlign: TextAlign.center,
                    ),
                  ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: ListView.builder(
                      controller: scrollController,
                      shrinkWrap: true,
                      itemCount: controllers.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: TextField(
                                    maxLines: null,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                    cursorColor: Colors.black,
                                    controller: controllers[index],
                                    decoration: InputDecoration(
                                        labelStyle: const TextStyle(
                                            color: Colors.black),
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
                                    if (controllers.length > 1) {
                                      BlocProvider.of<ChooseBloc>(context).add(
                                          DeleteNewTextFieldEvent(
                                              index, controllers));
                                    } else
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  "Нельзя удалить единственный элемент",textAlign: TextAlign.center,)));
                                  },
                                ),
                              ],
                            ),
                            if (index == controllers.length - 1)
                              Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        100,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // if (state is AddChooseState) {
                                      BlocProvider.of<ChooseBloc>(context).add(
                                          AddNewTextFieldEvent(controllers));
                                      // }
                                      // else {
                                      //   print(state.toString());
                                      // }
                                    },
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.add_box_outlined,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
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
                                  ),
                                ],
                              ),
                          ],
                        );
                      }),
                ),
                const Divider(
                  thickness: 5,
                ),
                if (state is GenerateAnswerState)
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xE6EB0072),
                            // border: Border.all(
                            //     width: 2, color: const Color(0xFAEB0072)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(children: [
                          Text(
                            "Да что тут думать, конечно же!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                MediaQuery.of(context).size.height / 60,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            state.answer,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                MediaQuery.of(context).size.height / 40,
                                fontWeight: FontWeight.bold),
                          )
                        ])),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
