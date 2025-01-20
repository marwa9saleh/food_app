import 'package:flutter/material.dart';

class range extends StatefulWidget {
  const range({super.key});

  @override
  State<range> createState() => _rangeState();
}

class _rangeState extends State<range> {
  RangeValues _currentRangeValues = const RangeValues(20, 80);
  @override
  Widget build(BuildContext context) {
   return
   
         Column(
  
          children: [
    
           

            RangeSlider(
              values: _currentRangeValues,
              min: 0,
              max: 100,
              divisions: 10,
              labels: RangeLabels(
                _currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString(),
              ),
              activeColor: _currentRangeValues.end > 70 ? Colors.red : Colors.green,
              inactiveColor: Colors.grey,
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                });
              },
            ),
           const Row(
   
              children: [
                Text('MID', style: TextStyle(fontSize: 16,color: Colors.green)),
          SizedBox(width: 80,),
                Text('HOT', style: TextStyle(fontSize: 16,color: Colors.red)),
              ],
            ),
          ],
      

      );
  }
}