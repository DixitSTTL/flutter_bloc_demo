import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/feature/home/presentation/pages/detail_page.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/home/HomeBloc.dart';
import '../bloc/home/HomeEvent.dart';
import '../bloc/home/HomeState.dart';
import '../widget/NetworkImage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(CoinListRequested());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error!)));
          }
        },
        builder: (context, state) {
          var list = state.coins;

          return Stack(
            children: [
              ListView.builder(
                itemCount: list.length,
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  final coin = list[index];

                  return Card.outlined(
                    child:  InkWell(
                      borderRadius: BorderRadius.circular(12), // match card radius
                      onTap: () {
                        print("Clicked: ${coin.name}");

                        // Example navigation

                        Navigator.pushNamed(
                          context,
                          '/detail',
                          arguments: coin.uuid ?? "",
                        );
                      },
                      child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            alignment: AlignmentGeometry.center,
                            child: networkImage(coin.iconUrl.toString()),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    coin.name.toString(),
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        coin.parseToDouble().toString(),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        coin.change.toString(),
                                        style: TextStyle(
                                          color: coin.priceChangeColor(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    )

                  );
                },
              ),
              if (state.isLoading)
                const ColoredBox(
                  color: Colors.black26,
                  child: Center(child: CircularProgressIndicator()),
                ),
            ],
          );
        },
      ),
    );
  }
}
