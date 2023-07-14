import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bmi Calculator',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'My BMI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtControler = TextEditingController();
  var inControler = TextEditingController();
  var ftControler = TextEditingController();
  var result = " ";
  var bgColor= Colors.blueGrey.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: bgColor,

        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: wtControler,
                  decoration: InputDecoration(
                    label: Text('Enter your weight( Kgs )'),
                    prefix: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: inControler,
                  decoration: InputDecoration(
                    label: Text("Enter your Height ( in Inch) "),
                    prefix: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: ftControler,
                  decoration: InputDecoration(
                    label: Text("Enter your Height( in Feet )"),
                    prefix: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 18,
                ),
                ElevatedButton(
                  onPressed: () {
                    var wt = wtControler.text.toString();
                    var ft = ftControler.text.toString();
                    var inc = inControler.text.toString();
                    if (wt != " " && ft != " " && inc != "") {
                      var iWt = int.parse(wt);
                      var iFt = int.parse(ft);
                      var iInc = int.parse(inc);

                      var tInch = (iFt * 12) + iInc;
                      var tCm = tInch * 2.54;
                      var tm = tCm / 100;

                      var bmi = iWt / (tm * tm);

                      var msg="";


                      if(bmi>25)
                        {
                         msg = "You are Overweight!!";
                         bgColor= Colors.orangeAccent.shade200;
                        }
                      else if(bmi<18)
                          {
                            msg = "You are UnderWeight!!";
                            bgColor = Colors.amber.shade50;
                          }
                      else{
                            msg = "You are Healthy!!";
                            bgColor= Colors.green.shade200;
                      }
                      setState(() {
                        result = "$msg \n \n Your BMI is : ${bmi.toStringAsFixed(2)}";
                      });

                    } else {
                      setState(() {
                        result = " Please fill all the required attributes!!";
                      });
                    }
                  },
                  child: Text("Calculate"),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  result,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
