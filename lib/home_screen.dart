import 'package:ecommerce_2/cart_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color firstCardBackgroundColor = const Color.fromARGB(255, 6, 125, 223);
  final Color secondCardBackgroundColor = const Color.fromRGBO(255, 193, 7, 1);
  bool isfavorite = false;
  int isSelectedIndex = 0;



   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 231, 231),
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 00,
        leading: IconButton(
          iconSize: 30,
          icon: const Icon(Icons.menu_sharp),
          tooltip: 'Menu button',
          onPressed: () {
            // handle the press
          },
        ),
        backgroundColor: const Color.fromARGB(255, 233, 231, 231),
        actions: [
          IconButton(
            iconSize: 30,
            icon: const Icon(Icons.search),
            tooltip: 'Search button',
            onPressed: () {
              // handle the press
            },
          ),
          IconButton(
            iconSize: 30,
            icon: const Icon(Icons.shopping_cart_outlined),
            tooltip: 'Open shopping cart',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Premium Outfit",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 6, 125, 223),
                    ),
                  ),
                  const Text(
                    "50% discount",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .02,
                  ),
                  BuyButton(
                    color: firstCardBackgroundColor,
                    textcolor: Colors.white,
                  ),
                ],
              ),
            ),
            //BLUE BUTTON
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .025,
            ),
            Material(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: AlignmentDirectional.topStart,
                      children: [
                        Container(
                          height: MediaQuery.sizeOf(context).height * .17,
                          width: MediaQuery.sizeOf(context).width / 1,
                          decoration: ShapeDecoration(
                            image: const DecorationImage(
                                image: AssetImage(
                                  "assets/images/botique.png",
                                ),
                                fit: BoxFit.cover),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            // color: Colors.blue,
                          ),
                        ),
                        Positioned(
                            right: -1,
                            top: -25,
                            child: Image.asset(
                              "assets/images/man.png",
                              height: MediaQuery.sizeOf(context).height * .2,
                              //width: MediaQuery.sizeOf(context).width *.9,
                            )),
                        Positioned(
                          right: 140,
                          bottom: -20,

                          child: BuyButton(
                            color: secondCardBackgroundColor,
                            textcolor: Colors.black,
                          ),
                          //YELLOW BUTTON
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .02,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Category",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          "Show more",
                          style: TextStyle(
                            color: Color.fromARGB(255, 175, 173, 173),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .02,
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .15,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryDetails.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * .03,
                              ),
                          itemBuilder: (BuildContext context, int index) {
                            final cate = categoryDetails[index];
                            final cname = cate["name"];
                            final cimage = cate["image"];
                            return CategoryCard(
                              name: cname,
                              image: cimage,
                            );
                            
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Flash Sales",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              "Closing in:",
                              style: TextStyle(
                                color: Color.fromARGB(255, 175, 173, 173),
                                fontSize: 16,
                              ),
                            ),
                            const TimeButton(
                              text: "00",
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * .01,
                            ),
                            const TimeButton(
                              text: "07",
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * .01,
                            ),
                            const TimeButton(
                              text: "30",
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .04,
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .2,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryDetails.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * .03,
                              ),
                          itemBuilder: (BuildContext context, int index) {
                            final salecard = categoryDetails[index];
                            final fimg = salecard["image"];
                            return FlashSalesCard(
                              img: fimg,
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
    );
  }
}

class TimeButton extends StatelessWidget {
  const TimeButton({
    super.key,
    this.text,
  });
  final String? text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .06,
      height: MediaQuery.sizeOf(context).height * .025,
      child: Material(
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: const BorderSide(
                color: Color.fromARGB(255, 175, 173, 173),
                style: BorderStyle.solid)),
        child: Center(
          child: Text(
            text!,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    this.image,
    this.name,
  });
  final String? image;
  final String? name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * .08,
          width: MediaQuery.sizeOf(context).width * .18,
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
              image!,

              // fit: BoxFit.cover,
              // width: MediaQuery.sizeOf(context).width * .4,
              // height: MediaQuery.sizeOf(context).height * .3,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .02,
        ),
        Text(
          name!,
          style: const TextStyle(
            color: Color.fromARGB(255, 175, 173, 173),
            fontSize: 16,
          ),
        )
      ],
    );
  }
}

class BuyButton extends StatelessWidget {
  const BuyButton({
    super.key,
    this.color,
    this.textcolor,
  });
  final Color? color;
  final Color? textcolor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
          backgroundColor: MaterialStatePropertyAll(color!)),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 13),
        child: Text(
          "Buy now",
          style: TextStyle(
            color: textcolor!,
            fontSize: 20,
            //fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class FlashSalesCard extends StatefulWidget {
  const FlashSalesCard({super.key, this.img});
  final String? img;

  @override
  State<FlashSalesCard> createState() => _FlashSalesCardState();
}

class _FlashSalesCardState extends State<FlashSalesCard> {
  bool isfavorite = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * .15,
          width: MediaQuery.sizeOf(context).width * .33,
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
            padding: const EdgeInsets.all(5),
            child: Image.asset(
              widget.img!,

              fit: BoxFit.cover,
              // width: MediaQuery.sizeOf(context).width * .4,
              // height: MediaQuery.sizeOf(context).height * .3,
            ),
          ),
        ),
        Positioned(
            right: 2,
            top: 2,
            child: InkWell(
                onTap: () {
                  setState(() {
                    isfavorite = !isfavorite;
                  });
                },
                child: Icon(
                  Icons.favorite,
                  color: isfavorite ? Colors.amber : Colors.grey,
                  size: 28,
                ))),
      ],
    );
  }
}

List<Map<String, String>> categoryDetails = [
  {"image": "assets/images/hat1.png", "name": "Hats"},
  {"image": "assets/images/hill.png", "name": "Girl's hill"},
  {"image": "assets/images/camon.png", "name": "Cameras"},
  {"image": "assets/images/tshirt.png", "name": "T-shirts"},
  {"image": "assets/images/adidasshoe.webp", "name": "Boy's shoe"},
  {"image": "assets/images/watch.png", "name": "Watches"},
  {"image": "assets/images/sleeve.png", "name": "Men's Sleeves"},
  {"image": "assets/images/phone.png", "name": "Phones"},
  {"image": "assets/images/schbag.png", "name": "Bags"},
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
