import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StreamScreen extends StatefulWidget {
  static const String routename = '/streamscreen';

  const StreamScreen({super.key});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  // final StreamController streamController = StreamController();

  // _addData() async {
  //   for (int i = 0; i <= 10; i++) {
  //     await Future.delayed(Duration(seconds: 1));
  //     streamController.sink.add(i);
  //   }
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _addData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder(
                stream: streamData(20),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("There is some error");
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else {
                    return Text(
                      "${snapshot.data}",
                      style: TextStyle(fontSize: 50),
                    );
                  }
                },
              ),
              FutureBuilder<int>(
                future: sumStream(streamData(10)),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('Sum: ${snapshot.data}');
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  return CircularProgressIndicator();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Stream<int> streamData(int n) async* {
    for (int i = 0; i < n; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  Future<int> sumStream(Stream<int> stream) async {
    int sum = 0;
    await for (int value in stream) {
      sum += value;
    }
    return sum;
  }
}
