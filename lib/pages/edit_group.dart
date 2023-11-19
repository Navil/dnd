import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:dnd/adaptive/loading_indicator.dart';
import 'package:dnd/model/group.dart';
import 'package:dnd/model/group_address.dart';
import 'package:dnd/providers/address_completer_provider.dart';
import 'package:dnd/providers/auth_provider.dart';
import 'package:dnd/providers/database_provider.dart';
import 'package:dnd/services/language_service.dart';
import 'package:dnd/widgets/deletable_group_member.dart';
import 'package:dnd/widgets/group_marker_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  late String _language = Localizations.localeOf(context).languageCode;
  bool _submitPressed = false;

  final List<String> _markedUsersForDeletion = [];

  final Map<int, TimeRange> _selectedTimesLocal = {};

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
        _language = groupDetails.language;
      }
    }

    return Scaffold(
      appBar:
          AppBar(title: Text(_group == null ? "Create Group" : "Edit Group")),
      resizeToAvoidBottomInset: false,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: TextFormField(
                        controller: _descriptionController,
                        minLines: 3,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          label: Text("Description"),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const Text("In what language will you play?"),
                    
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                          isExpanded: true,
                          value: _language,
                          onChanged: (String? newValue) {
                            setState(() {
                              _language = newValue!;
                            });
                          },
                          items: ref.watch(languageDropdownItemsProvider)),
                    ),
                    
                    CheckboxListTile.adaptive(
                        title: const Text("Is it remote?"),
                        value: _isRemote,
                        onChanged: (bool? value) {
                          setState(() {
                            _isRemote = value == true;
                          });
                        }),
                    if (!_isRemote) ...[
                      const Text("Address:"),
                      Autocomplete<AutocompletePrediction>(
                        optionsBuilder: (textEditingValue) async =>
                            await ref.watch(addressAutocompleteProvider(
                                    textEditingValue.text)
                                .future),
                        onSelected: (prediction) =>
                            _onAddressSelected(prediction, ref),
                        displayStringForOption: (option) => option.description,
                        initialValue:
                            TextEditingValue(text: _selectedAddress ?? ""),
                      ),
                      if (_location == null && _submitPressed)
                        Text(
                          "Please provide an address.",
                          style: const TextStyle().copyWith(
                              color: Theme.of(context).colorScheme.error),
                        )
                      else if (_location != null) ...[
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40)),
                          child: Container(
                              padding: const EdgeInsets.all(8),
                              height: 200,
                              child: GroupMarkerMap(location: _location!)),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            "Your address will only be shown to members of this group.",
                            textAlign: TextAlign.center,
                          ),
                        )
                      ]
                    ]
                  ],
                ),
                const Text(
                    "Please select times for the sessions. You can also leave this empty. If you can't narrow it down, you can instead put a text."),
                Wrap(
                  children:
                      List.generate(7, (index) => index + 1).map((weekday) {
                    bool isSelected = _selectedTimesLocal[weekday] != null;
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: FilterChip(
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                        checkmarkColor: Colors.white,
                        label: Text(weekdays[weekday - 1]),
                        selected: isSelected,
                        onSelected: (value) async {
                          if (value) {
                            await _pickHours(weekday);
                          } else {
                            setState(() {
                              _selectedTimesLocal
                                  .removeWhere((key, value) => key == weekday);
                            });
                          }
                        },
                      ),
                    );
                  }).toList(),
                ),
                if (_group?.members?.isNotEmpty == true)
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text("Members:"),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: _group!.members!.map((member) {
                            return DeletableGroupMember(
                                userId: member.userId,
                                pictureUrl: member.user?.pictureUrl,
                                onTap: () => _markMemberDeleted(member.userId));
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
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
                        final databaseService =
                            ref.read(databaseServiceProvider);
                        final numberDelete = _markedUsersForDeletion.length;
                        if (numberDelete > 0) {
                          final dialogResult = await showOkCancelAlertDialog(
                              context: context,
                              okLabel: "Yes",
                              message:
                                  "You are about to remove ${numberDelete > 1 ? ("$numberDelete members") : "a member"} from this group. Are you sure you want to proceed?");

                          if (dialogResult == OkCancelResult.cancel) {
                            return;
                          }

                          await databaseService.removeMembersFromGroup(
                              _markedUsersForDeletion, _group!.id!);
                        }

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
                                language: _language,
                                address: address)
                            : GroupModel(
                                description: _descriptionController.text,
                                title: _titleController.text,
                                isRemote: _isRemote,
                                ownerId: ref.read(loggedInUserProvider).id,
                                language: _language,
                                createdAt: DateTime.timestamp(),
                                address: address);

                        ref.read(databaseServiceProvider).saveGroup(group);

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

  _markMemberDeleted(String userId) {
    setState(() {
      if (!_markedUsersForDeletion.remove(userId)) {
        _markedUsersForDeletion.add(userId);
      }
    });
  }

  _isLocationProvided() {
    return (_isRemote || (_selectedAddress != null && _location != null));
  }

  _pickHours(int weekday) async {
    final startTime = await showTimePicker(
        context: context, initialTime: const TimeOfDay(hour: 18, minute: 00));
    if (startTime != null) {
      final endTime = await showTimePicker(
          context: context,
          initialTime:
              TimeOfDay(hour: startTime.hour + 2, minute: startTime.minute));
      if (endTime != null) {
        if ((endTime.hour * 60 + endTime.minute) <=
            (startTime.hour * 60 + startTime.minute)) {
          final dialogResult = await showOkCancelAlertDialog(
              context: context,
              message:
                  "The end time is earlier than the start time. Is it over night and intended?");

          if (dialogResult == OkCancelResult.cancel) {
            await showOkAlertDialog(
                context: context,
                message: "The end time must be after the start time.");
            return;
          }
        }
        setState(() {
          _selectedTimesLocal[weekday] = TimeRange(startTime, endTime);
        });
      }
    }
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

final weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

class TimeRange {
  TimeOfDay startTime;
  TimeOfDay endTime;

  TimeRange(this.startTime, this.endTime);
}
