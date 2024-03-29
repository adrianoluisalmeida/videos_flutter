import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "Contador de cafeína",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  int _coffees = 0;
  int _caffeine = 0;
  String _alert = "";

  void changeCoffee(int delta){
    setState(() {
      //this._coffees = 0;

        this._coffees += delta;
        this._caffeine = _coffees * 80;
        this._alert = "";
        
        if(_caffeine > 400)
          this._alert = "Cuidado! Você pode morrer!";
        else if(_caffeine < 0)
          this._alert = "Uéé";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.local_cafe,
                color: Colors.brown,
                size: 90,
              ),
              Text("Cafeína ingerida", style:TextStyle(decoration: TextDecoration.none, color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 25.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding:EdgeInsets.all(10),
                    child: FlatButton(
                      onPressed: (){
                        changeCoffee(1);
                      },
                      child: Text("+", style:TextStyle(fontSize: 40, color: Colors.brown)),
                    ),
                  ),
                  
                  Text("$_coffees", style:TextStyle(decoration:TextDecoration.none, color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 30)),
                  Padding(
                    padding:EdgeInsets.all(10),
                    child: FlatButton(
                      onPressed: (){
                        changeCoffee(-1);
                      },
                      child: Text("-", style:TextStyle(fontSize: 40, color: Colors.brown)),
                    ),
                  ),
                  
                ],
              ),
              this._alert.isEmpty ? Text("$_caffeine mg", style:TextStyle(decoration:TextDecoration.none, color: Colors.grey, fontStyle: FontStyle.italic, fontSize: 12)) :Text(this._alert, style:TextStyle(decoration:TextDecoration.none, color: Colors.red, fontStyle: FontStyle.italic, fontSize: 12)),
            ],
          ),
    );
  }
}