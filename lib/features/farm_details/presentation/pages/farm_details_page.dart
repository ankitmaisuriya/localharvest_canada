import 'package:flutter/material.dart';
import 'package:localharvest_canada/core/widgets/responsive_layout.dart';
import 'package:localharvest_canada/features/farm_details/presentation/widgets/farm_contact_card.dart';
import 'package:localharvest_canada/features/farm_details/presentation/widgets/farm_info_card.dart';
import 'package:localharvest_canada/features/farm_details/presentation/widgets/product_card.dart';

class FarmDetailsPage extends StatelessWidget {
  const FarmDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      child: DefaultTabController(
        length: 3, // About, Products, Reviews
        child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            backgroundColor: Colors.lightGreen,
            leading:  IconButton(onPressed:() {
              return Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
            title: const Text(
              "Sunny Fields Farm",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(text: "About"),
                Tab(text: "Products"),
                Tab(text: "Reviews"),
              ],
              indicatorColor: Colors.green,
              labelColor: Colors.white,
              unselectedLabelColor:Colors.black,
              dividerColor: Colors.white,
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.favorite_border,color: Colors.white,),
                onPressed: () {},
              ),
            ],
          ),
          // floatingActionButton: FloatingActionButton.extended(
          //   onPressed: () {
          //     // Navigate to cart
          //   },
          //   icon: const Icon(Icons.shopping_cart),
          //   label: const Text("View Cart (3)"),
          // ),
          body: TabBarView(
            children: [
              /// About Tab
              SingleChildScrollView(
                child: Column(
                  children: const [
                    /// Farm Info Card
                    FarmInfoCard(),

                    SizedBox(height: 16),

                    /// Contact Info
                    FarmContactCard(),
                  ],
                ),
              ),

              /// Products Tab
              GridView.builder(
                padding: const EdgeInsets.all(16),
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.72,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return const ProductCard();
                },
              ),

              /// Reviews Tab (static UI for now)
              ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.person)),
                      title: Text("Customer ${index + 1}"),
                      subtitle: const Text(
                        "Great quality produce! Fresh and organic.",
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.star, color: Colors.amber, size: 18),
                          Icon(Icons.star, color: Colors.amber, size: 18),
                          Icon(Icons.star, color: Colors.amber, size: 18),
                          Icon(Icons.star, color: Colors.amber, size: 18),
                          Icon(
                            Icons.star_border,
                            color: Colors.amber,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
