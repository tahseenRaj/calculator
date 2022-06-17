import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({Key? key}) : super(key: key);

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final myController = TextEditingController();
  @override
  void initState() {
    super.initState();
    
    myController.text = '1';
  }

  var currency = [
    "AED",
    "AFN",
    "ALL",
    "AMD",
    "ANG",
    "AOA",
    "ARS",
    "AUD",
    "AWG",
    "AZN",
    "BAM",
    "BBD",
    "BDT",
    "BGN",
    "BHD",
    "BIF",
    "BMD",
    "BND",
    "BOB",
    "BRL",
    "BSD",
    "BTC",
    "BTN",
    "BWP",
    "BYN",
    "BYR",
    "BZD",
    "CAD",
    "CDF",
    "CHF",
    "CLF",
    "CLP",
    "CNY",
    "COP",
    "CRC",
    "CUC",
    "CUP",
    "CVE",
    "CZK",
    "DJF",
    "DKK",
    "DOP",
    "DZD",
    "EGP",
    "ERN",
    "ETB",
    "EUR",
    "FJD",
    "FKP",
    "GBP",
    "GEL",
    "GGP",
    "GHS",
    "GIP",
    "GMD",
    "GNF",
    "GTQ",
    "GYD",
    "HKD",
    "HNL",
    "HRK",
    "HTG",
    "HUF",
    "IDR",
    "ILS",
    "IMP",
    "INR",
    "IQD",
    "IRR",
    "ISK",
    "JEP",
    "JMD",
    "JOD",
    "JPY",
    "KES",
    "KGS",
    "KHR",
    "KMF",
    "KPW",
    "KRW",
    "KWD",
    "KYD",
    "KZT",
    "LAK",
    "LBP",
    "LKR",
    "LRD",
    "LSL",
    "LTL",
    "LVL",
    "LYD",
    "MAD",
    "MDL",
    "MGA",
    "MKD",
    "MMK",
    "MNT",
    "MOP",
    "MRO",
    "MUR",
    "MVR",
    "MWK",
    "MXN",
    "MYR",
    "MZN",
    "NAD",
    "NGN",
    "NIO",
    "NOK",
    "NPR",
    "NZD",
    "OMR",
    "PAB",
    "PEN",
    "PGK",
    "PHP",
    "PKR",
    "PLN",
    "PYG",
    "QAR",
    "RON",
    "RSD",
    "RUB",
    "RWF",
    "SAR",
    "SBD",
    "SCR",
    "SDG",
    "SEK",
    "SGD",
    "SHP",
    "SLL",
    "SOS",
    "SRD",
    "STD",
    "SVC",
    "SYP",
    "SZL",
    "THB",
    "TJS",
    "TMT",
    "TND",
    "TOP",
    "TRY",
    "TTD",
    "TWD",
    "TZS",
    "UAH",
    "UGX",
    "USD",
    "UYU",
    "UZS",
    "VEF",
    "VND",
    "VUV",
    "WST",
    "XAF",
    "XAG",
    "XAU",
    "XCD",
    "XDR",
    "XOF",
    "XPF",
    "YER",
    "ZAR",
    "ZMK",
    "ZMW",
    "ZWL"
  ];
  String fromValue = 'USD';
  String toValue = 'PKR';

  getrates() async {
    http.Response response = await http.get(
        Uri.https('api.apilayer.com',
            'exchangerates_data/convert?to=$toValue&from=$fromValue&amount=${myController.text}&'),
        headers: {"apikey": "ctaZt6osvepea38TDvqA5mHEFZ2IIvEH"});
    var jsonData = jsonDecode(response.body);
    print(jsonData['result']);
    return jsonData['result'];
  }

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
          Center(
            child: FutureBuilder(
                future: getrates(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String stringing = snapshot.data.toString();
                    double doubling = double.parse(stringing);

                    return Text(doubling.toStringAsFixed(3),
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w700));
                  } else if (snapshot.hasError) {
                    return Text('Delivery error: ${snapshot.error.toString()}');
                  } else {
                    return const CircularProgressIndicator(
                      color: Colors.redAccent,
                    );
                  }
                }),
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Amount',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: myController,
                maxLines: 1,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
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
                      value: fromValue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      elevation: 16,
                      onChanged: (String? newValue) {
                        setState(() {
                          fromValue = newValue!;
                        });
                      },
                      items: currency.map((String currency) {
                        return DropdownMenuItem(
                          value: currency,
                          child: Text(currency),
                        );
                      }).toList(),
                    ),
                    // Dropdown Ends
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          final swap1 = fromValue;
                          final swap2 = toValue;
                          fromValue = swap2;
                          toValue = swap1;
                        });
                      },
                      icon: const Icon(Icons.swap_horiz_rounded)),
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
                      value: toValue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      elevation: 16,
                      onChanged: (String? newValue) {
                        setState(() {
                          toValue = newValue!;
                        });
                      },
                      items: currency.map((String currency) {
                        return DropdownMenuItem(
                          value: currency,
                          child: Text(currency),
                        );
                      }).toList(),
                    ),
                    // Dropdown Ends
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.greenAccent[700],
                  elevation: 0,
                  // splashFactory: NoSplash.splashFactory,
                ),
                onPressed: () {
                  setState(() {
                    getrates();
                  });
                },
                child: const Text(
                  'CONVERT',
                  style: TextStyle(fontSize: 20),
                )),
          )
        ],
      ),
    );
  }
}
