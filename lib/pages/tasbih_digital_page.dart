import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TasbihDigitalPage extends StatefulWidget {
  @override
  _TasbihDigitalPageState createState() => _TasbihDigitalPageState();
}

class _TasbihDigitalPageState extends State<TasbihDigitalPage> {
  int count = 0;
  String tasbihText = 'Subhanallah';

  // Function to increment tasbih count
  void incrementCount() {
    setState(() {
      count++;
      if (count >= 33) {
        if (tasbihText == 'Subhanallah') {
          tasbihText = 'Alhamdulillah';
        } else if (tasbihText == 'Alhamdulillah') {
          tasbihText = 'Allahu Akbar';
        } else {
          tasbihText = 'Subhanallah';
        }
        count = 0;
      }
    });
  }

  // Function to reset tasbih
  void resetTasbih() {
    setState(() {
      count = 0;
      tasbihText = 'Subhanallah';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,  // Full width
        height: double.infinity, // Full height
        decoration: BoxDecoration(
          color: Colors.white, // White background for the entire screen
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container for the background image of the book and tasbih digital
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white, // White background for the entire container
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Image of the book with white background
                      Container(
                        width: 200, // Adjust the width of the image
                        height: 200, // Adjust the height of the image for 1:1 ratio
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          'assets/images/kitab.png', // Replace with your book image
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 20),
                      // Card for displaying the tasbih digital
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            // AnimatedSwitcher for smooth text changes
                            AnimatedSwitcher(
                              duration: Duration(milliseconds: 300),
                              child: Text(
                                tasbihText,
                                key: ValueKey<int>(count),
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[800],
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              count.toString(),
                              style: TextStyle(
                                fontSize: 80,
                                fontWeight: FontWeight.bold,
                                color: Colors.amberAccent,
                              ),
                            ),
                            SizedBox(height: 20),
                            // Row for increment and reset buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: incrementCount,
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                    size: 32,
                                    color: Colors.white,
                                  ), // Use icon from FontAwesomeIcons
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.all(20),
                                    backgroundColor: Colors.green[600],
                                    elevation: 10,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: resetTasbih,
                                  child: Icon(
                                    FontAwesomeIcons.syncAlt,
                                    size: 32,
                                    color: Colors.white,
                                  ), // Use icon from FontAwesomeIcons
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.all(20),
                                    backgroundColor: Colors.redAccent,
                                    elevation: 10,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
