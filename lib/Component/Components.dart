import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

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
    return BouncingWidget(
      onPressed: () {
        Future.delayed(const Duration(milliseconds: 500), () {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  title: const Text(
                    "Data",
                    style: TextStyle(color: Colors.black54),
                  ),
                  content: const Text(
                    "------------------------",
                    style: TextStyle(color: Colors.black54),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Okay",
                          style: TextStyle(color: Colors.black54),
                        )),
                  ],
                );
              });
        });
      },
      child: Container(
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
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                const SizedBox(height: 10),
                Text(
                  data,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            )
          ],
        ),
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
          //     () {
          //   description == false
          //       ? showDialog(
          //           barrierDismissible: true,
          //           context: context,
          //           builder: (context) {
          //             return AlertDialog(
          //               shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(16)),
          //               title: Text(
          //                 logoutDialog ? "Logout" : "Data",
          //                 style: const TextStyle(color: Colors.black54),
          //               ),
          //               content: Text(
          //                 logoutDialog
          //                     ? "You want to logout?"
          //                     : "------------------------",
          //                 style: const TextStyle(color: Colors.black54),
          //               ),
          //               actions: [
          //                 TextButton(
          //                     onPressed: () {
          //                       Navigator.pop(context);
          //                     },
          //                     child: const Text(
          //                       "Okay",
          //                       style: TextStyle(color: Colors.black54),
          //                     )),
          //               ],
          //             );
          //           })
          //       : Navigator.of(context).push(MaterialPageRoute(
          //           builder: (context) => const DescriptionPage()));
          // },
          child: Row(
            children: [
              const SizedBox(width: 15),
              Icon(icon, color: Colors.white, size: 30),
              const SizedBox(width: 20),
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 20),
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
          color: const Color(0xff525355),
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
                    style: const TextStyle(color: Colors.white),
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
          color: const Color(0xff525355),
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
                  style: const TextStyle(color: Colors.white, fontSize: 20),
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
                    style: const TextStyle(color: Colors.white, fontSize: 20),
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
