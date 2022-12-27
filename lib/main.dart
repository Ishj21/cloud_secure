import 'package:cloud_secure/screens/home.dart';
import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:cloud_secure/main.dart.';
import 'package:flutter/material.dart';

void main() async {
  // RSAPrivateKey? privKey = await parseKeyFromFile<RSAPrivateKey>(
  //     'F:/Study/College/VIT/SEM1/Research/cloud_secure/lib/keys/private.pem');
  // RSAPublicKey? publicKey = await parseKeyFromFile<RSAPublicKey>(
  //     'F:/Study/College/VIT/SEM1/Research/cloud_secure/lib/keys/public.pem');
  //
  // String plainText = 'test@agmail.com';
  // Encrypter encrypter;
  // Encrypted encrypted;
  // String decrypted;
  //
  // encrypter = Encrypter(
  //   RSA(
  //     publicKey: publicKey,
  //     privateKey: privKey,
  //     encoding: RSAEncoding.OAEP,
  //   ),
  // );
  //
  // encrypted = encrypter.encrypt(plainText);
  // decrypted = encrypter.decrypt(Encrypted.fromBase64(encrypted.base64));
  // print(encrypted.base64);
  // print("Decrypted Text: " + decrypted);
  // print(encrypted.bytes);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cloud Secure',
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.green,
      ),
      home: Home(),
    );
  }
}
