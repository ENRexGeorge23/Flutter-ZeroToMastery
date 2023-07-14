import 'dart:io';

class Contact {
  String? name;
  String? phoneNumber;

  Contact(this.name, this.phoneNumber);
}

void main() {
  List<Contact> contacts = [];

  while (true) {
    stdout.write(
        'Enter what you want to do \n [1] Add contact \n [2] Show contacts \n [3] Delete contact \n');
    String input = stdin.readLineSync()!;
    int? choice = int.tryParse(input);

    if (choice == 1) {
      addContact(contacts);
    } else if (choice == 2) {
      showContacts(contacts);
    } else if (choice == 3) {
      deleteContact(contacts);
    } else {
      print('Invalid input. Please input 1 - 3 numbers only.');
    }
  }
}

void addContact(List<Contact> contacts) {
  stdout.write('Enter name: ');
  String? name = stdin.readLineSync();
  stdout.write('Enter phone number: ');
  String? phoneNumber = stdin.readLineSync();

  if (name != null && phoneNumber != null) {
    Contact contact = Contact(name, phoneNumber);
    contacts.add(contact);
    print('Contact added successfully.\n');
  } else {
    print('Invalid input. Contact not added.\n');
  }
}

void showContacts(List<Contact> contacts) {
  if (contacts.isEmpty) {
    print('No contacts found. Add some contacts.\n');
  } else {
    print('Contacts:');
    for (var i = 0; i < contacts.length; i++) {
      print('Index: $i');
      print('Name: ${contacts[i].name}');
      print('Phone Number: ${contacts[i].phoneNumber}');
      print('------------');
    }
    print('');
  }
}

void deleteContact(List<Contact> contacts) {
  if (contacts.isEmpty) {
    print('No contacts found. Add some contacts.\n');
  } else {
    showContacts(contacts);
    stdout.write('Enter index of contact to delete: ');
    String input = stdin.readLineSync()!;
    int? index = int.tryParse(input);

    if (index != null && index >= 0 && index < contacts.length) {
      contacts.removeAt(index);
      print('Contact deleted succesfully.\n');
    } else {
      print(
          'Invalid input. Please enter a number between 0 and ${contacts.length - 1}.\n');
    }
  }
}
