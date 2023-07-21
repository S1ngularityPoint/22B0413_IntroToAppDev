import 'package:budgettrack/Item.dart';

int  sumList(List<item> expenses) {
   int totalCost = 0;
   for (var i in expenses)
 {
    totalCost=totalCost+int.parse(i.value) ;

 }
    return totalCost;
 }

