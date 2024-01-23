import 'package:flutter/material.dart';
import 'package:hotel/core/design/colors.dart';
import 'package:hotel/core/design/dimensions.dart';
import 'package:hotel/core/design/styles.dart';
import 'package:hotel/domain/model/tourist.dart';


class SelectTouristDialog extends StatefulWidget {
  final int? initialSelectedTouristId;

  final List<Tourist> tourists;
  final void Function() onDismiss;
  final void Function(int id) onTouristSelected;
  const SelectTouristDialog({super.key, required this.tourists, required this.onDismiss, required this.onTouristSelected, this.initialSelectedTouristId});


  @override
  State<StatefulWidget> createState() {
    return SelectTouristDialogState();
  }
}

class SelectTouristDialogState extends State<SelectTouristDialog> {
  int? _selectedTourist;




  @override
  void initState() {
    super.initState();
    _selectedTourist = widget.initialSelectedTouristId;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Padding(
            padding: const EdgeInsets.all(padding24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Выберите туриста", style: titleTextStyle),
                const SizedBox(height: height16),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.tourists.length,
                  itemBuilder: (context, index) {
                    Tourist tourist = widget.tourists[index];
                    return SizedBox(
                        height: height32,
                        child:  RadioMenuButton(
                          value: index,
                          groupValue: _selectedTourist,
                          onChanged: (value) {
                            setState(() {
                              _selectedTourist = value;
                            });
                          },
                          child: Text("${tourist.firstName} ${tourist.lastName}",style: bodyTextStyle),
                        )

                    );
                  },
                ),
                Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () => widget.onDismiss(),
                          child: Text("Отмена", style: buttonTextStyle.copyWith(color: blackColor))
                      ),
                      if(_selectedTourist != null) TextButton(
                          onPressed: () => widget.onTouristSelected(_selectedTourist!),
                          child: Text("ОК", style: buttonTextStyle.copyWith(color: blackColor))
                      )
                    ],
                ),
              ],
            )
        )
    );
  }
}
