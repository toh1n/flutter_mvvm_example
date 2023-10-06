import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/data/status.dart';
import 'package:flutter_mvvm_example/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_example/view_model/home_view_model.dart';
import 'package:flutter_mvvm_example/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {
    homeViewViewModel.fetchMoviesListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              homeViewViewModel.fetchMoviesListApi();
            },
            icon: const Icon(Icons.refresh),
          ),
          const SizedBox(
            width: 20,
          ),
          InkWell(
              onTap: () {
                userPreferences.remove().then(
                  (value) {
                    Navigator.pushNamed(context, RoutesName.login);
                  },
                );
              },
              child: const Center(child: Text('Logout'))),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(
          builder: (context, value, _) {
            switch (value.colorList.status!) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Center(child: Text(value.colorList.message.toString()));
              case Status.COMPLETED:
                return ListView.builder(
                  itemCount: value.colorList.data!.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                            value.colorList.data!.data![index].name.toString()),
                      ),
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
