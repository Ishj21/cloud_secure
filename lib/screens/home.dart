import 'package:cloud_secure/components/green_button.dart';
import 'package:cloud_secure/models/encrypt_data_model.dart';
import 'package:cloud_secure/services/encrypt_data_crud.dart';
import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:crypton/crypton.dart';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:pointycastle/asymmetric/api.dart' as ass;

import '../components/custom_text_box.dart';

String? encrypted = "";
String decrypted = "";
RSAKeypair rsaKeypair = RSAKeypair.fromRandom();

class Home extends StatelessWidget {
  Home({super.key});
  final plainTextController = TextEditingController();
  final EncryptedTextController = TextEditingController();
  final DecryptedTextController = TextEditingController();

  Future<String> encryptData(String plainText) async {
    encrypted = rsaKeypair.publicKey.encrypt(plainText);
    print(rsaKeypair.publicKey);
    print(rsaKeypair.privateKey);
    print("\n\n\n\n\n");
    print("\n\n\n\n\n");
    return encrypted!;
  }

  Future<String> decryptData(String plainText) async {
    print(rsaKeypair.publicKey);
    print("\n\n\n\n\n");
    print(rsaKeypair.privateKey);
    print("\n\n\n\n\n");
    decrypted = rsaKeypair.privateKey.decrypt(plainText);
    return decrypted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(10, 101, 90, 1),
        centerTitle: true,
        title: const Text('CLOUD ENCRYPTION DEMO',
            style: TextStyle(
              color: Colors.white,
            )),
      ),
      backgroundColor: const Color.fromRGBO(139, 191, 185, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                CustomTextBox(
                  title: 'Enter Plain Text',
                  textEditingController: plainTextController,
                ),
                const SizedBox(
                  height: 15,
                ),
                GreenButton(
                  title: 'Encrypt Data',
                  onPressed: () async {
                    // Item? item;
                    // item!.encryptedData = encryptedData!;

                    String encryptedData =
                        await encryptData(plainTextController.text);
                    EncryptedTextController.text = encryptedData;
                    print(encryptedData);
                    Item item = Item(id: '1', encryptedData: encryptedData);
                    EncryptDataServices().sendData(item);
                    setState() {}
                  },
                ),
                CustomTextBox(
                  title: 'Encrypted Text Sent: ',
                  textEditingController: EncryptedTextController,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextBox(
                  title: 'Data Received without Decryption: ',
                  textEditingController: EncryptedTextController,
                ),
                CustomTextBox(
                  title: 'Data Received after Decryption: ',
                  textEditingController: DecryptedTextController,
                ),
                const SizedBox(
                  height: 15,
                ),
                GreenButton(
                  title: 'Get Data',
                  onPressed: () async {
                    Item? item = await EncryptDataServices().getEncryptedData();
                    print((item?.encryptedData).toString());
                    String decryptedData =
                        await decryptData((item?.encryptedData).toString());
                    DecryptedTextController.text = decryptedData;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
