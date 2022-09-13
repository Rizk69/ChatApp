import 'package:flutter/material.dart';

import '../Componant/Componant.dart';

abstract class BaseNavigator {
  void showLoadingDialog({String message = 'Loading'});
  void hideLoadingDialog();
  void showMessageDialog(String message);
}
class BaseViewModel<Nav extends BaseNavigator> extends ChangeNotifier{
  Nav? navigator;
}
abstract class BaseState<T extends StatefulWidget,VM extends BaseViewModel>  extends State<T> implements BaseNavigator{

late VM viewModel;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel=initViewModel();
    viewModel.navigator=this;
  }
  VM initViewModel();
@override
void hideLoadingDialog() {
  hidden(context);

}

@override
void showLoadingDialog({String message = 'Loading'}) {
  showLoading(context, message);

}

@override
void showMessageDialog(String message) {
  showMassge(context, message, 'ok', () { hidden(context);});

}

}