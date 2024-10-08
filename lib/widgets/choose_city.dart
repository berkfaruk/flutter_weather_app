import 'package:flutter/material.dart';

class ChooseCityWidget extends StatefulWidget {
  const ChooseCityWidget({super.key});

  @override
  State<ChooseCityWidget> createState() => _ChooseCityWidgetState();
}

class _ChooseCityWidgetState extends State<ChooseCityWidget> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Choose City'),
        ),
        body: Form(
            child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autofocus: true,
                  controller: _textController,
                  decoration: const InputDecoration(
                    labelText: 'City',
                    hintText: 'Choose City',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context, _textController.text);
                },
                icon: const Icon(Icons.search))
          ],
        )),
      ),
    );
  }
}
