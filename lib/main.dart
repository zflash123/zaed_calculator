import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Retrieve Text Input',
      home: FormKalkulasi(),
    );
  }
}

class FormKalkulasi extends StatefulWidget {
  const FormKalkulasi({Key key}) : super(key: key);

  @override
  _FormKalkulasi createState() => _FormKalkulasi();
}

class _FormKalkulasi extends State<FormKalkulasi> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  double hasil = 0;
  @override
  void dispose(){
    myController1.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Kalkulator")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Hasil Perhitungan : $hasil\n"),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Input Pertama',
              ),
              controller: myController1,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Input Kedua',
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              controller: myController2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      int input1 = int.parse(myController1.text);
                      int input2 = int.parse(myController2.text);
                      hasil = (input1*input2) as double;
                    });
                  },
                  child: const Text('X'),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.black87,
                    primary: Colors.blue[300],
                    minimumSize: const Size(88, 36),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      int input1 = int.parse(myController1.text);
                      int input2 = int.parse(myController2.text);
                      hasil = input1/input2;
                    });
                  },
                  child: const Text('/'),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Color.fromARGB(221, 0, 0, 0),
                    primary: Colors.blue[300],
                    minimumSize: const Size(88, 36),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // setState(() {
                    //   int input1 = int.parse(myController1.text);
                    //   int input2 = int.parse(myController2.text);
                    //   hasil = (input1+input2) as double;
                    // });
                  },
                  child: const Text('+'),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.black87,
                    primary: Colors.blue[300],
                    minimumSize: const Size(88, 36),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // setState(() {
                    //   int input1 = int.parse(myController1.text);
                    //   int input2 = int.parse(myController2.text);
                    //   hasil = (input1-input2) as double;
                    // });
                  },
                  child: const Text('-'),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.black87,
                    primary: Colors.blue[300],
                    minimumSize: const Size(88, 36),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}