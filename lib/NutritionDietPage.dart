import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

import 'Component/Components.dart';
import 'NutritionDietImagePage.dart';

class NutritionDietPage extends StatelessWidget {
  const NutritionDietPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Nutrition Diet"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                NutritionDietPageCard(
                  title: 'Vegetable',
                  image: "Assets/Diet1.jpg",
                  num: 1,
                ),
                NutritionDietPageCard(
                  title: 'Plant Beans Protein',
                  image: "Assets/Diet2.jpg",
                  num: 2,
                ),
                NutritionDietPageCard(
                  title: 'Fats & Oil',
                  image: "Assets/Diet3.jpg",
                  num: 3,
                ),
                NutritionDietPageCard(
                  title: 'Fruits',
                  image: "Assets/Diet4.jpg",
                  num: 4,
                ),
                NutritionDietPageCard(
                  title: 'Food to Avoid',
                  image: "Assets/Diet5.jpg",
                  num: 5,
                ),
              ],
            ),
          ),
        ));
  }
}
