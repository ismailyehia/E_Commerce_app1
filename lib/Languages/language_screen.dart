import 'package:ecommerce_course/Languages/custombutton.dart';
import 'package:ecommerce_course/Languages/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Languages'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Choose language",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,),),
            
            const SizedBox(height: 10,),

            CustomButtonLang(textButton: "Ar",onPressed: (){

              Provider.of<LanguageProvider>(context, listen: false)
                    .switchLanguage(Language.Arabic);



            },
            ),

            CustomButtonLang(textButton: "En",onPressed: (){


                Provider.of<LanguageProvider>(context, listen: false)
                    .switchLanguage(Language.English);


            },),

          ],
        ),
      ),
    );
  }
}


