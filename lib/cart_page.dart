import 'package:ecommerce_2/home_screen.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int isSelectedIndex = 2;
   

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        
        showSelectedLabels: true,
        showUnselectedLabels: true,
       currentIndex: isSelectedIndex,
        items: const [
          
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home" ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_outlined), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: "Profile"),
        ],
        landscapeLayout:BottomNavigationBarLandscapeLayout.spread ,
        onTap:(int index) {
          _navigateToPage(context, index);
        },

        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios)),
        title: const Center(
          child: Text(
            "Your Cart",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              //color: Colors.black,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .03,
              ),
              Row(
                children: [
                  const Text(
                    "Buy Upto \$700",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .02,
                  ),
                  const Text(
                    "enjoy free shipping for standard delivery",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .04,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .7,
                child: ListView.separated(
                  itemCount: goodsdetails.length,
                  separatorBuilder: (BuildContext context, int index) => SizedBox(
                    height: MediaQuery.sizeOf(context).height * .04,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final good = goodsdetails[index];
                    final gname = good["name"];
                    final gname2 = good["name2"];
                    final gimage = good["image"];
                    final gprice = good["price"];
        
                    return Goodscard(
                      name2: gname2,
                      name: gname,
                      image: gimage,
                      iniprice: gprice,
                    );
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   const Text(
                     "\$437.00",
                     style: TextStyle(
                       color: Colors.black,
                       fontSize: 30,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.amber)),
                      onPressed: () {},
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 12),
                        child: Text(
                          "Check Out",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Goodscard extends StatefulWidget {
  const Goodscard({
    super.key,
    this.image,
    this.name,
    this.name2,
    this.cost,
    this.totalCost,
    this.iniprice,
  });
  final String? image;
  final String? name;
  final String? name2;
  final double? cost;
  final double? totalCost;
  final double? iniprice;

  @override
  State<Goodscard> createState() => _GoodscardState();
}

class _GoodscardState extends State<Goodscard> {
  int qty = 1;



  void add() {
    setState(() {
      qty++;
    });
  }

  void remove() {
    setState(() {
      if (qty > 1) {
        qty--;
      }
    });
  }

  double cost = 37.00;

  double totalCost = 00.00;

  amount() {
    double newcost = cost * qty;
    setState(() {
      totalCost = newcost;
    });
  }
double tamount = 00.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * .14,
          width: MediaQuery.sizeOf(context).width / 4,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(2, 3),
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Image.asset(
              widget.image!,
              // fit: BoxFit.cover,
              width: MediaQuery.sizeOf(context).width * .4,
              height: MediaQuery.sizeOf(context).height * .3,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .02,
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .41,
          child: Column(
            children: [
              Text(
                widget.name!,
                style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .01,
              ),
              Text(
                widget.name2!,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .01,
              ),
              Row(
                children: [
                  IconButton(
                      iconSize: 30,
                      onPressed: () {
                        add();
                        amount();
                      },
                      icon: const Icon(
                        Icons.add_circle_outline_rounded,
                      )),
                  Text(
                    "$qty",
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                      iconSize: 30,
                      onPressed: () {
                        remove();
                        amount();
                      },
                      icon: const Icon(
                        Icons.remove_circle_outline_rounded,
                      )),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .025,
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width / 5,
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    "\$",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    (totalCost).toStringAsFixed(2),
                    style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .01,
              ),
              Row(
                children: [
                  const Text("\$"),
                  Text(
                    (widget.iniprice!).toStringAsFixed(2),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .02,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete),
                iconSize: 30.0,
              )
            ],
          ),
        )
      ],
    );
  }
}

List<Map<String, dynamic>> goodsdetails = [
  {
    "image": "assets/images/afriwear.png",
    "name": "Men's suit",
    "name2": "African wear",
    "price": 67.00,
  },
  {
    "image": "assets/images/camon.png",
    "name": "Digital Camera",
    "name2": "Camon camera",
    "price": 300.00,
  },
  {
    "image": "assets/images/hill.png",
    "name": "Lady's hill",
    "name2": "white hill",
    "price": 50.00,
  },
  {
    "image": "assets/images/manblackglass.png",
    "name": "Men's suit",
    "name2": "Men's cloth",
    "price": 70.00,
  },
  {
    "image": "assets/images/manwhite.png",
    "name": "Leather jacket",
    "name2": "men's cloth",
    "price": 40.00,
  },
  {
    "image": "assets/images/shoe.png",
    "name": "Cute Snikkers",
    "name2": "men's shoe",
    "price": 100.00,
  },
  {
    "image": "assets/images/sleeve.png",
    "name": "Men's Sleeves",
    "name2": "men's cloth",
    "price": 70.00,
  },
  //   {
  //   "image": "assets/images/afriwear.png",
  //   "name": "Men's suit",
  //   "name2": "African wear",
  // },
];
void _navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      case 2:
        
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CartPage()),
        );
        break;
      // case 2:
  
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => ),
      //   );
      //   break;
    }
  }
