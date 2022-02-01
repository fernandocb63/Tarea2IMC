

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController alturac = TextEditingController();

  TextEditingController pesoc = TextEditingController();

  double newaltura = 0.0;

  double newpeso = 0.0;

  double imc = 0.0;

  bool mujer = false;

  bool hombre = false;

  final String imcM = ''' 
            Tabla del IMC de mujeres:
                Edad      IMC ideal 
                16-17     19-24 
                18-18     19-24   
                19-24     19-24 
                25-34     20-25 
                35-44     21-26 
                45-54     22-27 
                55-64     23-28 
                65-90     25-30
              ''';
  final String imcH = ''' 
          Tabla del IMC para hombres
                Edad      IMC ideal 
                16-16       19-24   
                17-17       20-25   
                18-18       20-25   
                19-24     21-26 
                25-34     22-27 
                35-54     23-38 
                55-64     24-29 
                65-90     25-30
                  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('IMC CALCULATOR'),
       actions: <Widget>[
         IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.white,
      ),
          onPressed: () {
            pesoc.clear();
            alturac.clear();
          },
    )
       ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
              Text("Ingrese sus datos para calcular el IMC",
              style: TextStyle(fontSize: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: (){
                    mujer = !mujer;
                    if (hombre) {
                      hombre = !hombre;
                    }
                    setState(() {});
                    }, 
                    icon: Icon(Icons.male,
                    color: mujer ? Colors.blue : Colors.grey)),
                  IconButton(
                    onPressed: (){
                    hombre = !hombre;
                    if (mujer) {
                      mujer = !mujer;
                    }
                    setState(() {});
                    }, 
                    icon: Icon(Icons.female),
                    color: hombre ? Colors.pink : Colors.grey)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                controller: alturac,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: Icon(Icons.square_foot,
                  color: Colors.green),
                  border: OutlineInputBorder(),
                  labelText: 'Altura (M)',
                  hintText: 'Ingrese tu altura',
                  focusedBorder:OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2.0)
                ),),
            ),
              ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: pesoc,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: Icon(Icons.monitor_weight_rounded,
                  color: Colors.green),
                  border: OutlineInputBorder(),
                  labelText: 'Peso (Kg)',
                  hintText: 'Ingresa tu peso',
                  focusedBorder:OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2.0)
                ),
                  prefixIconColor: Colors.green),
              ),
            ),
            ElevatedButton(onPressed: () {
              newaltura = double.parse(alturac.text);
              newpeso = double.parse(pesoc.text);
              imc = (newpeso / newaltura) / newaltura;
              showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
              title: Text('El IMC es: ${imc.toStringAsFixed(2)}'),
              content: Text('${mujer ? imcH : imcM}'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
            ),
          ],
        )
        
            );
            }, child: 
            Text("Calcular",),
            style: ElevatedButton.styleFrom(
              primary: Colors.green) // background // foreground)
            ),
          ]
        ),
      )
    );
  }
}