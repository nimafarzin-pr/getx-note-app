import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoteItem extends StatefulWidget {
  final controller;
  final int index;
  final item;
  NoteItem({
    Key? key,
    required this.index,
    required this.controller,
    required this.item,
  }) : super(key: key);
  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(12.w, 12.w, 12.w, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            setState(() {
              widget.controller.noteLists.removeAt(widget.index);
            });
          },
          background: Container(
            color: Colors.red,
            child: Icon(
              Icons.delete,
              size: 60.sp,
              color: Colors.white,
            ),
          ),
          child: Column(
            children: [
              Container(
                color: widget.item.color,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 7,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.item.title,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: FittedBox(
                                child: Text(
                                  '${widget.item.time}',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(4.w, 0, 18.w, 4.w),
                        child: FittedBox(
                          child: Text(
                            widget.item.description,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black54),
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
