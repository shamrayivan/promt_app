import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promt_app/first_run_bloc/first_run_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isFirstRun = true;
    TextEditingController dateController = TextEditingController();
    TextEditingController timeController = TextEditingController();
    DateTime? pickedDate = DateTime.now();
    TimeOfDay? pickedTime = const TimeOfDay(hour: 0, minute: 0);

    return BlocProvider<FirstRunBloc>(
      create: (context) => FirstRunBloc(),
      child: BlocBuilder<FirstRunBloc, FirstRunState>(
        builder: (context, state) {
          final firstRunBloc = BlocProvider.of<FirstRunBloc>(context)
            ..add(SaveFirstRunEvent());
          if (state is GetFirstRunInfoState) {
            isFirstRun = state.isFirstRun;
          }
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: isFirstRun
                ? FloatingActionButton.extended(
                    onPressed: () async {
                      if (dateController.value.text.isNotEmpty) {
                        DateTime birthday = DateTime(
                            pickedDate!.year,
                            pickedDate!.month,
                            pickedDate!.day,
                            pickedTime!.hour,
                            pickedTime!.minute);
                        print(birthday);
                        // obtain shared preferences
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setInt(
                            'birthday', birthday.millisecondsSinceEpoch);
                        await prefs.setBool('isFirstRun', false);
                        firstRunBloc.add(SaveFirstRunEvent());
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                content: Text(
                          "Заполните обязательное поле \"Дата\"",
                          textAlign: TextAlign.center,
                        )));
                      }
                    },
                    label: Text("Сохранить"))
                : null,
            appBar: AppBar(
              actions: [
                IconButton(onPressed: ()async{
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.remove('isFirstRun');
                  await prefs.remove('birtday');

                }, icon: Icon(Icons.settings, color: Colors.black,))
              ],
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: const Text("Умный советчик"),
            ),
            body: isFirstRun
                ? Center(
                    child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          "Введите дату и время своего рождения",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height / 50),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: TextField(
                                controller: dateController,
                                //editing controller of this TextField
                                decoration:  InputDecoration(
                                    icon: Icon(Icons.calendar_month),
                                    //icon of text field
                                    labelStyle: TextStyle(fontSize: MediaQuery.of(context).size.height/75),
                                    labelText: "Дата" //label text of field
                                    ),
                                readOnly: true,
                                // when true user cannot edit text
                                onTap: () async {
                                  pickedDate = await showDatePicker(
                                      initialEntryMode: DatePickerEntryMode.input,
                                      locale: Locale('ru'),
                                      context: context,
                                      initialDate: DateTime.now(),
                                      //get today's date
                                      firstDate:
                                          DateTime(DateTime.now().year - 100),
                                      //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime.now());
                                  if (pickedDate != null) {
                                    print(
                                        pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                                    // String formattedDate = DateT('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                    // print(formattedDate); //formatted date output using intl package =>  2022-07-04
                                    //You can format date as per your need
                                    dateController.text =
                                        "${pickedDate!.day.toString().padLeft(2, '0')} / ${pickedDate!.month.toString().padLeft(2, '0')} / ${pickedDate!.year.toString()}"; //set foratted date to TextField value.
                                  } else {
                                    print("Date is not selected");
                                  }
                                  //when click we have to show the datepicker
                                }),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Column(
                              children: [
                                TextField(
                                    controller: timeController,
                                    //editing controller of this TextField
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.access_time),
                                        //icon of text field
                                        labelStyle: TextStyle(fontSize: MediaQuery.of(context).size.height/75),
                                        labelText:
                                            "Время (опционально)" //label text of field
                                        ),
                                    readOnly: true,
                                    // when true user cannot edit text
                                    onTap: () async {
                                      pickedTime = await showTimePicker(
                                          initialEntryMode:
                                              TimePickerEntryMode.input,
                                          // locale: Locale('ru'),
                                          context: context,
                                          // initialDate: DateTime.now(), //get today's date
                                          // firstDate: DateTime(DateTime.now().year - 100), //DateTime.now() - not to allow to choose before today.
                                          // lastDate: DateTime.now(),
                                          initialTime: TimeOfDay.now());
                                      if (pickedTime != null) {
                                        print(pickedTime!.hour);
                                        print(pickedTime!
                                            .minute); //get the picked date in the format => 2022-07-04 00:00:00.000
                                        // String formattedDate = DateT('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                        // print(formattedDate); //formatted date output using intl package =>  2022-07-04
                                        //You can format date as per your need
                                        timeController.text =
                                            "${pickedTime!.format(context)}"; //set foratted date to TextField value.
                                      } else {
                                        print("Date is not selected");
                                      }
                                      //when click we have to show the datepicker
                                    }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))
                : Stack(children: [
                    if (state is GetFirstRunInfoState)
                      Center(
                          child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 1.5,
                          ),
                          Text(
                              'Ваш День Рождения: ${DateTime.fromMillisecondsSinceEpoch(state.birthday).day.toString().padLeft(2, '0')} / '
                              '${DateTime.fromMillisecondsSinceEpoch(state.birthday).month.toString().padLeft(2, '0')} / ${DateTime.fromMillisecondsSinceEpoch(state.birthday).year.toString()}'),
                        ],
                      )),
                    Wrap(
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
                                borderRadius: BorderRadius.circular(20)),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Карманный рандомайзер",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
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
                                borderRadius: BorderRadius.circular(20)),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Электронная монетка\nДа / Нет",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
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
                                borderRadius: BorderRadius.circular(20)),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Сделай правильный выбор",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
          );
        },
      ),
    );
  }
}
