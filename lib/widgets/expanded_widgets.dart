import 'package:flutter/material.dart';
import 'package:tms/utils/buildContext_extension.dart';

class ExpandedWidget extends StatefulWidget {
  const ExpandedWidget({super.key, required this.text});
  final String text;
  @override
  State<ExpandedWidget> createState() => _ExpandedWidgetState();
}

class _ExpandedWidgetState extends State<ExpandedWidget> {
  late String firstHalf;
  late String secondHalf;
  bool flag = true;
  @override
  void initState() {
    if (widget.text.length > 150) {
      firstHalf = widget.text.substring(0, 150);
      secondHalf = widget.text.substring(151, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.length == ''
          ? Text(
              widget.text,
              style: context.bodysmall
                  ?.copyWith(fontSize: 15, color: Colors.grey.withOpacity(0.4)),
            )
          : Column(
              children: [
                Text(
                  flag ? firstHalf : widget.text,
                  style: context.bodysmall
                      ?.copyWith(fontSize: 15, color: Colors.grey),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        'Read more',
                        style: context.bodyLarge
                            ?.copyWith(color: context.lightredColor),
                      ),
                      Icon(
                        flag
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        color: context.lightredColor,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
