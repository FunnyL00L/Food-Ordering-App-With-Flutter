// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Metode Pembayaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Pilih metode pembayaran yang Anda inginkan:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            PaymentMethodButton(
              icon: 'assets/briva_logo.png', // Pastikan Anda memiliki asset ini
              label: 'BRIVA',
              onPressed: () => _handlePayment(context, 'BRIVA'),
            ),
            const SizedBox(height: 10),
            PaymentMethodButton(
              icon: 'assets/bca_logo.png', // Pastikan Anda memiliki asset ini
              label: 'BCA',
              onPressed: () => _handlePayment(context, 'BCA'),
            ),
            const SizedBox(height: 10),
            PaymentMethodButton(
              icon: 'assets/mandiri_logo.png', // Pastikan Anda memiliki asset ini
              label: 'Mandiri',
              onPressed: () => _handlePayment(context, 'Mandiri'),
            ),
            const SizedBox(height: 10),
            PaymentMethodButton(
              icon: Icons.money,
              label: 'Cash',
              onPressed: () => _handlePayment(context, 'Cash'),
            ),
          ],
        ),
      ),
    );
  }

  void _handlePayment(BuildContext context, String method) {
    // Implementasi logika pembayaran di sini
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Pembayaran dengan $method dipilih')),
    );
    // Tambahkan logika untuk memproses pembayaran atau navigasi ke halaman konfirmasi
  }
}

class PaymentMethodButton extends StatelessWidget {
  final dynamic icon;
  final String label;
  final VoidCallback onPressed;

  const PaymentMethodButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon is IconData
              ? Icon(icon as IconData, size: 24)
              : Image.asset(icon as String, width: 24, height: 24),
          const SizedBox(width: 10),
          Text(label, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}