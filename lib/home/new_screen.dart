import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/text-bloc/text_bloc.dart';
import 'package:news_app/home/ui/myThemeData.dart';

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Screen'),
      ),
      body: BlocBuilder<TextBloc, TextState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "The New Text is",
                  style: TextStyle(fontSize: 24),
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: MyThemeData.lightPrimary),
                  width: 200,
                  height: 50,
                  child: Center(
                    child: Text(
                      '${state.newText}',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
