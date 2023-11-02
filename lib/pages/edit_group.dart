import 'package:dnd/adaptive/loading_indicator.dart';
import 'package:dnd/model/group.dart';
import 'package:dnd/model/group_address.dart';
import 'package:dnd/providers/address_completer_provider.dart';
import 'package:dnd/providers/auth_provider.dart';
import 'package:dnd/providers/database_provider.dart';
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
  GroupModel? _group;

  final _descriptionController = TextEditingController();
  final _titleController = TextEditingController();


  bool _isRemote = false;

  String? _selectedAddress;
  LatLng? _location;

  bool _submitPressed = false;

  @override
  Widget build(BuildContext context) {
    if (widget.id != null) {
      final groupDetailsListener = ref.watch(groupDetailsProvider(widget.id!));

      if (groupDetailsListener.isLoading) {
        return const AdaptiveLoadingIndicator();
      }

      if (groupDetailsListener.hasValue && _group == null) {
        final GroupModel groupDetails = groupDetailsListener.value!;
        _group = groupDetails;
        _descriptionController.text = groupDetails.description;
        _titleController.text = groupDetails.title;
        _isRemote = groupDetails.isRemote;
        _selectedAddress = groupDetails.address?.address;
        _location = groupDetails.address?.location;
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
                    TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        label: Text("Title"),
                        hintText: "e.g. Critical Role",
                        border: OutlineInputBorder(),
                      ),
                    ),
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
                        initialValue:
                            TextEditingValue(text: _selectedAddress ?? ""),
                      ),
                      if (_location == null && _submitPressed)
                        Text(
                          "Please provide an address.",
                          style: const TextStyle().copyWith(
                              color: Theme.of(context).colorScheme.error),
                        )
                      else
                        const Text(
                            "Your address will only be shown to members of this group.")
                    ]
                  ],
                ),
                Text(_location.toString()),
               
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
                const Text("Members"),
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
                        GroupAddressModel? address;

                        if (_selectedAddress != null && _location != null) {
                          address = GroupAddressModel(
                              address: _selectedAddress!, location: _location!);
                        }
                        GroupModel group = _group != null
                            ? _group!.copyWith(
                                description: _descriptionController.text,
                                title: _titleController.text,
                                isRemote: _isRemote,
                                address: address)
                            : GroupModel(
                                description: _descriptionController.text,
                                title: _titleController.text,
                                isRemote: _isRemote,
                                ownerId: ref.read(loggedInUserProvider).id,
                                createdAt: DateTime.now(),
                                address: address);

                        ref
                            .read(databaseServiceProvider)
                            .saveGroup(group);

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
