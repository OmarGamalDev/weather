import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 150),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            onSubmitted: (value) {
              print(value);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 16,
              ),
              label: Text("Search city"),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              hintText: "Enter City Name",
              suffixIcon: IconButton(
                onPressed: () {
                },
                icon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
