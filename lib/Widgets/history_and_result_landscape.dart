import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ios_calculator/Widgets/scroll_text.dart';
import 'package:ios_calculator/methods.dart';
import 'package:ios_calculator/styles.dart';

class HistoryAndResultLandscape extends StatefulWidget {
  const HistoryAndResultLandscape({
    super.key,
    required this.equation,
    required this.history,
    required this.historyOnTap,
  });

  final String equation;
  final String history;
  final VoidCallback historyOnTap;

  @override
  State<HistoryAndResultLandscape> createState() =>
      _HistoryAndResultLandscapeState();
}

class _HistoryAndResultLandscapeState extends State<HistoryAndResultLandscape> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        widget.history == ''
            ? Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width,
                child: AutoSizeText(
                  formatNumber(widget.history),
                  maxLines: 1,
                  style: kHistoryStyle20,
                  minFontSize: 20,
                  overflowReplacement: ScrollText(
                    text: widget.history,
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              )
            : GestureDetector(
                onTap: widget.historyOnTap,
                child: Container(
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width,
                  child: AutoSizeText(
                    formatNumber(widget.history),
                    maxLines: 1,
                    style: kHistoryStyle20,
                    minFontSize: 20,
                    overflowReplacement: ScrollText(
                      text: widget.history,
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                )),
        widget.history == ''
            ? Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width,
                child: AutoSizeText(
                  formatNumber(widget.equation),
                  maxLines: 1,
                  style: kResultStyle45,
                  minFontSize: 40,
                  overflowReplacement: ScrollText(
                    text: widget.equation,
                    fontSize: 40,
                  ),
                ),
              )
            : Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width,
                child: AutoSizeText(
                  formatNumber(widget.equation),
                  maxLines: 1,
                  style: kResultStyle45,
                  minFontSize: 30,
                ),
              )
      ],
    );
  }
}
