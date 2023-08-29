import 'package:flutter/material.dart';

import 'messages_vu.dart';

void main() async {
  List<MSGModel> dataList = [];
  for (int i = 0; i < 10; i++) {
    if (i % 2 == 0) {
      dataList.add(MSGModel('sdfsdfgsdgfdsfg$i', true));
    } else {
      dataList.add(MSGModel('ghdfghdfghfghdfgh$i', false));
    }
  }

  Widget cellDesign(int index) {
    return Column(
      crossAxisAlignment: dataList[index].isMine
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        dataList[index].isMine
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text(DateTime.now().toString()), Text('You')],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text('Dr Bilal'), Text(DateTime.now().toString())],
              ),
        Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Text(dataList[index].msg),
        ),
      ],
    );
  }

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: Message<MSGModel>(dataList, cellDesign),
    ),
  ));
}
