import 'package:flutter/material.dart';
import 'package:weather_forecast/core/constants/app_constants.dart';
import 'package:weather_forecast/core/styles/constant_style.dart';

class BottomSection extends StatelessWidget {
  final TextEditingController? cityController;
  final VoidCallback? onSearch;

  const BottomSection({
    super.key,
    this.cityController,
    this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: ConstantStyle.padding20,
        vertical: ConstantStyle.padding10,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(ConstantStyle.radius50),
          topRight: Radius.circular(ConstantStyle.radius50),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: ConstantStyle.height20),
          Container(
            width: ConstantStyle.width50,
            height: ConstantStyle.height5,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onBackground,
              borderRadius: const BorderRadius.all(
                Radius.circular(ConstantStyle.radius50),
              ),
            ),
          ),
          const Spacer(),
          Text(
            AppConstants.searchCity,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: ConstantStyle.height20),
          TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsetsDirectional.symmetric(
                horizontal: ConstantStyle.padding20,
                vertical: ConstantStyle.padding10,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  style: BorderStyle.solid,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(ConstantStyle.radius10),
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  style: BorderStyle.solid,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(ConstantStyle.radius10),
                ),
              ),
            ),
            controller: cityController,
            style: Theme.of(context).textTheme.bodyLarge,
            onEditingComplete: () {
              onSearch!();
              FocusScope.of(context).unfocus();
            },
          ),
          const SizedBox(height: ConstantStyle.height20),
          MaterialButton(
            onPressed: onSearch,
            shape: const CircleBorder(),
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsetsDirectional.all(ConstantStyle.padding10),
            child: Icon(
              Icons.search,
              size: ConstantStyle.size50,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
