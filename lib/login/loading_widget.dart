import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey.withOpacity(0.95),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Image.asset('assets/applover@2x.png'),
                  SizedBox(height: 40),
                  const LinearProgressIndicator(
                    minHeight: 20,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(Colors.green),),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}