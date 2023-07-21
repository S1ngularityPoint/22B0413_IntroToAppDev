import 'package:flutter/material.dart';
import 'package:budgettrack/Item.dart';
import 'sum.dart';
List<item> expenses=[item(text:'Groceries',value:'-300'),item(text:'Bills',value:'-1000'),item(text:'Salary',value:'50000') ];
final TextEditingController textController = TextEditingController();
final TextEditingController valueController = TextEditingController();
int updatedsum=sumList(expenses);
void main() {
  runApp(MaterialApp(home:MyHomePage()));
}



class MyHomePage extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;




  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.purple[200],
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Budget Tracker',style:TextStyle(color:Colors.purple[500])),
        centerTitle: true,
        elevation: 0.0,

      ),
      backgroundColor: Colors.purple[200],
      body: Center(

        child: Column(

          children: <Widget>[
            Icon(Icons.person, size:200.0 ),
            Text('Welcome',
                style:TextStyle(fontSize:30),
                textAlign:TextAlign.center
            ),
            Text('Back',
                style:TextStyle(fontSize:30),
                textAlign:TextAlign.center
            ),
            SizedBox(height:30),
            TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.white,),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondRoute()),);

              },
              child:Text('Expenses: \t $updatedsum'),
              )




          ]




        ),

      ),
       

    );
  }
}


class SecondRoute extends StatefulWidget {
  const SecondRoute({super.key});

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {

  int updatedsum=sumList(expenses);

Widget itemTemplate(item){
  return
    Container(

    padding: EdgeInsets.all(10),

    child:   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children:<Widget>[

    TextButton(
      onPressed: (){},
      child:Text('${(item.text)} : \t ${(item.value)}'),
      style: TextButton.styleFrom(
        primary: Colors.black,
        backgroundColor: Colors.white,),


    ),
      SizedBox(width:100),
      FloatingActionButton
        (onPressed:(){

          expenses.remove(item);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecondRoute()),);
          },
        child: const Icon(Icons.delete),
      )

    ]

    )
  );


}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.purple[200],
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Budget Tracker',style:TextStyle(color:Colors.purple[500])),
        centerTitle: true,
        elevation: 0.0,

      ),
      backgroundColor: Colors.purple[200],
    body: Center(
      child: Column(
      children:<Widget>

       [ TextButton(

          onPressed: (){},
        child:Text('Total Expenses : $updatedsum'),
        style: TextButton.styleFrom(
          primary: Colors.black,
          backgroundColor: Colors.white,),),
         Column(
        children: expenses.map((item)=>itemTemplate(item)).toList()),
       FloatingActionButton(onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyCustomForm()),);

      },
        child: const Icon(Icons.add),
      )
      ]

      )






    ),



    );


  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Colors.purple[200],
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Budget Tracker',style:TextStyle(color:Colors.purple[500])),
          centerTitle: true,
          elevation: 0.0,

        ),
        backgroundColor: Colors.purple[200],
    body:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: textController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter expense',

            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: valueController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter value',

            ),
          ),
        ),
        FloatingActionButton(
            child: const Icon(Icons.check),
            onPressed: (){
          expenses.add(item (text:textController.text ,value: valueController.text ));
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecondRoute()),);

        })
  ]
            )
    );
  }
}