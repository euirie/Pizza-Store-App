import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  MenuPage({super.key});

  final List<Map<String, String>> pizzas = [
    {
      'name': 'Margherita Pizza',
      'description': 'Fresh tomatoes, mozzarella cheese and basil.',
      'ingredients': 'Tomato sauce, Mozzarella Cheese, Basil, Olive Oil, Salt',
      'smallPrice': 'RM 18.00',
      'largePrice': 'RM 25.00',
      'image': 'assets/images/Margherita Pizza.jpg',
    },
    {
      'name': 'Pepperoni Pizza',
      'description': 'Classic pepperoni with melted cheese.',
      'ingredients':
          'Tomato sauce, Mozzarella Cheese, Pepperoni, Olive Oil, Oregano',
      'smallPrice': 'RM 22.00',
      'largePrice': 'RM 28.00',
      'image': 'assets/images/Pepperoni Pizza.jpg',
    },
    {
      'name': 'BBQ Chicken Pizza',
      'description': 'Grilled chicken, BBQ sauce and cheese.',
      'ingredients':
          'BBQ Sauce, Grilled Chicken, Mozzarella Cheese, Red Onion, Cilantro',
      'smallPrice': 'RM 23.00',
      'largePrice': 'RM 29.00',
      'image': 'assets/images/BBQ Chicken Pizza.jpg',
    },
    {
      'name': 'Veggie Delight Pizza',
      'description': 'Fresh vegetables and mozzarella cheese.',
      'ingredients': 'Tomato sauce, Mozzarella Cheese, Bell Peppers, Onions, Mushrooms, Olives',
      'smallPrice': 'RM 20.00',
      'largePrice': 'RM 26.00',
      'image': 'assets/images/Veggie Delight Pizza.jpg',
    },
    {
      'name': 'Cheese Pizza',
      'description': 'Extra cheese with our classic pizza sauce.',
      'ingredients': 'Tomato sauce, Mozzarella Cheese, Parmesan Cheese, Olive Oil, Oregano',
      'smallPrice': 'RM 19.00',
      'largePrice': 'RM 25.00',
      'image': 'assets/images/Cheese Pizza.jpg',
    },
  ];

  static const Color dark = Color(0xFF171719);
  static const Color orange = Color(0xFFFF7138);

  void showPizzaDetails(BuildContext context, Map<String, String> pizza) {
    String selectedSize = 'Small';

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          final price = selectedSize == 'Small'
              ? pizza['smallPrice']!
              : pizza['largePrice']!;

          return Dialog(
            backgroundColor: const Color(0xFF292528),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: Color(0xFFE97845)),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        pizza['image']!,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 16),

                    Text(
                      pizza['name']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      pizza['description']!,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 18),

                    const Text(
                      'Ingredients',
                      style: TextStyle(
                        color: Color(0xFFE97845),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      pizza['ingredients']!,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),

                    const Text(
                      'Choose Your Size',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    Row(
                      children: ['Small', 'Large'].map((size) {
                        final isSelected = selectedSize == size;

                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: OutlinedButton(
                              onPressed: () {
                                setDialogState(() {
                                  selectedSize = size;
                                });
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: isSelected
                                    ? const Color(0xFFE97845)
                                    : Colors.white70,
                                side: BorderSide(
                                  color: isSelected
                                      ? const Color(0xFFE97845)
                                      : Colors.white38,
                                  width: isSelected ? 2 : 1,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                size,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Price',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        Text(
                          price,
                          style: const TextStyle(
                            color: Color(0xFFE97845),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),

                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFFE97845),
                          side: const BorderSide(color: Color(0xFFE97845)),
                        ),
                        child: const Text('Close'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      appBar: AppBar(
        backgroundColor: dark,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Our Menu',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: pizzas.length,
              itemBuilder: (context, index) {
                final pizza = pizzas[index];

                return Card(
                  color: const Color(0xFF292528),
                  margin: const EdgeInsets.only(bottom: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    side: const BorderSide(color: orange, width: 1),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () => showPizzaDetails(context, pizza),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          pizza['image']!,
                          height: 190,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 190,
                              color: Colors.black26,
                              alignment: Alignment.center,
                              child: const Text(
                                'Pizza image unavailable',
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pizza['name']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                pizza['description']!,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'From ${pizza['smallPrice']}',
                                    style: const TextStyle(
                                      color: orange,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Icon(Icons.touch_app, color: orange),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.home, color: orange),
                label: const Text(
                  'Back to Home',
                  style: TextStyle(color: Colors.white),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: orange),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
