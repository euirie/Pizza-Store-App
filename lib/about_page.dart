import 'package:flutter/material.dart';

const String kHeroImage = 'assets/images/pizza.jpg';
const String kStoryImage = 'assets/images/pizza.jpg';
const Color kOrange = Color(0xFFFF5722);
const Color kDark = Color(0xFF121212);
const Color kCard = Color(0xFF1E1E1E);

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDark,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _Hero(),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const _StorySection(),
                      const SizedBox(height: 40),
                      const _StatsRow(),
                      const SizedBox(height: 40),
                      const _FeaturesSection(),
                      const SizedBox(height: 40),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: kOrange, width: 2),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 16,
                          ),
                        ),
                        child: const Text('Back to Home'),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Shows a picture. If the file is missing, shows a pizza icon instead.
class _PizzaImage extends StatelessWidget {
  const _PizzaImage({required this.path, this.height});

  final String path;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      height: height,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: height ?? 200,
          width: double.infinity,
          color: kCard,
          alignment: Alignment.center,
          child: const Icon(Icons.local_pizza, color: kOrange, size: 64),
        );
      },
    );
  }
}

// Big banner at the top with the title over the picture.
class _Hero extends StatelessWidget {
  const _Hero();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const _PizzaImage(path: kHeroImage),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black54, kDark],
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: 70,
                  height: 3,
                  child: ColoredBox(color: kOrange),
                ),
                SizedBox(height: 12),
                Text(
                  'Taste the WOW in every bite!',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Picture beside text on wide screens, stacked on narrow screens.
class _StorySection extends StatelessWidget {
  const _StorySection();

  @override
  Widget build(BuildContext context) {
    final picture = ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: const _PizzaImage(path: kStoryImage, height: 260),
    );

    const story = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'OUR STORY',
          style: TextStyle(
            color: kOrange,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'WOW Pizza started with one simple idea: great pizza should make '
          'you say "WOW" with every bite. We stretch our dough by hand and '
          'bake every pizza fresh in a hot stone oven.',
          style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.6),
        ),
        SizedBox(height: 12),
        Text(
          'From classic beef pepperoni to our loaded house specials, we use '
          'quality toppings and rich tomato sauce. Come hungry? Leave happy!',
          style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.6),
        ),
      ],
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 700) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: picture),
              const SizedBox(width: 32),
              const Expanded(child: story),
            ],
          );
        }
        return Column(children: [picture, const SizedBox(height: 24), story]);
      },
    );
  }
}

// Three big numbers in a row.
class _StatsRow extends StatelessWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: _Stat(number: '10+', label: 'Pizza flavours'),
        ),
        Expanded(
          child: _Stat(number: '30 min', label: 'Fast delivery'),
        ),
        Expanded(
          child: _Stat(number: '5 stars', label: 'Happy customers'),
        ),
      ],
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.number, required this.label});

  final String number;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            color: kOrange,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}

// Three cards: "Why choose us?"
class _FeaturesSection extends StatelessWidget {
  const _FeaturesSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'WHY CHOOSE US?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: [
            _FeatureCard(
              icon: Icons.eco,
              title: 'Fresh Ingredients',
              text: 'Prepared fresh every single day.',
            ),
            _FeatureCard(
              icon: Icons.local_fire_department,
              title: 'Stone Oven',
              text: 'Baked hot for a crispy crust.',
            ),
            _FeatureCard(
              icon: Icons.delivery_dining,
              title: 'Fast Service',
              text: 'Hot pizza, friendly smiles.',
            ),
          ],
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.text,
  });

  final IconData icon;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kOrange, width: 1),
      ),
      child: Column(
        children: [
          Icon(icon, color: kOrange, size: 40),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
