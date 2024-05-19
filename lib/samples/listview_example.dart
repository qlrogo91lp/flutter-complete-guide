import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.light(),
      home: const ListViewExample(),
    ),
  );
}

class ListViewExample extends StatefulWidget {
  const ListViewExample({super.key});

  @override
  State<StatefulWidget> createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            height: 200,
            color: const Color(0xffededed),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      '$index.',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                // const SizedBox(height: 50),
                const Center(
                  child: Text('Hello Worold !!'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        elevation: 0,
                        backgroundColor: const Color(0xffbfbfbf),
                      ),
                      onPressed: () {},
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '해설보기',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down_rounded),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BoxContainer extends StatelessWidget {
  const BoxContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber[100],
      child: const Center(child: Text('Test'),),
    );
  }
}