import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_public/core/di/injection.dart';
import 'package:pos_public/core/storage/current_store_storage.dart';
import 'package:pos_public/core/theme/app_font_sizes.dart';

class SelectStoreScreen extends StatefulWidget {
  const SelectStoreScreen({super.key});

  @override
  State<SelectStoreScreen> createState() => _SelectStoreScreenState();
}

class _SelectStoreScreenState extends State<SelectStoreScreen> {
  final storeController = TextEditingController();

  @override
  void dispose() {
    storeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 440),
            child: Column(
              children: [
                Text(
                  'Select Store',
                  style: TextStyle(
                    fontSize: AppFontSizes.xl,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(24),
                TextField(
                  controller: storeController,
                  decoration: const InputDecoration(
                    hintText: 'Enter store ID',
                    border: OutlineInputBorder(),
                  ),
                ),
                Gap(8),
                Text(
                  'Enter the store ID from QR or link',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: AppFontSizes.sm,
                  ),
                ),
                Gap(16),
                ElevatedButton(
                  onPressed: () async {
                    final storeId = storeController.text.trim();
                    if (storeId.isEmpty) {
                      return;
                    }

                    await sl<CurrentStoreStorage>().saveStoreId(storeId);

                    if (!context.mounted) {
                      return;
                    }
                    
                    context.go('/home/$storeId');
                  },
                  child: Text('Select'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
