import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../NutritionDietImagePage.dart';

// import '../DescriptionPage.dart';

class LoginPageInputField extends StatefulWidget {
  final TextEditingController _emailController;
  final String labelText;
  final String hintText;
  final bool hideText;
  final IconData prefix;

  const LoginPageInputField({
    Key? key,
    required TextEditingController emailController,
    required this.labelText,
    required this.prefix,
    required this.hintText,
    required this.hideText,
  })  : _emailController = emailController,
        super(key: key);

  @override
  State<LoginPageInputField> createState() => _LoginPageInputFieldState();
}

class _LoginPageInputFieldState extends State<LoginPageInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: widget._emailController,
        cursorColor: Colors.white,
        obscureText: widget.hideText ? true : false,
        decoration: InputDecoration(
            border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusColor: Colors.white,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            prefixIcon: Icon(
              widget.prefix,
              color: Colors.white,
            ),
            labelText: widget.labelText,
            labelStyle: const TextStyle(color: Colors.white),
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.white)),
        validator: (value) {
          if (value!.isEmpty) {
            return "Required";
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}

class HomePageCard extends StatelessWidget {
  final String icon;
  final String title;
  final String data;
  final bool padding;
  const HomePageCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.data,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withOpacity(.2),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.height / 35),
            height: MediaQuery.of(context).size.height / 5,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 3,
                  offset: const Offset(0, 0),
                  blurRadius: 7.0,
                )
              ],
            ),
            child: Image.asset(icon),
          ),
          SizedBox(
            width: padding ? 25 : 0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              const SizedBox(height: 10),
              Text(
                data,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SettingWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool logoutDialog;
  final bool description;
  final VoidCallback onClick;
  const SettingWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.logoutDialog,
    required this.description,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        GestureDetector(
          onTap: onClick,
          child: Row(
            children: [
              const SizedBox(width: 15),
              Icon(icon, color: Colors.black, size: 30),
              const SizedBox(width: 20),
              Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              )
            ],
          ),
        ),
        const SizedBox(height: 15),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    this.title,
    this.colour,
    required this.onPressed,
  }) : super(key: key);

  final Color? colour;
  final String? title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 04.0,
      ),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title!,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class ImageMessage extends StatelessWidget {
  final String description;
  final String image;

  const ImageMessage({Key? key, required this.description, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: const Color(0xff525355).withOpacity(.1),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 50),
          image == "true"
              ? Container()
              : Expanded(
                  child: Image.network(
                    image,
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 2,
                    fit: BoxFit.fill,
                  ),
                ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Description: $description",
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
        ],
      ),
    );
  }
}

class HourInputField extends StatefulWidget {
  final TextEditingController _controller;
  final String labelText;
  final String hintText;

  const HourInputField({
    Key? key,
    required TextEditingController controller,
    required this.labelText,
    required this.hintText,
  })  : _controller = controller,
        super(key: key);

  @override
  State<HourInputField> createState() => _HourInputField();
}

class _HourInputField extends State<HourInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: widget._controller,
        cursorColor: Colors.white,
        decoration: InputDecoration(
            border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusColor: Colors.white,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            // prefixIcon: Icon(
            //   widget.prefix,
            //   color: Colors.white,
            // ),
            labelText: widget.labelText,
            labelStyle: const TextStyle(color: Colors.white),
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.white)),
        validator: (value) {
          if (value!.trim().isEmpty) {
            return "Required";
          }
          return null;
        },
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ScheduleNotificationCard extends StatelessWidget {
  final String hour;
  final String minute;
  final String description;
  const ScheduleNotificationCard({
    Key? key,
    required this.hour,
    required this.minute,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      // height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(.1),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Reminder set at: $hour:$minute",
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "Reminder Description: $description",
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NutritionDietPageCard extends StatelessWidget {
  final String image;
  final String title;
  final int num;
  const NutritionDietPageCard({
    Key? key,
    required this.image,
    required this.title,
    required this.num,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NutritionDietPage(
                  title: title,
                  image: image,
                  num: num,
                )));
      },
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: const EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height / 2.5,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                image,
                fit: BoxFit.fitHeight,
              ),
            ),
            Center(
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HealthPredictionTextFieldWidget extends StatelessWidget {
  final String title;
  final String labelText;
  final String hintText;
  final TextEditingController controller;

  const HealthPredictionTextFieldWidget({
    Key? key,
    required this.title,
    required this.labelText,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height / 20),
        Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width / 7.2),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 35),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.15),
          child: TextFormField(
            style: const TextStyle(color: Colors.black),
            controller: controller,
            cursorColor: Colors.black,
            decoration: InputDecoration(
                border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusColor: Colors.black,
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: labelText,
                labelStyle: const TextStyle(color: Colors.black),
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.black)),
            validator: (value) {
              if (value!.isEmpty) {
                return "Required";
              }
              return null;
            },
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
