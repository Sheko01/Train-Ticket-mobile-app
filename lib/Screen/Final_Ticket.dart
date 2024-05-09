import 'package:page_transition/page_transition.dart';

// import '../User_ticket.dart';
import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:train_ticket/generated/l10n.dart';
import '../Const.dart';
import 'NavBar.dart';
import './../model/tickets.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketWideget extends StatefulWidget {
  final Tickets ticket;
  TicketWideget(this.ticket, {super.key});

  @override
  State<TicketWideget> createState() => _TicketWidegetState();
}

class _TicketWidegetState extends State<TicketWideget> {
  late Tickets ticket;

  @override
  void initState() {
    super.initState();
    ticket = widget.ticket;
  }

  String getQrData(Tickets ticket) {
    return '''
Ticket ID: ${ticket.id},
From: ${ticket.from},
To: ${ticket.to},
Class: ${ticket.trainClass},
Passengers: ${ticket.adultNum} Adults, ${ticket.childNum} Children,
Price: ${ticket.price}
''';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          S.of(context).ticket,
          style: TextStyle(color: Colors.grey[200]),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageTransition(
                  child: MyHomePage(currentIndex: 0),
                  type: PageTransitionType.fade),
            );
          },
          icon: Icon(
            Icons.home,
            color: Colors.grey[200],
          ),
        ),
      ),
      backgroundColor: Scolor,
      body: SingleChildScrollView(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TicketWidget(
              width: 380,
              height: 700,
              isCornerRounded: true,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).departd,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 139, 139, 139),
                              fontSize: 18),
                        ),
                        Text(
                          ticket.departDate!,
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).returnd,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 139, 139, 139),
                              fontSize: 18),
                        ),
                        Text(ticket.returnDate!,
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).from,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 139, 139, 139),
                              fontSize: 18),
                        ),
                        Text(
                          S.of(context).to,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 139, 139, 139),
                              fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(ticket.from!,
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold)),
                        Text(ticket.to!,
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).classs,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 139, 139, 139),
                              fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(ticket.trainClass!,
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).passenger,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 139, 139, 139),
                              fontSize: 18),
                        ),
                        Text(
                          S.of(context).baggage,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 139, 139, 139),
                              fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "${ticket.adultNum} ${S.of(context).adult} , ${ticket.childNum} ${S.of(context).child}",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold)),
                        Text("15 ${S.of(context).kg}",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 50),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).price,
                            style: TextStyle(
                                color: const Color.fromARGB(255, 139, 139, 139),
                                fontSize: 18),
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ticket.price.toString(),
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                        ]),
                    Divider(
                      color: Colors.grey,
                      thickness: 2,
                    ),
                    SizedBox(
                        height:
                            20), // Adjust the height value as needed to increase or decrease the space
                    Center(
                      child: QrImageView(
                        data: getQrData(ticket),
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
// }
}
