import 'package:bill_calculator/style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  double price = 0.0;

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
                    "$price Rs",
                    style: Style.hedingText3,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),

          // 3.. textinputfield
          TextField(
            onChanged: (value) {
              setState(() {
                price = double.parse(controller.text);
              });
              print(controller.text);
            },
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Please Enter Bill',
                labelText: 'Please Enter Bill'),
          ),
        ],
      ),
    );
  }
}
