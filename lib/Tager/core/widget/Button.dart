import 'package:flutter/material.dart';

import '../const/Styles.dart';



class Button extends StatelessWidget {
  final String textButton;
  final Function funcation;

const  Button({super.key,required this.textButton,required this.funcation});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        funcation();
      },
      child: Container(
        height: 50,
        width: double.infinity,

        decoration: BoxDecoration(
          color:const Color(0xffC19843) ,
          borderRadius: BorderRadius.circular(10.0),

        ),
        child: Center(child: Text(textButton,style: Styles.textStyleTitle16)),
      ),
    );
  }
}
class ButtonSide extends StatelessWidget {
  final String textButton;
  final Function funcation;

  const  ButtonSide({super.key,required this.textButton,required this.funcation});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        funcation();
      },
      child: Container(
        height: 50,
        width: double.infinity,

        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: const Color(0xffC19843),
          )

        ),
        child: Center(child: Text(textButton,style: Styles.textStyleTitle24,)),
      ),
    );
  }
}