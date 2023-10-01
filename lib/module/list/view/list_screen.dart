import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../repositories/coins/coins.dart';
import '../bloc/list_bloc.dart';
import '../widgets/widgets.dart';
import 'package:my_app/theme/theme.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<CoinModel>? coinsList;
  final theme = darkTheme;
  final listBloc = ListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    listBloc.add(LoadList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyMoneyList'),
        centerTitle: true,
      ),
      body: BlocBuilder<ListBloc, ListState> (
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
                    style: theme.textTheme.headlineMedium,
                  ),
                  Text(
                    'Please try again later',
                    style: theme.textTheme.labelSmall?.copyWith(fontSize: 16),
                  )
                ],
              )
            );
          }
          return const Center(child: CircularProgressIndicator());
        }
      ),


      //(coinsList == null)
      //    ? const Center(child: CircularProgressIndicator()):
      //ListView.separated(
      //  padding: const EdgeInsets.only(top: 16),
        //itemCount: coinsList!.length,
        //separatorBuilder: (context, index) => const Divider(),
        //itemBuilder: (context, i) {
          //final coin = coinsList![i];
         // return CoinTile(coin : coin);
        //},
      //),
    );
  }
}


