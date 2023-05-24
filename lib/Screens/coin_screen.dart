import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promt_app/coin_bloc/coin_bloc.dart';

class CoinScreen extends StatelessWidget {
  const CoinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CoinBloc>(
      create: (context) => CoinBloc(),
      child: BlocBuilder<CoinBloc, CoinState>(
        builder: (context, state) {
          return Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: FloatingActionButton.extended(
                backgroundColor: const Color(0xFF028E9B),
                foregroundColor: Colors.white,
                onPressed: () {
                  if (state is CoinLoadingState) {
                  } else {
                    BlocProvider.of<CoinBloc>(context).add(GetAnswerEvent());
                  }
                },
                label: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      "Узнать ответ",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 50,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
              ),
              appBar: AppBar(
                title: const Text(
                  "Монетка",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: const Color(0xFF028E9B),
              ),
              body: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        "После нажатия на кнопку, в течении 5 секунд думайте о вопросе, ответ на который Вы хотите получить",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 60,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  if (state is CoinInitial) const SizedBox(),
                  if (state is CoinLoadingState)
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            state.loadingPhrase,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height/25,),
                        const CircularProgressIndicator(color: Color(0xFF028E9B))
                      ],
                    ),
                  if (state is CoinLoadedState)
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: state.color,
                              border: Border.all(
                                  width: 1, color: const Color(0xFF028E9B)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              state.answer,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 40,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "А вообще, советую тщательно обдумывать важные решения перед их принятием 🙃",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 70,
                                ),
                          ),
                        )
                      ],
                    ),
                ],
              ));
        },
      ),
    );
  }
}
