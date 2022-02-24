import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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
      debugShowCheckedModeBanner: false,
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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Kalkulator")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Hasil Perhitungan : $hasil\n",
                textAlign: TextAlign.start,
                style: GoogleFonts.roboto(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Input Pertama',
                  filled: true,
                  fillColor: Color.fromARGB(255, 242, 242, 242),
                ),
                controller: myController1,
              ),
              const Text(''),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Input Kedua',
                  filled: true,
                  fillColor: Color.fromARGB(255, 242, 242, 242),
                ),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                controller: myController2,
              ),
              const Text(''),
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
                      primary: Color.fromARGB(255, 0, 140, 255),
                      minimumSize: const Size(88, 36),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                    ),
                  ),
                  const Text('        '),
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
                      onPrimary: Colors.black87,
                      primary: const Color.fromARGB(255, 0, 140, 255),
                      minimumSize: const Size(88, 36),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                    ),
                  ),
                ],
              ),
              const Text(''),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        int input1 = int.parse(myController1.text);
                        int input2 = int.parse(myController2.text);
                        hasil = (input1+input2) as double;
                      });
                    },
                    child: const Text('+'),
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.black87,
                      primary: const Color.fromARGB(255, 0, 140, 255),
                      minimumSize: const Size(88, 36),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                    ),
                  ),
                  const Text('        '),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        int input1 = int.parse(myController1.text);
                        int input2 = int.parse(myController2.text);
                        hasil = (input1-input2) as double;
                      });
                    },
                    child: const Text('-'),
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.black87,
                      primary: const Color.fromARGB(255, 0, 140, 255),
                      minimumSize: const Size(88, 36),
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}