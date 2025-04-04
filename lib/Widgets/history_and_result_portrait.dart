import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ios_calculator/Widgets/scroll_text.dart';
import 'package:ios_calculator/methods.dart';

class HistoryAndResultPortrait extends StatefulWidget {
  const HistoryAndResultPortrait({
    super.key,
    required this.equation,
    required this.history,
    required this.historyOnTap,
  });

  final String equation;
  final String history;
  final VoidCallback historyOnTap;

  @override
  State<HistoryAndResultPortrait> createState() =>
      _HistoryAndResultPortraitState();
}

class _HistoryAndResultPortraitState extends State<HistoryAndResultPortrait> {
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
                  style: TextStyle(fontSize: 25, color: Colors.grey),
                  minFontSize: 20,
                  overflowReplacement: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ScrollText(
                      text: widget.history,
                      fontSize: 20,
                      color: Colors.grey,
                    ),
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
                    style: TextStyle(fontSize: 25, color: Colors.grey),
                    minFontSize: 20,
                    overflowReplacement: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: ScrollText(
                        text: widget.history,
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                )),
        widget.history != ''
            ? Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width,
                child: AutoSizeText(
                  formatNumber(widget.equation),
                  maxLines: 1,
                  style: TextStyle(fontSize: 60, color: Colors.white),
                  minFontSize: 20,
                  overflowReplacement: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ScrollText(
                      text: widget.equation,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            : Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width,
                child: AutoSizeText(
                  formatNumber(widget.equation),
                  maxLines: 1,
                  style: TextStyle(fontSize: 60, color: Colors.white),
                  minFontSize: 50,
                  overflowReplacement: ScrollText(
                    text: widget.equation,
                    fontSize: 50,
                  ),
                ),
              )
      ],
    );
  }
}
