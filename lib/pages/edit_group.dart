import 'package:dnd/model/group.dart';
import 'package:dnd/providers/group_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditGroupPage extends ConsumerStatefulWidget {
  final int? id;
  const EditGroupPage(this.id, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditGroupPageState();
}

class _EditGroupPageState extends ConsumerState<EditGroupPage> {
  final _formKey = GlobalKey<FormState>();
  Group? _group;

  final _descriptionController = TextEditingController();
  bool _isRemote = false;
  @override
  Widget build(BuildContext context) {
    if (widget.id != null) {
      Group? groupDetails = ref.watch(groupDetailsProvider(widget.id!)).value;
      if (groupDetails != null && _group == null) {
        //Set all values on the UI
        _group = groupDetails;
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Edit Group")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFormField(
                  controller: _descriptionController,
                  minLines: 3,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  textCapitalization: TextCapitalization.sentences,
                  initialValue: "Description",
                ),
                CheckboxListTile.adaptive(
                    title: const Text("Is it remote?"),
                    value: _isRemote,
                    onChanged: (bool? value) {
                      setState(() {
                        _isRemote = value == true;
                      });
                    })
              ]),
        ),
      ),
    );
  }
}
