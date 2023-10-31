import 'package:dnd/model/group.dart';
import 'package:dnd/model/group_address.dart';
import 'package:dnd/providers/address_completer_provider.dart';
import 'package:dnd/providers/auth_provider.dart';
import 'package:dnd/providers/group_profile_provider.dart';
import 'package:dnd/providers/supabase_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

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

  String? _selectedAddress;
  LatLng? _location;

  bool _submitPressed = false;

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
      appBar:
          AppBar(title: Text(_group == null ? "Create Group" : "Edit Group")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CheckboxListTile.adaptive(
                        title: const Text("Is it remote?"),
                        value: _isRemote,
                        onChanged: (bool? value) {
                          setState(() {
                            _isRemote = value == true;
                            if (value != true) {
                              _location = null;
                            }
                          });
                        }),
                    if (!_isRemote) ...[
                      Autocomplete<AutocompletePrediction>(
                          optionsBuilder: (textEditingValue) async =>
                              await ref.watch(addressAutocompleteProvider(
                                      textEditingValue.text)
                                  .future),
                          onSelected: (prediction) =>
                              _onAddressSelected(prediction, ref),
                          displayStringForOption: (option) =>
                              option.description,
                          initialValue: TextEditingValue(text: "Test")),
                      if (_location == null && _submitPressed)
                        Text(
                          "Please provide an address.",
                          style: TextStyle().copyWith(
                              color: Theme.of(context).colorScheme.error),
                        )
                      else
                        Text(
                            "Your address will only be shown to members of this group.")
                    ]
                  ],
                ),
               
                TextFormField(
                  controller: _descriptionController,
                  minLines: 3,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                    label: Text("Description"),
                    border: OutlineInputBorder(),
                  ),
                ),
                Text("Members"),
                SizedBox(
                  height: 48,
                  width: MediaQuery.of(context).size.width / 2,
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _submitPressed = true;
                      });
                    

                      if (_formKey.currentState!.validate() &&
                          _isLocationProvided()) {
                        Group group = Group(
                            description: _descriptionController.text,
                            isRemote: _isRemote,
                            id: _group?.id,
                            ownerId: _group?.ownerId ??
                                ref.read(authUserProvider).value!.id,
                            createdAt: _group?.createdAt);

                        GroupAddress? address;
                        if (!_isRemote) {
                          address = GroupAddress(
                              address: _selectedAddress!, location: _location!);
                        }

                        ref.read(supabaseProvider).saveGroup(group, address);

                        if (mounted) {
                          GoRouter.of(context).pop();
                        }
                      }
                    },
                    child: const Text('Submit'),
                  ),
                )
                    
              ]),
        ),
      ),
    );
  }

  _isLocationProvided() {
    return (_isRemote || (_selectedAddress != null && _location != null));
  }

  _onAddressSelected(
      AutocompletePrediction selectedPrediction, WidgetRef ref) async {
    _selectedAddress = selectedPrediction.description;

    _location =
        await ref.read(placeDetailsProvider(selectedPrediction.placeId).future);
    _submitPressed = false;
    setState(() {});
  }
}
