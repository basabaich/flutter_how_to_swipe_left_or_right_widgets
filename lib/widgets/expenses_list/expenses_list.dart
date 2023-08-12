//
//File: expenses_list.dart in "Lib/widgets/expenses_list" folder.
//
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
//We also need to import the "expense.dart" file from the "models" folder
//as we are calling the "type" of class "Expense" in this "ExpensesList"
//class also.
import '../../../../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });
  //
  //
  final List<Expense> expenses;
  //
  //
  final void Function(Expense expense) onRemoveExpense;
  //We defined this above Function to be used from "expenses.dart". However,
  //please note that the word "function" will start with a caps i.e. "Function"
  //if we write this starting a small letter, then it will report an error.
  //
  //
  @override
  Widget build(BuildContext context) {
    //
    //while "returning" the build widget, we can use the "return Column()".
    //But, we will not use "Column()" widget here as the data inputted by
    //teh user may be very large and for large data if it gets created at
    //the begining, during loading of the application, there will be
    //performance issues. Moreover there is no integrated "Scroll bar" or
    //the data can not be scrollable.
    //
    //So, we will use "ListView()" widget as this widget will not have any
    //performance issue with it and will be scrollable automatically, when
    //data exceeds.
    //
    //However, here we will use "ListView.builder()"widget as though the
    //"ListView()" widget is automatically building a scrollable item list
    //but all the items are not updated in the application at a time. So there
    //may be some issues where data are more and to get the data in the screen
    //it may take some time.
    //In case of "ListView.builder()"widget all the data will be built based
    //on scrolling of the screen. more difference you can read from Google
    //on this topic.
    //
    //
    //##############################################################
    //HOW to swipe left or right : JUST USE "Dismissable()" widget as below
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        //We have to use a key for the "ValueKey()" so that it understands
        //which value it has to delete / swipe / remove from the list. We used
        //here the "expenses[index]" which will help the "ValueKey()" to under
        //stand which item it has to remove from the list.
        onDismissed: (direction) {
          onRemoveExpense(
            expenses[index],
          );
        },
        //This function will associate with the index which is being removed
        //from the list & identify the data associated with this index & will
        //also remove the data.
        //For this we need to go to the "expenses.dart" file where we
        //added new data addition method i.e. "_addExpense()" and after that
        //we need to add another function for "onDismissed". However, we are
        //basically ignoring the direction of swipe here but we are identifying
        //which index will be removed from our data.
        //
        child: ExpenseItem(expenses[index]),
        //For child parameters we need to use the ExpenseItem with it's index
      ), //Dismissable
      //
      //###############################################################
      //The "ListView.builder()" has many variables. The most important ones
      //are "itemBuilder" & "itemCount".
      //An unknown variable is passed on for the "itemBuilder". Here it is
      //"ctx". This will take different values starting from "0". So we have
      //put another variable which is called "index".
      //We can write the above itemBuilder widget as below two ways:-
      //(1) itemBuilder:(ctx, index)=> Text()
      //(2) itemBuilder:(ctx, index) {Text()}
      //Both will work.
      //Here the Text box will roll to different data based on the index &
      //display it. But here it will only show the differnt "title" data.
      //
    ); //ListView.builder
  }
}
