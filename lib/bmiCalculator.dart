import 'package:flutter/material.dart';

class bmi_calc extends StatefulWidget {
  const bmi_calc({super.key});

  @override
  State<bmi_calc> createState() => _bmi_calcState();
}

class _bmi_calcState extends State<bmi_calc> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();


  var result = "";
  var bgColor = Colors.indigo.shade300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI calculator'),

        backgroundColor: bgColor,
      ),

      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            color: Colors.amberAccent,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 11,),
                Text('BMI', style:
                  TextStyle(
                    fontSize: 34, fontWeight: FontWeight.w700,
                  ),),
                Divider(height: 10,
                  color: Colors.black,),
                SizedBox(height: 5,),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your weight in KG'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,

                ),
                SizedBox(height: 11,),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter your Height in ft.'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,

                ),
                SizedBox(height: 11,),
                TextField(
                  controller: inchController,
                  decoration: InputDecoration(
                    label: Text('Enter your Height in inch.'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),


                SizedBox(height: 15,),
                ElevatedButton(onPressed: (){

                   var wt = wtController.text.toString();
                   var ft = ftController.text.toString();
                   var inch = inchController.text.toString();


                   if(wt!="" && ft!="" && inch!=""){
                     //BMI Calculation

                     var iWt = int.parse(wt);
                     var iFt = int.parse(ft);
                     var iIch = int.parse(inch);

                     var tInch = (iFt*12) + iIch;
                     var tCm = tInch*2.54;
                     var  tM = tCm / 100;


                     var bmi = iWt/(tM*tM);


                     var msg = "";
                     if(bmi>25){
                       msg = 'You are over wight!';
                       bgColor = Colors.redAccent;
                     } else if(bmi<18){
                       msg = 'You are under wight!';
                       bgColor = Colors.orangeAccent;
                     } else{
                       msg = 'You are healthy!';
                       bgColor = Colors.green;

                     }

                     setState(() {
                       result = "$msg\nYour BMI is: ${bmi.toStringAsFixed(2)} kg/m²";
                     });

                   } else{
                     setState(() {
                       result = "Please fill all the required blanks!";
                       bgColor = Colors.blueAccent;
                     });
                   }

                },style: ElevatedButton.styleFrom(
                  backgroundColor: bgColor,
                ), child: Text('Calculate', style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),)),
                SizedBox(height: 10,),

                Text(result, style: TextStyle(
                  fontSize: 18,
                ),
                ),
                Divider(height: 10,
                color: Colors.black,),
                Text('🟩 Healthy:'
                  ' 18.5 – 24.9 kg/m²'

                  '\n🟨 Overweight:'
                  ' 25 – 29.9 kg/m²'

                  '\n🟥 Underweight:'
                  ' < 18.5 kg/m²'),
                Divider(height: 10,
                  color: Colors.black,),
              ],
            ),
          ),
        ),
      )
    );
  }
}
