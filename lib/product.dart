import 'dart:core' as core;
import 'dart:core' hide print;

class Product {
  final String name;
  final int id;
  int stock;
  double price;
  final String category;
  final String size;
  final String color;

  Product({
    required this.name,
    required this.id,
    required this.stock,
    required this.price,
    required this.category,
    this.size = 'N/A',
    this.color = 'N/A',
  });

  //
  // Product.fromUser(){
  //   print('please enter product name');
  //   String input = stdin.readLineSync() ?? '';
  //
  //   print('please enter price');
  //   input = stdin.readLineSync() ?? '0';
  // }

  void print(){
    core.print('----- $id -----');
    core.print('name: $name');
    core.print('price: $price');
    core.print('stock: $stock');
    if (color != 'N/A') {
      core.print('color: $color');
    }
  }


}

void test() {
  final product = Product(name: 'name', id: 0, stock: 10, price: 10, category: 'category');

  final products = [
    Product(name: 'name', id: 0, stock: 10, price: 10, category: 'category'),
    Product(name: 'name', id: 1, stock: 10, price: 10, category: 'category'),
    Product(name: 'name', id: 2, stock: 10, price: 10, category: 'category'),
    Product(name: 'name', id: 3, stock: 10, price: 10, category: 'category'),
  ];

  products.firstWhere((element) => element.id == 2).stock;

  final mapProduct = {'name': 'oxi'};

  mapProduct[''];
}
