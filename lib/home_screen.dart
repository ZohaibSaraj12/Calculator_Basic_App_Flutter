import 'package:calculator_app/buttons.dart';
import 'package:calculator_app/functionality.dart';
//import 'package:calculator_app/buttons_calc.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Calculator App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 30.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15.0, left: 5.0, right: 6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Text(
                Functionality.userInput,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 50.0,
                  
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Wrap(
              children: Button.allButtons
                  .map(
                    (e) => Padding(
                      //padding working as margin 
                      padding: const EdgeInsets.all(4.0),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          backgroundColor: Button.topRowButtons.contains(e)
                              ? Colors.grey
                              : Button.operatorButtons.contains(e)
                              ? Colors.deepPurple
                              : const Color.fromARGB(255, 233, 150, 73),
                          elevation: 3.0,
                          side: BorderSide.none,
                          fixedSize: e != '0'
                              ? Size(screenWidth * .22, 80)
                              : Size(screenWidth * 0.46, 80),
                        ),
                        onPressed: () {
                          Functionality.appendInput(e, setState);
                        },
                        child: Text(
                          e,
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Button.topRowButtons.contains(e)
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
