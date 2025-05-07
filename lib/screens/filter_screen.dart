import 'package:flutter/material.dart';
import 'package:oja/components/add_to_cart.dart';
import 'package:oja/components/price_range_selector.dart';
import 'package:oja/components/section_title.dart';
import 'package:oja/components/selectable_button.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final Set<String> selectedConditions = {};
  final Set<String> selectedBuyingFormats = {};
  final Set<String> selectedLocations = {};
  final Set<String> selectedShowOnly = {};
  RangeValues _selectedRange = const RangeValues(100.0, 800.0);

  void toggleSelection(Set<String> targetSet, String value) {
    setState(() {
      if (targetSet.contains(value)) {
        targetSet.remove(value);
      } else {
        targetSet.add(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Filter Search', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(height: 1, thickness: 1),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'Price Range'),
            PriceRangeSelector(
              minValue: 100.0,
              maxValue:  800.0,
              selectedRange: _selectedRange,
              onChanged: (newRange) {
                setState(() {
                  _selectedRange = newRange;
                });
              },
            ),

            const SizedBox(height: 24),
            const SectionTitle(title: 'Condition'),
            Wrap(
              spacing: 10,
              children: ['New', 'Used', 'Not Specified']
                  .map((condition) => SelectableButton(
                        label: condition,
                        isSelected: selectedConditions.contains(condition),
                        onTap: () =>
                            toggleSelection(selectedConditions, condition),
                      ))
                  .toList(),
            ),

            const SizedBox(height: 24),
            const SectionTitle(title: 'Buying Format'),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                'All Listings',
                'Accept Offers',
                'Auction',
                'Buy It Now',
                'Classified Ads'
              ]
                  .map((format) => SelectableButton(
                        label: format,
                        isSelected: selectedBuyingFormats.contains(format),
                        onTap: () =>
                            toggleSelection(selectedBuyingFormats, format),
                      ))
                  .toList(),
            ),

            const SizedBox(height: 24),
            const SectionTitle(title: 'Item Location'),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: ['US Only', 'North America', 'Europe', 'Asia']
                  .map((location) => SelectableButton(
                        label: location,
                        isSelected: selectedLocations.contains(location),
                        onTap: () =>
                            toggleSelection(selectedLocations, location),
                      ))
                  .toList(),
            ),

            const SizedBox(height: 24),
            const SectionTitle(title: 'Show Only'),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                'Free Returns',
                'Returns Accepted',
                'Authorized Seller',
                'Completed Items',
                'Sold Items',
                'Deals & Savings',
                'Sale Items',
                'Listed As Lots',
                'Search In Description',
                'Benefit Charity',
                'Authenticity Verified',
              ]
                  .map((filter) => SelectableButton(
                        label: filter,
                        isSelected: selectedShowOnly.contains(filter),
                        onTap: () => toggleSelection(selectedShowOnly, filter),
                      ))
                  .toList(),
            ),

            const SizedBox(height: 100), // space before sticky button
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
        child: CustomButton(
          label: 'Apply',
          onTap: () {
            // Apply logic here
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
