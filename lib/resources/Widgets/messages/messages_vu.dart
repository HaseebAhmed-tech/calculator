import 'package:flutter/material.dart';

import '../input_fields/chi_text_field.dart';

class Message<T> extends StatelessWidget {
  const Message(this.dataList, this.cellDesign, {Key? key}) : super(key: key);
  final List<T> dataList;
  final Function(int) cellDesign;
  // List<String> msgList = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    return cellDesign(index);
                  })),
          Container(
            color: Colors.grey.shade300,
            child: const CHITextField(
              hintText: 'Type your message here...',
            ),
          )
        ],
      ),
    );
  }
}

class MSGModel {
  String msg;
  bool isMine;

  MSGModel(this.msg, this.isMine);
}
