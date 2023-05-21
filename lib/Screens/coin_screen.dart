import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promt_app/coin_bloc/coin_bloc.dart';

class CoinScreen extends StatelessWidget {
  const CoinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CoinBloc>(
      create: (context) => CoinBloc(),
      child: BlocBuilder<CoinBloc, String>(
        builder: (context, state) {
          return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.brown,
          foregroundColor: Colors.grey,
          onPressed: () {
            BlocProvider.of<CoinBloc>(context).add(GetAnswerEvent());
          },
          
          label: SizedBox(width: MediaQuery.of(context).size.width/2, child: Text("Узнать ответ", textAlign: TextAlign.center,)),
        ),
        appBar: AppBar(
          title: Text(
            "Монетка",
            style: TextStyle(color: Colors.grey),
          ),
          backgroundColor: Colors.brown,
        ),
        body: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "После нажатия на кнопку, в течении 5 секунд думайте о вопросе, ответ на который Вы хотите получить",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 60,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                // OutlinedButton(onPressed: () {
                //   BlocProvider.of<CoinBloc>(context).add(GetAnswerEvent());
                // }, child: Text("Узнайте ответ")),
                SizedBox(height: MediaQuery.of(context).size.height/10,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        state,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ));
          },
        ),

    );
  }
}
