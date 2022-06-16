import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({Key? key}) : super(key: key);

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  // List countries = <String>[ "AED", "AFN", "AUD", "AMD", "BDT", "CAD", "CHF", "CNY", "EGP", "EUR", "GBP", "GBP", "INR", "JOD", "KRW", "PKR", "SAR", "USD"];
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 30, bottom: 16),
      child: Column(
        children: [
          const Center(
              child: Text(
            'Exchange Rate',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          )),
          const SizedBox(
            height: 30,
          ),
          const Center(
              child: Text(
            '\$ 25.76',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
          )),
          const SizedBox(
            height: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Amount',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                maxLines: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 2.0),
                  ),
                  border: OutlineInputBorder(),
                  hintText: '1',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'From',
                      style: TextStyle(color: Colors.grey),
                    ),
                    // Dropdown Start
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      elevation: 16,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['One', 'Two', 'Free', 'Four']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    // Dropdown Ends
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: IconButton(onPressed: () {}, icon: const Icon(Icons.swap_horiz_rounded)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'To',
                      style: TextStyle(color: Colors.grey),
                    ),
                    // Dropdown Start
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      elevation: 16,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['One', 'Two', 'Free', 'Four']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    // Dropdown Ends
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 50,),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.greenAccent[700],
                elevation: 0,
                splashFactory: NoSplash.splashFactory,
              ),
              onPressed: () {}, 
              child: const Text('CONVERT', style: TextStyle(fontSize: 20),)
            ),
          )
        ],
      ),
    );
  }
}
