import 'package:flutter/material.dart';
import 'package:garden/main.dart';
import 'package:garden/models/entities/plant/plant.dart';
import 'package:garden/models/utilities/extensions/datetime_extension.dart';
import 'package:garden/ui/components/buttons/default_text_button.dart';
import 'package:garden/ui/components/custom_single_child_scroll_view.dart';
import 'package:garden/ui/components/text_fields/default_text_field.dart';
import 'package:garden/ui/screens/home/plant/plant_manager/plant_types_drop_down.dart';
import 'package:garden/ui/screens/home/plant/plant_manager/planting_date_view.dart';

class PlantManagerScreen extends StatefulWidget {
  static const String id = 'plantManagerScreen';
  final String screenTitle;
  final void Function(
      {required String name,
      required String type,
      required String date}) onSaved;
  final Plant? plant;
  const PlantManagerScreen(
      {Key? key, required this.screenTitle, required this.onSaved, this.plant})
      : super(key: key);

  @override
  State<PlantManagerScreen> createState() => _PlantManagerScreenState();
}

class _PlantManagerScreenState extends State<PlantManagerScreen> {
  final EdgeInsetsGeometry _screenPadding =
      const EdgeInsets.symmetric(horizontal: 20.0);

  final TextEditingController _nameController = TextEditingController();

  String? _selectedPlantType;
  late DateTime _plantingDate;

  @override
  void initState() {
    _initializePlant();
    super.initState();
  }

  void _initializePlant() {
    if (widget.plant != null) {
      _nameController.text = widget.plant!.name;
      _selectedPlantType = widget.plant!.type;
      _plantingDate = widget.plant!.plantingDate;
    } else {
      _plantingDate = DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.screenTitle),
      ),
      body: SafeArea(
        child: CustomSingleChildScrollView(
          padding: _screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              DefaultTextField(
                controller: _nameController,
                hintText: appLocalizations(context).name,
                onChanged: (val) => setState(() {}),
              ),
              const SizedBox(
                height: 40.0,
              ),
              PlantTypesDropDown(
                value: _selectedPlantType,
                onChanged: (String? value) {
                  setState(() {
                    _selectedPlantType = value;
                  });
                },
              ),
              const SizedBox(
                height: 40.0,
              ),
              PlantingDateView(
                  value: _plantingDate, onEdit: _plantingDateOnEdit),
              const SizedBox(
                height: 40.0,
              ),
              const Expanded(child: SizedBox()),
              _saveButtonView(context),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _plantingDateOnEdit() async {
    DateTime _now = DateTime.now();
    DateTime _plantingDateLimit = DateTime(_now.year + 1);
    FocusScope.of(context).requestFocus(FocusNode());
    final DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: _plantingDate,
      firstDate: _now,
      lastDate: _plantingDateLimit,
    );
    if (_picked != null && _picked != _plantingDate) {
      setState(() {
        _plantingDate = _picked;
      });
    }
  }

  Widget _saveButtonView(BuildContext context) {
    const EdgeInsetsGeometry _buttonPadding =
        EdgeInsets.symmetric(horizontal: 20.0);

    final bool _isButtonEnabled =
        _nameController.text.isNotEmpty && _selectedPlantType != null;

    return Padding(
      padding: _buttonPadding,
      child: DefaultTextButton(
          onPressed: _isButtonEnabled ? _saveButtonOnPressed : null,
          text: appLocalizations(context).save),
    );
  }

  void _saveButtonOnPressed() {
    final String _name = _nameController.text;
    final String _type = _selectedPlantType!;
    final String _pickingDate = _plantingDate.defaultFormat();
    widget.onSaved.call(name: _name, type: _type, date: _pickingDate);
    Navigator.pop(context);
  }
}
