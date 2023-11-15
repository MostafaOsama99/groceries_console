import 'dart:io';

import 'package:groceries_store/product.dart';

void showOrderSummary(List<Map<String, dynamic>> order) {
  print('item\t| quantity\t| unit price\t| row price');

  double totalPrice = 0;

  //TODO: make class order that contains: id, selected products, quantity per each product, order number, date
  for (var element in order) {
    final Product product = element['product'];
    final int quantity = element['quantity'];

    print('${product.name}\t| $quantity\t\t| ${product.price}\t| ${quantity * product.price}');

    totalPrice += quantity * product.price;
  }

  print('\nTotal: $totalPrice');

  print('press "c" to confirm your order');
  String input = stdin.readLineSync() ?? '';

  if (input == 'c') {
    //TODO: decrement from stock
  }
  print('good bye');
}

void main() {
  final products = <Product>[
    Product(name: 'samsung', id: 2, stock: 1, price: 10.99, category: 'mobile', color: 'white'),
    Product(name: 'charger', id: 1, stock: 9, price: 120, category: 'electronics'),
    Product(name: 'fridge', id: 2, stock: 2, price: 30100, category: 'appliance'),
    Product(name: 'name', id: 3, stock: 17, price: 80, category: 'category'),
  ];

  void addProduct() {
    print('please enter product name');
    String input = stdin.readLineSync() ?? '';
    String name = input;

    print('please enter price');
    input = stdin.readLineSync() ?? '0';
    double price = double.tryParse(input) ?? 0;

    print('please enter quantity');
    input = stdin.readLineSync() ?? '0';
    int stock = int.tryParse(input) ?? 0;

    print('please enter id');
    input = stdin.readLineSync() ?? '0';
    int id = int.tryParse(input) ?? 0;

    print('please enter product category');
    input = stdin.readLineSync() ?? '';
    String category = input;

    print('please enter product size');
    input = stdin.readLineSync() ?? '';
    String size = input;

    print('please enter product color');
    input = stdin.readLineSync() ?? '';
    String color = input;

    final newProduct = Product(
      name: name,
      id: id,
      stock: stock,
      price: price,
      category: category,
      color: color,
      size: size,
    );

    //TODO: increment the product if it's already exist in the stock list
    products.add(newProduct);
  }

  void makeOrder() {
    List<Map<String, dynamic>> order = [];

    for (var product in products) {
      product.print();
    }

    while (true) {
      print('\nselect product');
      String input = stdin.readLineSync() ?? '';
      final selectedId = int.tryParse(input) ?? 0;
      Product selectedProduct;

      try {
        selectedProduct = products.firstWhere((element) => element.id == selectedId);
      } catch (_) {
        print('select a valid product');
        continue;
      }

      print('please enter quantity');
      input = stdin.readLineSync() ?? '0';
      int quantity = int.tryParse(input) ?? 0;

      //TODO: check weather the product added to cart, show error message says: "the item already added"
      if (quantity <= selectedProduct.stock) {
        order.add({'product': selectedProduct, 'quantity': quantity});
      } else {
        print('out of stock, only ${selectedProduct.stock} available');
      }

      print('do you need anything else? \t "y/n"');
      input = stdin.readLineSync() ?? '';
      if (input != 'y') {
        // show order summary

        showOrderSummary(order);

        break;
      }
    }
  }

  while (true) {
    print('please enter "a" to add product or "o" order');
    String input = stdin.readLineSync() ?? '';

    switch (input) {
      case "a":
        addProduct();
      case "o":
        makeOrder();
      default:
        print('good bye');
        break;
    }
  }
}
