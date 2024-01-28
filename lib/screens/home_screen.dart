import 'package:flutter/material.dart';
import 'package:flutter_widgets/models/test_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final testModel = TestModel();
  int color = 0xff6C22A6;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Color getColor(Set<MaterialState> state){
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (state.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Flutter Widgets',
        style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        width: size.width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Functions Testing', style: TextStyle(
                color: Color(0xff000000),
                fontFamily: 'Pacifico',
                fontSize: 40
            ),),
            const SizedBox(height: 20,),
            Text('${testModel.increaseVal}', style: const TextStyle(
                color: Color(0xff000000),
                fontFamily: 'Pacifico',
                fontSize: 40
            ),),
            Text('${testModel.multi(testModel.increaseVal, 100)}', style: const TextStyle(
                color: Color(0xff000000),
                fontFamily: 'Pacifico',
                fontSize: 40
            ),),
            const SizedBox(height: 30,),
            SizedBox(
              height: size.height * 0.05,
              width: size.width * 0.7,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(getColor)
                ),
                  onPressed: (){
                    setState(() {
                      testModel.increase();
                    });
                  },
                  child: const Text('Increase',
                    style: TextStyle(color: Colors.white,fontSize: 20),)),
            )
          ],
        ),
      ),
    );
  }
}
