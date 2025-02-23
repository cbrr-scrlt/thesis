import 'package:flutter/material.dart';

class WastePage extends StatefulWidget {
  @override
  _WastePageState createState() => _WastePageState();
}

class _WastePageState extends State<WastePage> {
  final List<Item> items = [
    Item(name: "Plastic Bottles", image: "images/bottles.png", quantity: 10),
    Item(name: "Wrappers", image: "images/wrappers.png", quantity: 5),
    Item(name: "Paper", image: "images/paper.png", quantity: 8),
    Item(name: "Plastic Cups", image: "images/cups.png", quantity: 12),
  ];

  void updateQuantity(int index, int newQuantity) {
    setState(() {
      items[index].quantity = newQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Waste Page")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ItemBox(
              item: items[index],
              onQuantityChange: (newQuantity) => updateQuantity(index, newQuantity),
            );
          },
        ),
      ),
    );
  }
}

class Item {
  final String name;
  final String image;
  int quantity;

  Item({required this.name, required this.image, required this.quantity});
}

class ItemBox extends StatelessWidget {
  final Item item;
  final Function(int) onQuantityChange;

  const ItemBox({Key? key, required this.item, required this.onQuantityChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        int newQuantity = item.quantity + 1; // Modify this logic as per actual input handling
        onQuantityChange(newQuantity);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${item.name} now has ${newQuantity} units.")),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black, width: 2),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(item.image, height: 80, width: 80),
            SizedBox(height: 8),
            Text(
              item.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Quantity: ${item.quantity}",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
