import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:page_transition/page_transition.dart';
import 'package:train_ticket/generated/l10n.dart';
import 'Final_Ticket.dart';
import '../Const.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import './../model/tickets.dart';

typedef RemoveTicketCallback = void Function(Tickets ticket);

class Home extends StatefulWidget {
  //  final Tickets ticket;
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Tickets> tickets = [];

  @override
  void initState() {
    super.initState();
    getTours();
  }

  Future<void> getTours() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwtToken = prefs.getString('jwtToken'); // Get the saved JWT token
    try {
      var url = Uri.parse(
          'https://train-ticket-00vr.onrender.com/api/v1/users/myTours');
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwtToken',
      };
      var response = await http.get(url, headers: headers);
      print(response.body);
      var jsonData = jsonDecode(response.body);
      setState(() {
        for (var eachTeam in jsonData['data']['tours']) {
          final ticket = Tickets(
            id: eachTeam['_id'],
            from: eachTeam['source'],
            to: eachTeam['destination'],
            departDate: eachTeam['date'],
            returnDate: eachTeam['returnDate'],
            trainClass: eachTeam['trainClass'],
            adultNum: eachTeam['adultNum'] * 1,
            childNum: eachTeam['childNum'] * 1,
            price: eachTeam['price'] * 1.0,
          );
          tickets.add(ticket);
        }
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Future<void> deleteTicket({required String id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwtToken = prefs.getString('jwtToken'); // Get the saved JWT token
    try {
      var url = Uri.parse(
          'https://train-ticket-00vr.onrender.com/api/v1/users/myTours/${id}');
      var url2 = Uri.parse(
          'https://train-ticket-00vr.onrender.com/api/v1/tours/${id}');
      print(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwtToken',
      };
      var response = await http.patch(url, headers: headers);
      var response2 = await http.delete(url2, headers: headers);
      print(response.body);
      print(response2.body);
      // var jsonData = jsonDecode(response.body);
      setState(() {
        // getTours();
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Scolor,
      appBar: AppBar(
        shadowColor: Color.fromARGB(0, 194, 39, 39),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.transparent,
          ),
          onPressed: () {},
        ),
        centerTitle: true,
        title: Text(
          S.of(context).yourt,
          style: TextStyle(color: Colors.grey[200]),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: tickets.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200, // Set a fixed height for the container
                // child: ticketCard(context, tickets[index]),
                child: ticketCard(tickets[index], context, (ticketToRemove) {
                  setState(() {
                    tickets.remove(ticketToRemove);
                    deleteTicket(id: ticketToRemove.id.toString());
                  });
                }),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget ticketCard(Tickets ticket, BuildContext context,
    RemoveTicketCallback removeTicketCallback) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        PageTransition(
          child: TicketWideget(ticket),
          type: PageTransitionType.fade,
        ),
      );
    },
    child: Slidable(
      startActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              removeTicketCallback(ticket);
            },
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(40),
            backgroundColor: Colors.red,
          ),
        ],
      ),
      child: Container(
        height: 200,
        child: Card(
          elevation: 9,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: ListTile(
            dense: false,
            leading: Icon(
              Icons.airplane_ticket_sharp,
              size: 30,
              color: Pcolor,
            ),
            title: Text(
              S.of(context).ticket,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${S.of(context).from} ${ticket.from}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "${S.of(context).to} ${ticket.to}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${S.of(context).departd}: ${ticket.departDate}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${S.of(context).returnd}: ${ticket.returnDate}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${S.of(context).trainclasses} ${ticket.trainClass}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "${S.of(context).price}: ${ticket.price}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            backgroundColor: Colors.amber),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    ),
  );
}
