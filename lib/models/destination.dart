import 'package:flutter/material.dart';

class Destination {
  const Destination( this.id,this.icon, this.label);
  final int id;
  final IconData icon;
  final String label;

}

const List<Destination> destinations = <Destination>[
  Destination(0,Icons.chat_outlined, 'Chats'),
  Destination(1,Icons.bookmark, 'Bookmark'),
  Destination(2,Icons.people, 'Contacts'),
  Destination(3,Icons.email, 'Email'),
];