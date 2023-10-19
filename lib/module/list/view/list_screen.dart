import 'dart:async';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../../../repositories/coins/coins.dart';
import '../bloc/list_bloc.dart';
import '../widgets/widgets.dart';

@RoutePage()

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<CoinModel>? coinsList;
  final listBloc = ListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    listBloc.add(LoadList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyMoneyList'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => TalkerScreen(
                  talker: GetIt.I<Talker>()
              )
              ),
            );
          }, icon: const Icon(
            Icons.document_scanner_outlined,
          )
          )
        ],
      ),
      body: RefreshIndicator (
        onRefresh: () async {
          final completer = Completer();
          listBloc.add(LoadList(completer: completer));
          return completer.future;
        },
      child : BlocBuilder<ListBloc, ListState> (
        bloc: listBloc,
        builder: (context, state) {
          if(state is ListLoaded) {
            return ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              itemCount: state.coinsList.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, i) {
              final coin = state.coinsList[i];
              return CoinTile(coin : coin);
              },
            );
          }
          if (state is ListLoadingFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Something went wrong',
                    style: theme.textTheme.headlineMedium?.copyWith(color: Colors.white),
                  ),
                  Text(
                    'Please try again later',
                    style: theme.textTheme.labelSmall?.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                      onPressed: () {
                        listBloc.add(LoadList());
                      },
                      child: const Text('Try again')
                  ),
                ],
              )
            );
          }
          return const Center(child: CircularProgressIndicator());
        }
      ),
      )
    );
  }
}


