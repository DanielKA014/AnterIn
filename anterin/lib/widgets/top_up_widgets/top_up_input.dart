import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:anterin/services/balance_service.dart';
import 'package:go_router/go_router.dart';

class TopUpTextField extends StatefulWidget {
  const TopUpTextField({super.key});

  @override
  State<TopUpTextField> createState() => _TopUpTextFieldState();
}

class _TopUpTextFieldState extends State<TopUpTextField> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nominalController = TextEditingController();
  String _formValue = '';
  BalanceService service = BalanceService();

  @override
  void initState() {
    super.initState();
    setState(() {
      nominalController.clear();
      _formValue = '';
    });
  }

  void _saveForm() {
    final isValid = _formKey.currentState!.validate();
    print(_formValue);
    print(isValid);
    if (!isValid) {
      return;
    }
    _formValue = nominalController.text;
    service.addBalance(_formValue);
    nominalController.clear();
    _formValue = '';
    context.pushNamed('top-up-success');
  }

  String? _validationMessage(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nominal tidak boleh kosong!';
    }
    if ((int.parse(value) % 1000) != 0) {
      return 'Nominal top up harus berkelipatan 1.000!';
    }
    if ((int.parse(value) < 10000)) {
      return 'Nominal top up tidak boleh kurang dari Rp10.000!';
    }
    return null;
  }

  @override
  void dispose() {
    nominalController.dispose();
    super.dispose();
  }

  Widget button(String amount) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        foregroundColor: WidgetStatePropertyAll(Colors.black),
        shape: WidgetStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
        ),
      ),
      onPressed: () => setState(() {
        _formValue = amount;
        nominalController.text = amount;
        nominalController.selection = TextSelection.fromPosition(
          TextPosition(offset: nominalController.text.length),
        );
      }),
      child: Text('Rp$amount', style: TextStyle(fontSize: 15.0)),
    );
  }

  // PILIHAN NOMINAL
  Widget buttonChoices() {
    final size = MediaQuery.of(context).size;
    final buttonWidth = (size.width / 3) - 12.0;
    final buttonHeight = 64.0;
    final List<String> amounts = [
      '10000',
      '20000',
      '50000',
      '100000',
      '200000',
      '500000',
    ];
    return SizedBox(
      height: 160.0,
      child: SafeArea(
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: (buttonWidth / buttonHeight),
          children: List.generate(amounts.length, (index) {
            return button(amounts[index]);
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    BalanceService format = BalanceService();
    final nominalAmount = int.tryParse(nominalController.text) ?? 0;
    int fee = nominalAmount + 2000;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: _formKey,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.90,
            height: MediaQuery.of(context).size.height * 0.10,
            child: TextFormField(
              validator: _validationMessage,
              controller: nominalController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 32.0,
                  horizontal: 12.0,
                ),
                border: InputBorder.none,
                hintText: "Rp",
                filled: true,
                fillColor: const Color.fromARGB(44, 158, 158, 158),
              ),
              onChanged: (text) => setState(() => _formValue = text),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Biaya Admin : Rp2.000'),
              (fee < 12000)
                  ? Text('Total Biaya    : Rp-')
                  : Text('Total Biaya    : Rp${format.digitsFormater(fee)}'),
            ],
          ),
        ),
        Divider(),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16.0),
          child: const Text(
            'Atau Pilih Nominal Top Up',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        buttonChoices(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.3),
        Align(
          alignment: AlignmentGeometry.bottomCenter,
          child: ElevatedButton(
            onPressed: _saveForm,
            style: ButtonStyle(
              minimumSize: WidgetStatePropertyAll(
                Size(MediaQuery.of(context).size.width * 0.4, 52.0),
              ),
            ),
            child: const Text('Lanjutkan', style: TextStyle(fontSize: 18.0)),
          ),
        ),
      ],
    );
  }
}
