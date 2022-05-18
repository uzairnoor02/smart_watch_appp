import 'package:flutter/material.dart';

class NutritionDietPage extends StatelessWidget {
  final String title;
  final String image;
  final int num;
  const NutritionDietPage(
      {Key? key, required this.title, required this.image, required this.num})
      : super(key: key);

  String dietPlan({required int num}) {
    if (num == 1) {
      return "Vegetables are a key source of essential vitamins, minerals, and antioxidants. Eat a variety of vegetables with different colors for a full range of nutrients.\n\nDark, leafy greens are an excellent source of many nutrients. They include:\n\n1: spinach\n2: kale\n3: green beans\n4: broccoli\n5: collard greens\n6: Swiss chard\nLocal, seasonal vegetables are often reasonable in price and easy to prepare. Use them in the following ways:\n\nas a side dishroasted in a tray with a splash of olive oil as the base in soups, stews, and pasta dishes as a salad in purées in juices and smoothies";
    } else if (num == 2) {
      return "Nuts, beans, and soy products are good sources of protein, fiber, and other nutrients.\n\nExamples include:\n\nLentils\nBeans\nPeas\nAlmonds\nSunflower seeds\nWalnuts\nTofu, tempeh, and other soy-based products are excellent sources of protein and are healthy alternatives to meat.\n\nShop for tofu and tempeh.";
    } else if (num == 3) {
      return "Fat is essential for energy and cell health, but too much fat can increase calories above what the body needs and may lead to weight gain.\nRecommendations on fats can sometimes be hard to follow, but one scientistTrusted Source has proposed the following guideline:\n\nFats to love: vegetable oils and fish oils\nFats to limit: butter, cheese, and heavy cream\nFats to lose: trans fats, used in many processed and premade foods, such as donuts\nMost experts consider olive oil to be a healthy fat, and especially extra virgin olive oil, which is the least processed type.\nDeep fried foods are often high in calories but low in nutritional value, so you should eat them sparingly.";
    } else if (num == 4) {
      return "Fruits are nutritious, they make a tasty snack or dessert, and they can satisfy a sweet tooth.\n\nLocal fruits that are in season are fresher and provide more nutrients than imported fruits.\n\nFruits are high in sugar, but this sugar is natural. Unlike candies and many sweet desserts, fruits also provide fiber and other nutrients. This means they’re less likely to cause a sugar spike and they’ll boost the body’s supply of essential vitamins, minerals, and antioxidants.\nIf you have diabetes, your doctor or dietitian can advise you on which fruits to choose, how much to eat, and when.";
    } else {
      return "Foods to avoid or limit on a healthy diet include:\n\nhighly processed foods\nrefined grains\nadded sugar and salt\nred and processed meat\nalcohol\ntrans fats\nWhat’s healthy for one person may not be suitable for another.\n\nWhole wheat flour can be a healthy ingredient for many people but isn’t suitable for those with a gluten intolerance";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                margin: const EdgeInsets.all(15),
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xff525355),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black.withOpacity(.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    dietPlan(num: num),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
