
import 'package:flutter/material.dart';


class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Counter Screen'))
      ),
      body: Center(
        
        child:(
          Column(
          mainAxisAlignment:MainAxisAlignment.center,
            children: [
            Text('$counter', style: const TextStyle(fontSize: 160,fontWeight: FontWeight.w100)),
            Text(counter==1 ? 'click' : 'Clicks', style: const TextStyle(fontSize: 30),)
          ],)
        ),

      ),
      floatingActionButton: 
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        CustomButton(icon: Icons.plus_one, onPress: (){
          setState(() {
            counter++;
          });
          
        }),
        const SizedBox(height: 10),
        CustomButton(icon: Icons.exposure_minus_1_outlined, onPress:(){
          setState(() {
            if(counter==0) return;
            counter--;
          });
        }),
        const SizedBox(height: 10),
        CustomButton(icon: Icons.refresh_rounded, onPress: (){
          setState(() {
            counter=0;
          });
        })

      ]),
    );
    
    
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPress;

  const CustomButton({
    super.key,
    required this.icon,
    required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: onPress,
    child: Icon(icon));
  }
}