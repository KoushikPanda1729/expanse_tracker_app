import 'package:expensetracker/commons/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExpensePage extends StatelessWidget {
  const ExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.red100,
      body: Column(
        children: [
          const SizedBox(height: 50), // Adjust for status bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => {context.goNamed('home')}),

                const Text(
                  'Expense',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 48), // To balance the row
              ],
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('How much?',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Text('\$0',
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                _buildDropdownField('Category'),
                const SizedBox(height: 10),
                _buildTextField('Description'),
                const SizedBox(height: 10),
                _buildDropdownField('Wallet'),
                const SizedBox(height: 10),
                _buildAttachmentButton(),
                const SizedBox(height: 20),
                _buildRepeatToggle(),
                const SizedBox(height: 20),
                _buildContinueButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonFormField(
        decoration: const InputDecoration(border: InputBorder.none),
        hint: Text(hint),
        items: [],
        onChanged: (value) {},
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _buildAttachmentButton() {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.attachment, color: Colors.grey),
      label: const Text('Add attachment'),
    );
  }

  Widget _buildRepeatToggle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Repeat transaction', style: TextStyle(fontSize: 16)),
        Switch(value: false, onChanged: (value) {}),
      ],
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text('Continue',
              style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
      ),
    );
  }
}
