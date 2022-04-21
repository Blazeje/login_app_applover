import 'package:applover_app/success_bloc/success_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login/loading_widget.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key, required this.userEmail}) : super(key: key);

  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1d1c1c),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocConsumer<SuccessBloc, SuccessState>(
          listener: (context, state) {
            if (state is SuccessNav) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            if (state is SuccessLoading) {
              return LoadingWidget(
                child: initialLayout(context),
              );
            } else {
              return initialLayout(context);
            }
          },
        ),
      ),
    );
  }

  Widget initialLayout(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/applover@2x.png'),
            SizedBox(height: 10),
            const Text(
              "Success",
              style: TextStyle(color: Colors.grey, fontSize: 40.00),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<SuccessBloc>(context).add(NavBack());
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 110, vertical: 20),
              ),
              child: const Text("Go Back"),
            )
          ],
        ),
      );
}
