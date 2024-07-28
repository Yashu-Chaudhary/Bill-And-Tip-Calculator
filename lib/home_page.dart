import 'package:bill_calculator/style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  double? price = 0.0;
  double tipPercentage = 0;
  int n = 1;

  double totalBill() {
    double res = (price! + (price! * tipPercentage / 100)) / n;
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // 2.. container
          Container(
            height: 100,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Per Person bill is: ",
                    style: Style.hedingText2,
                  ),
                  Text(
                    "${totalBill().toStringAsFixed(2)} Rs",
                    style: Style.hedingText3,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),

          // 3.. textinputfield
          TextField(
            onChanged: (value) {
              setState(() {
                // logic to check the given text is double or string
                double.tryParse(controller.text) != null
                    ? price = double.parse(controller.text)
                    : price = 0;
              });
            },
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Please Enter Bill',
                labelText: 'Please Enter Bill'),
          ),
          const SizedBox(height: 15),

          // 3.. split by
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Split By',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (n > 1) {
                            n--;
                          }
                        });
                      },
                      icon: const Icon(Icons.exposure_minus_1)),
                  Text('$n',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w600)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          n++;
                        });
                      },
                      icon: const Icon(Icons.exposure_plus_1)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Divider(color: Colors.black, thickness: 2),
          const SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tip Percentage',
                style: TextStyle(fontSize: 22),
              ),
              Text(
                '${double.parse(tipPercentage.toStringAsFixed(2))}',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 10),

          Slider(
            divisions: 10,
            value: tipPercentage,
            onChanged: (value) {
              setState(() {
                tipPercentage = value;
              });
            },
            min: 0,
            max: 100,
          ),
        ],
      ),
    );
  }
}
