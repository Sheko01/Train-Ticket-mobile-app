import 'package:flutter/material.dart';
import 'package:train_ticket/generated/l10n.dart';
import './../model/tickets.dart';
import 'package:intl/intl.dart';
import '../ComboBox.dart';
import '../date_time.dart';
import '../Const.dart';
import '../counter.dart';
import 'Final_Ticket.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Ticket extends StatefulWidget {
  const Ticket({Key? key}) : super(key: key);
  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  bool oneWaySelected = true;
  bool roundedTripSelected = false;
  String? selectedFrom;
  String? selectedTo;
  String? departDate;
  String? returnDate;
  int adultCount = 0;
  int childCount = 0;
  String? trainClass;
  // List selectedItems = [];
  List<Tickets> tickets = [];
  double? price;
  Future<void> addTicket({required Tickets ticket}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwtToken = prefs.getString('jwtToken'); // Get the saved JWT token
    try {
      var url = Uri.parse('https://train-ticket-00vr.onrender.com/api/v1/tours');

      print(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwtToken',
      };
      var response = await http.post(url,
          body: jsonEncode({
            "source": ticket.from,
            "destination": ticket.to,
            "date": ticket.departDate,
            "returnDate": ticket.returnDate,
            "trainClass": ticket.trainClass,
            "adultNum": ticket.adultNum,
            "childNum": ticket.childNum,
            "price": ticket.price,
          }),
          headers: headers);
      print(response.body);

      // var jsonData = jsonDecode(response.body);
      var responseData = jsonDecode(response.body);
      String? newTicketId = responseData['data']['tour']['_id'];
      var response2 = await http.patch(
          Uri.parse(
              'https://train-ticket-00vr.onrender.com/api/v1/users/addTour/${newTicketId}'),
          headers: headers);
      print(response2.body);
  
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  bool _validateInputs() {
    if (selectedFrom == null ||
        selectedTo == null ||
        departDate == null ||
        (roundedTripSelected && returnDate == null) ||
        adultCount == 0 ||
        trainClass == null) {
      return false;
    }
    if ((roundedTripSelected == false && returnDate == null)) {
      returnDate = "---";
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Scolor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.transparent,
          ),
          onPressed: () {},
        ),
        title: Text(
          S.of(context).bookyourtickettoday,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
              child: Container(
                width: size.width - 10,
                height: 600,
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey[100]),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  oneWaySelected = true;
                                  roundedTripSelected = false;
                                });
                                print(S.of(context).oneway);
                              },
                              child: Text(
                                S.of(context).oneway,
                                style: TextStyle(
                                    color: oneWaySelected
                                        ? Colors.white
                                        : Colors.grey[600],
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    oneWaySelected ? Pcolor : Colors.grey[300]),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  oneWaySelected = false;
                                  roundedTripSelected = true;
                                });
                                print(S.of(context).roundedtrip);
                              },
                              child: Text(
                                S.of(context).roundedtrip,
                                style: TextStyle(
                                  color: roundedTripSelected
                                      ? Colors.white
                                      : Colors.grey[600],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    roundedTripSelected
                                        ? Pcolor
                                        : Colors.grey[300]),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ComboBox(
                        items: [
                          S.of(context).alexandria,
                          S.of(context).tanta,
                          S.of(context).cairo,
                          S.of(context).benisuef,
                          S.of(context).minya,
                          S.of(context).assiut,
                          S.of(context).sohag,
                          S.of(context).luxor,
                          S.of(context).aswan
                        ],
                        Hint_name: S.of(context).from,
                        onChanged: (value) {
                          setState(() {
                            // selectedItems.removeWhere((item) =>
                            //     item ==
                            //     value); // Remove any existing instances of the value
                            // selectedItems.add(value!); // Add the new value
                            selectedFrom = value;
                          });
                        },
                      ),
                      ComboBox(
                        items: [
                          S.of(context).alexandria,
                          S.of(context).tanta,
                          S.of(context).cairo,
                          S.of(context).benisuef,
                          S.of(context).minya,
                          S.of(context).assiut,
                          S.of(context).sohag,
                          S.of(context).luxor,
                          S.of(context).aswan
                        ],
                        Hint_name: S.of(context).to,
                        onChanged: (value) {
                          setState(() {
                            // selectedItems.removeWhere((item) =>
                            //     item ==
                            //     value); // Remove any existing instances of the value
                            // selectedItems.add(value!); // Add the new value
                            selectedTo = value;
                          });
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Date(
                            Date_name: S.of(context).departd,
                            size: roundedTripSelected
                                ? size.width / 2 - 25
                                : size.width - 25,
                            onDateChanged: (date) {
                              setState(() {
                                String formattedDate =
                                    DateFormat('dd MMMM yyyy').format(date!);
                                departDate = formattedDate;
                              });
                            },
                          ),
                          roundedTripSelected
                              ? Row(
                                  children: [
                                    SizedBox(
                                      child: Icon(Icons.minimize_outlined),
                                    ),
                                    Date(
                                      Date_name: S.of(context).returnd,
                                      size: size.width / 2 - 25,
                                      onDateChanged: (date) {
                                        setState(() {
                                          String formattedDate =
                                              DateFormat('dd MMMM yyyy')
                                                  .format(date!);
                                          returnDate = formattedDate;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                      Text(
                        S.of(context).passenger,
                        style: TextStyle(fontSize: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Counter(
                            PType: S.of(context).adult,
                            onValueChanged: (value) {
                              setState(() {
                                adultCount = value;
                              });
                            },
                          ),
                          Counter(
                            PType: S.of(context).child,
                            onValueChanged: (value) {
                              setState(() {
                                childCount = value;
                              });
                            },
                          ),
                        ],
                      ),
                      ComboBox(
                        Hint_name: S.of(context).trainclasses,
                        items: [
                          S.of(context).businessclass,
                          S.of(context).secondclass,
                          S.of(context).economyclass
                        ],
                        onChanged: (value) {
                          setState(() {
                            // selectedItems.removeWhere((item) =>
                            //     item ==
                            //     value); // Remove any existing instances of the value
                            // selectedItems.add(value!); // Add the new value
                            trainClass = value;
                          });
                        },
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Pcolor)),
                        onPressed: () {
                          if (_validateInputs()) {
                            // All inputs are valid, proceed with booking
                            // selectedItems.add(departDate);
                            // selectedItems.add(returnDate);

                            price = (adultCount * 100) + (childCount * 50);
                            Tickets newTicket = Tickets.withoutId(
                              from: selectedFrom,
                              to: selectedTo,
                              departDate: departDate,
                              returnDate: returnDate,
                              trainClass: trainClass,
                              adultNum: adultCount,
                              childNum: childCount,
                              price: price,
                            );
                            addTicket(ticket: newTicket);
                            // tickets.add(newTicket);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TicketWideget(newTicket),
                              ),
                            );
                          } else {
                            // Show alert dialog for missing inputs
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(S.of(context).mi),
                                  content: Text(S.of(context).pfiarf),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text(S.of(context).ok),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 120, vertical: 15),
                          child: Text(
                            S.of(context).book,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
