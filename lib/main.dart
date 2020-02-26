import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> _operation = ['+','-','*','/'];
  String currentSelectedValue, add, sub, multi, div;
  String img = "assets/images/fraction.png";
  final TextEditingController _acontroller = TextEditingController();
  final TextEditingController _bcontroller = TextEditingController();
  final TextEditingController _ccontroller = TextEditingController();
  final TextEditingController _dcontroller = TextEditingController();
  double a = 0.0, b = 0.0, c = 0.0, d = 0.0, result1 = 0.0, result2 = 0.0;

  @override
  Widget build(BuildContext context) { 
        return MaterialApp(
           title: 'Fraction Calculator',
           home: Scaffold(
                       resizeToAvoidBottomInset: false,
             appBar: AppBar(
              title: Text('Fraction Calculator'),
             ),
             body: Column(
               //mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Text('\n'),
                 Image.asset(img, height: 100.0, fit: BoxFit.cover),
                 Align(
                   alignment: Alignment.center,
                   child: Text('Fraction Calculator',
                   style: (
                     TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                   ),
                   ),
                 ),
                 Text('\n'),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Expanded(child: Padding(
                       padding: EdgeInsets.symmetric(horizontal: 30.0),
                       child: TextField(
                         decoration: InputDecoration(
                           hintText: "N1",
                           border: OutlineInputBorder(),
                         ),
                       keyboardType: TextInputType.numberWithOptions(),
                       textAlign: TextAlign.center,
                       controller: _acontroller,
                    ),
                     ),
                    ),
                    DropdownButton<String>(
                      hint: Text('Operations',textAlign: TextAlign.center,),
                      value: currentSelectedValue,
                      onChanged: (newValue){
                        setState(() {
                          currentSelectedValue = newValue;
                        });
                      },
                      items:_operation.map((String value){
                      return DropdownMenuItem<String>(
                        child: Text(value, textAlign: TextAlign.center,),
                        value: value,
                       );
                      },).toList(),
                    ),
                  Expanded(child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "N2",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      textAlign: TextAlign.center,
                      controller: _bcontroller,
                    ),
                    ),
                  ),
                 ]
                ),
             Row(
               //mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Padding(padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                 child: Text("___________",
                 style: TextStyle(fontWeight: FontWeight.bold),
                 ),
                 ),
                 Padding(padding: EdgeInsets.fromLTRB(130, 0, 30, 0),
                 child: Text("___________",
                 style: TextStyle(fontWeight: FontWeight.bold),
                 ),
                 ),
               ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Expanded(child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                   child: TextField(
                     decoration: InputDecoration(
                       hintText: "D1",
                       border: OutlineInputBorder(),
                     ),
                     keyboardType: TextInputType.numberWithOptions(),
                     textAlign: TextAlign.center,
                     controller: _ccontroller,
                    ),
                 ),
                 
                    ),
                 Padding(padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                 child: RaisedButton(
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(20.0)
                   ),
                   color: Colors.blueAccent,
                   textColor: Colors.white,
                   child: 
                   Align(
                     alignment: Alignment.center,
                       child:  Text('Calculate'),
                     ), onPressed: _onPress, 
                   ),
                 ),
                  Expanded(child: Padding(
                       padding: EdgeInsets.symmetric(horizontal: 30.0),
                       child: TextField(
                         decoration: InputDecoration(
                           hintText:"D2",
                           border: OutlineInputBorder(),
                         ),
                       keyboardType: TextInputType.numberWithOptions(),
                       textAlign: TextAlign.center,
                       controller: _dcontroller,
                    ),
                     ),
                    ),
                 ],
             ),
                 Text('\n'),
                 Padding(
                   padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                 child:
                 Text("$result1",
                 style: TextStyle(fontSize: 20.0),),
                 ),
                 Text('_______',
                 style: TextStyle(fontWeight: FontWeight.bold),),
                 Padding(padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                 child:
                 Text("$result2",
                 style: TextStyle(fontSize: 20.0),),
                 ),
                 Text('\n'),
                 Padding(
                   padding: EdgeInsets.fromLTRB(130, 0, 130, 0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(20.0)
                   ),
                   color: Colors.blueGrey,
                   textColor: Colors.white,
                   child: 
                   Align(
                     alignment: Alignment.center,
                       child: Text('Reset'),
                     ), onPressed: reset, 
                   ),
                 ), 
             ]
            ),
          ),
        );
  }                                           
   void _onPress() {
     setState(() {
       a = double.parse(_acontroller.text);
       b = double.parse(_bcontroller.text);
       c = double.parse(_ccontroller.text);
       d = double.parse(_dcontroller.text);
                                          
       add = '+';
       sub = '-';
       multi = '*';
       div = '/';

       if (add == currentSelectedValue) {
        result2=gcd(a, b);
        result1= a*d + b*c ;
        result2 = c * d ; 
       } else if (sub == currentSelectedValue) {
        result2=gcd(a, b);
        result1= a*d - b*c ;
        result2 = c * d ;                        
      } else if ( multi == currentSelectedValue) {
        result2=gcd(a, b);
        result1= a * b ;
        result2 = c * d ;   
      } else if (div == currentSelectedValue){
        result2=gcd(a, b);
        result1= a * d  ;
        result2 = b * c ;   
      }
      simplify();
    });
   }
                                                                                        
  void reset() {
    setState(() {
       _onPress();
       _acontroller.clear();
       _bcontroller.clear();
       _ccontroller.clear();
       _dcontroller.clear();
       result1 = 0.0;
       result2 = 0.0;
     });
  }
                                                                   
  void simplify() {
    double commonfactor = gcd(result1,result2);
    result1=result1 / commonfactor;
    result2=result2 / commonfactor;                                                                                                                                }
  }                   

  double gcd(double a, double b) {
    if (a==0) {
      return b;                    
     }
    else{
       return gcd(b%a,a);
    }
}