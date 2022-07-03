import 'package:flutter/material.dart';
import 'package:untitled/core/view_model/commun_select_model.dart';
import 'package:untitled/view/Widget/custom_Button.dart';

// ignore: must_be_immutable
class CheckoutViewWidget extends StatefulWidget {
  CheckoutViewWidget({Key? key, @required this.totalPrice}) : super(key: key);
  double? totalPrice;
  @override
  _PasswordResetWidget createState() => _PasswordResetWidget();
}

class _PasswordResetWidget extends State<CheckoutViewWidget> {
  List<CommunSelectModel> tabList = [
    CommunSelectModel('Delivery', true),
    CommunSelectModel('Address', false),
    CommunSelectModel('Payments', false),
  ];
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();
  TextEditingController textEditingController5 = TextEditingController();

  int radioButtonIndex = 0;
  int steps = 0;
  int steps2 = 0;
  @override
  void initState() {
    super.initState();
    textEditingController1.text = 'Smart Village';
    textEditingController2.text = 'Siliconwaha';
    textEditingController3.text = 'New Assiut';
    textEditingController4.text = 'Assiut';
    textEditingController5.text = 'Egypt';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: (steps == 0)
            ? Container(
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.bottomRight,
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), offset: const Offset(0, 4), blurRadius: 10.0)],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: CustomButton(
                    onPressed: () {
                      steps++;
                      tabList.map((e) => e.selected = false).toList();
                      tabList.elementAt(1).selected = true;
                      setState(() {});
                    },
                    color: Colors.green,
                    txt: "Next",
                  ),
                ),
              )
            : (steps == 1)
                ? Container(
                    padding: const EdgeInsets.all(20.0),
                    alignment: Alignment.bottomRight,
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), offset: const Offset(0, 4), blurRadius: 10.0)],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      children: [
                        Radio(
                          value: 0,
                          groupValue: 0,
                          activeColor: Colors.green,
                          onChanged: (value) {},
                        ),
                        Text(
                          'Save new address',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(width: 20.0),
                        Expanded(
                          child: CustomButton(
                            onPressed: () {
                             steps++;
                              tabList.map((e) => e.selected = false).toList();
                              tabList.elementAt(2).selected = true;
                              setState(() {});
                  
                            },
                            color: Colors.green,
                            txt: "Next",
                          ),
                        ),
                      ],
                    ),
                  )
                : (steps == 2)
                    ? Container(
                        padding: const EdgeInsets.all(20.0),
                        alignment: Alignment.bottomRight,
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), offset: const Offset(0, 4), blurRadius: 10.0)],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          children: [
                            Radio(
                              value: 0,
                              groupValue: 0,
                              activeColor: Colors.green,
                              onChanged: (value) {},
                            ),
                            Text(
                              'Save new card',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            const SizedBox(width: 20.0),
                            Expanded(
                              child: CustomButton(
                                onPressed: () {
                                  steps++;
                                  setState(() {});
                                },
                                color: Colors.green,
                                txt: "Next",
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.all(20.0),
                        alignment: Alignment.bottomRight,
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), offset: const Offset(0, 4), blurRadius: 10.0)],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                onPressed: () {
                                  setState(() => steps--);
                                },
                                shape: const StadiumBorder(side: BorderSide(color: Colors.grey, width: 1.0)),
                                color: Colors.transparent,
                                textColor: Colors.black,
                                txt: "Back",
                              ),
                            ),
                            const SizedBox(width: 20.0),
                            Expanded(
                              child: CustomButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                color: Colors.green,
                                txt: "Pay",
                              ),
                            ),
                          ],
                        ),
                      ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Row(
            children: [
              IconButton(
                splashRadius: 25.0,
                onPressed: () {
                  if (steps == 0) Navigator.of(context).pop();
                  if (steps > 0) {
                    steps--;
                    tabList.map((e) => e.selected = false).toList();
                    tabList.elementAt(steps).selected = true;
                    setState(() {});
                  }
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 20.0,
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Text(
                  steps == 0
                      ? "Checkout"
                      : steps == 1
                          ? 'Address'
                          : steps == 1
                              ? 'Payment'
                              : 'Summary',
                  style: const TextStyle(color: Colors.black, fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: (steps == 0)
              ? widget1()
              : (steps == 1)
                  ? widget2()
                  : steps == 2
                      ? widget3()
                      : widget4(),
        ),
      );
  Widget widget1() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100.0), bottomRight: Radius.circular(100.0)),
            ),
            child: Center(
              child: Wrap(
                spacing: 6.0,
                runSpacing: 6.0,
                children: List.generate(tabList.length, (index) {
                  CommunSelectModel communSelectModel = tabList.elementAt(index);
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: communSelectModel.selected == true ? Colors.green : Colors.transparent,
                            borderRadius: BorderRadius.circular(100.0),
                            border: communSelectModel.selected == true ? null : Border.all(color: Colors.green, width: 1.0)),
                        child: Icon(
                          index == 0
                              ? Icons.delivery_dining
                              : index == 1
                                  ? Icons.home
                                  : Icons.file_copy,
                          size: 24,
                          color: communSelectModel.selected == true ? Colors.white : Colors.green,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        communSelectModel.name.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), offset: const Offset(0, 4), blurRadius: 10.0)],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Standar delivery',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Order will be delivered between',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Radio(
                    value: radioButtonIndex,
                    groupValue: 0,
                    activeColor: Colors.green,
                    onChanged: (value) => setState(() => radioButtonIndex = 0),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), offset: const Offset(0, 4), blurRadius: 10.0)],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'Next day delivery',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      '8.00 EGP',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Order will be delivered between',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Radio(
                    value: radioButtonIndex,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (value) => setState(() => radioButtonIndex = 1),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), offset: const Offset(0, 4), blurRadius: 10.0)],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'Saturday delivery',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      '20.00 EGP',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Order will be delivered between',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Radio(
                    value: radioButtonIndex,
                    groupValue: 2,
                    activeColor: Colors.green,
                    onChanged: (value) => setState(() => radioButtonIndex = 2),
                  ),
                )
              ],
            ),
          ),
        ],
      );

  Widget widget2() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100.0), bottomRight: Radius.circular(100.0)),
            ),
            child: Center(
              child: Wrap(
                spacing: 6.0,
                runSpacing: 6.0,
                children: List.generate(tabList.length, (index) {
                  CommunSelectModel communSelectModel = tabList.elementAt(index);
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: communSelectModel.selected == true ? Colors.green : Colors.transparent,
                            borderRadius: BorderRadius.circular(100.0),
                            border: communSelectModel.selected == true ? null : Border.all(color: Colors.green, width: 1.0)),
                        child: Icon(
                          index == 0
                              ? Icons.delivery_dining
                              : index == 1
                                  ? Icons.home
                                  : Icons.file_copy,
                          size: 24,
                          color: communSelectModel.selected == true ? Colors.white : Colors.green,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        communSelectModel.name.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), offset: const Offset(0, 4), blurRadius: 10.0)],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: textEditingController1,
                  keyboardType: TextInputType.text,
                  style: Theme.of(context).textTheme.headline6,
                  onChanged: (String value) {},
                  decoration: InputDecoration(
                    labelText: "Street 1",
                    labelStyle: Theme.of(context).textTheme.headline6,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: textEditingController2,
                  keyboardType: TextInputType.text,
                  style: Theme.of(context).textTheme.headline6,
                  onChanged: (String value) {},
                  decoration: InputDecoration(
                    labelText: "Street 2",
                    labelStyle: Theme.of(context).textTheme.headline6,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: textEditingController3,
                  keyboardType: TextInputType.text,
                  style: Theme.of(context).textTheme.headline6,
                  onChanged: (String value) {},
                  decoration: InputDecoration(
                    labelText: "City",
                    labelStyle: Theme.of(context).textTheme.headline6,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textEditingController4,
                        keyboardType: TextInputType.text,
                        style: Theme.of(context).textTheme.headline6,
                        onChanged: (String value) {},
                        decoration: InputDecoration(
                          labelText: "State",
                          labelStyle: Theme.of(context).textTheme.headline6,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        controller: textEditingController5,
                        keyboardType: TextInputType.text,
                        style: Theme.of(context).textTheme.headline6,
                        onChanged: (String value) {},
                        decoration: InputDecoration(
                          labelText: "Country",
                          labelStyle: Theme.of(context).textTheme.headline6,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      );

  Widget widget3() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100.0), bottomRight: Radius.circular(100.0)),
            ),
            child: Center(
              child: Wrap(
                spacing: 6.0,
                runSpacing: 6.0,
                children: List.generate(tabList.length, (index) {
                  CommunSelectModel communSelectModel = tabList.elementAt(index);
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: communSelectModel.selected == true ? Colors.green : Colors.transparent,
                            borderRadius: BorderRadius.circular(100.0),
                            border: communSelectModel.selected == true ? null : Border.all(color: Colors.green, width: 1.0)),
                        child: Icon(
                          index == 0
                              ? Icons.delivery_dining
                              : index == 1
                                  ? Icons.home
                                  : Icons.file_copy,
                          size: 24,
                          color: communSelectModel.selected == true ? Colors.white : Colors.green,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        communSelectModel.name.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.1), offset: const Offset(0, 4), blurRadius: 10.0),
              ],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: (steps2 == 0)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: TextEditingController(text: 'Omar Nasr'),
                        keyboardType: TextInputType.text,
                        style: Theme.of(context).textTheme.headline6,
                        onChanged: (String value) {},
                        decoration: InputDecoration(
                          labelText: "Name on card",
                          labelStyle: Theme.of(context).textTheme.headline6,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          TextField(
                            controller: TextEditingController(text: '4560  5674  3224 4543'),
                            keyboardType: TextInputType.text,
                            style: Theme.of(context).textTheme.headline6,
                            onChanged: (String value) {},
                            decoration: InputDecoration(
                              labelText: "Card number",
                              labelStyle: Theme.of(context).textTheme.headline6,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                          Image.network(
                            'https://brandlogos.net/wp-content/uploads/2021/11/mastercard-logo.png',
                            height: 40.0,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: TextEditingController(text: '09 / 24'),
                              keyboardType: TextInputType.text,
                              style: Theme.of(context).textTheme.headline6,
                              onChanged: (String value) {},
                              decoration: InputDecoration(
                                labelText: "Expiry Date",
                                labelStyle: Theme.of(context).textTheme.headline6,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                                  ),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: TextField(
                              controller: TextEditingController(text: 'CVV'),
                              keyboardType: TextInputType.text,
                              style: Theme.of(context).textTheme.headline6,
                              onChanged: (String value) {},
                              decoration: InputDecoration(
                                labelText: "667",
                                labelStyle: Theme.of(context).textTheme.headline6,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                                  ),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                : (steps2 == 1)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://adyen.getbynder.com/m/154a0fe6e69be1b9/webimage-pmx-logo-fawry.jpg',
                                  height: 60,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const Icon(Icons.more_horiz, size: 25, color: Colors.green)
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            'Omar@yahoo.com',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            'Added on 15/02/2022',
                            style: TextStyle(color: Colors.grey.withOpacity(0.5)),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Cash on delivery',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Pay once you got order at home',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Radio(
                              value: 0,
                              groupValue: 0,
                              activeColor: Colors.green,
                              onChanged: (value) {},
                            ),
                          )
                        ],
                      ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100.0), bottomRight: Radius.circular(100.0)),
            ),
            child: Center(
              child: Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => steps2 = 0),
                    child: Container(
                      height: 60,
                      width: 80,
                      decoration: BoxDecoration(
                        color: steps2 == 0 ? Colors.green : Colors.white,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Icon(
                        Icons.credit_card,
                        size: 24,
                        color: steps2 == 0 ? Colors.white : Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => steps2 = 1),
                    child: Container(
                      height: 60,
                      width: 80,
                      decoration: BoxDecoration(
                        color: steps2 == 1 ? Colors.green : Colors.white,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Icon(
                        Icons.public,
                        size: 24,
                        color: steps2 == 1 ? Colors.white : Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => steps2 = 2),
                    child: Container(
                      height: 60,
                      width: 80,
                      decoration: BoxDecoration(
                        color: steps2 == 2 ? Colors.green : Colors.white,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Icon(
                        Icons.account_balance_wallet_sharp,
                        size: 24,
                        color: steps2 == 2 ? Colors.white : Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );

  Widget widget4() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Shipping address',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Siliconwaha',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Smart Village',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Radio(
                      value: 0,
                      groupValue: 0,
                      activeColor: Colors.green,
                      onChanged: (value) {},
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'New assiut, Assiut, Egypt',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Change',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Payment',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Image.network(
                      'https://brandlogos.net/wp-content/uploads/2021/11/mastercard-logo.png',
                      height: 40.0,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Master card',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black38,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '****  ****  ****  4543',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Radio(
                      value: 0,
                      groupValue: 0,
                      activeColor: Colors.green,
                      onChanged: (value) {},
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Change',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
