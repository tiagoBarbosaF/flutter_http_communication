import 'package:flutter/material.dart';
import 'package:mybank/components/progress.dart';
import 'package:mybank/database/dao/contact_dao.dart';
import 'package:mybank/models/contact.dart';
import 'package:mybank/screens/contact_form.dart';
import 'package:mybank/screens/transaction_form.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final ContactDao _contactDao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: const [],
        future: _contactDao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return const Progress(message: "Sending ...");
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data as List<Contact>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = contacts[index];
                  return _ContactItem(
                    contact,
                    onClick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => TransactionForm(contact)),
                      );
                    },
                  );
                },
                itemCount: contacts.length,
              );
          }
          return const Text('Unknow error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => const ContactForm(),
                ),
              )
              .then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;
  final Function onClick;

  const _ContactItem(this.contact, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
        // leading: Icon(Icons.person,
            // size: 40, color: Theme.of(context).colorScheme.primary),
        title: Text(
          contact.fullName,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Account Number: ${contact.accountNumber.toString()}',
            style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
