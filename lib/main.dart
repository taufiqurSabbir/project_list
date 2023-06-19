import 'package:flutter/material.dart';
import 'package:product_list/cart.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
    ;
  }
}

class product {
  final String name;
  final double price;
  int quantity;
  product(this.name, this.price, this.quantity);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<product> product_list = [
    product('product-1', 10, 0),
    product('product-2', 10, 0),
    product('product-3', 10, 0),
    product('product-4', 10, 0),
    product('product-5', 10, 0),
    product('product-6', 10, 0),
    product('product-7', 10, 0),
    product('product-8', 10, 0),
    product('product-9', 10, 0),
    product('product-10', 10, 0),
    product('product-11', 10, 0),
    product('product-10', 10, 0),
    product('product-10', 10, 0),
    product('product-10', 10, 0),
    product('product-10', 10, 0),
    product('product-10', 10, 0),
    product('product-10', 10, 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: product_list.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ListTile(
                minLeadingWidth: 100,
                title: Text(product_list[index].name),
                subtitle: Text('\$${product_list[index].price.toString()}'),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Counter:${product_list[index].quantity.toString()}',
                    ),
                    SizedBox(
                      height: 30,
                      width: 100,
                      child: ElevatedButton(
                          onPressed: () {
                            product_list[index].quantity++;

                            if (product_list[index].quantity == 5) {
                              // showDialog<String>(
                              //   context: context,
                              //   builder: (BuildContext context) => AlertDialog(
                              //     title: const Text('AlertDialog Title'),
                              //     content:
                              //         const Text('AlertDialog description'),
                              //     actions: <Widget>[
                              //       TextButton(
                              //         onPressed: () =>
                              //             Navigator.pop(context, 'OK'),
                              //         child: const Text('OK'),
                              //       ),
                              //     ],
                              //   ),
                              // );


                              showDialog(context: context, builder: (context)=>AlertDialog(
                                title: Text('Congratulations!'),
                                content: Text('You\'ve bought 5 ${product_list[index].name}!'),
                                actions: [
                                  TextButton(onPressed: ()=>{
                                    Navigator.pop(context,'ok')
                                  }, child: Text('Okay'))
                                ],
                              ));
                            }
                            setState(() {});
                          },
                          child: Text('Buy Now')),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int total = 0;

          for (int i = 0; i < product_list.length; i++) {
            total = total + product_list[i].quantity;
          }

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart( Total_product: total,)));
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
