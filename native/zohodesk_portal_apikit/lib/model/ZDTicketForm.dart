
class ZDTicketForm {

  ZDTicketForm({
    required this.form
  });

  ZDTicketSectionsList form;

  ZDTicketForm.fromJson(Map<String, dynamic> json):
        form = ZDTicketSectionsList.fromJson(json['form']);

  Map toJson() => {
    'form' : form
  };

}


class ZDTicketSectionsList {

  ZDTicketSectionsList({
    required this.sections
  });

  List<ZDTicketSection> sections;

  ZDTicketSectionsList.fromJson(Map<String, dynamic> json):
        sections = (json['sections'] as List).map((toElement) => ZDTicketSection.fromJson(toElement)).toList();

  Map toJson() => {
    'sections' : sections
  };

}

class ZDTicketSection {

  ZDTicketSection({
    required this.sectionName,
    required this.fields
  });

  String sectionName;
  List<ZDTicketField> fields;

  ZDTicketSection.fromJson(Map<String, dynamic> json):
        sectionName = json['sectionName'],
        fields = (json['fields'] as List).map((toElement) => ZDTicketField.fromJson(toElement)).toList();

  Map toJson() => {
    'sectionName' : sectionName,
    'fields' : fields,
  };


}

class ZDTicketField{
  ZDTicketField({
    this.displayLabel,
    this.allowedValues,
    this.name,
    this.apiName,
    required this.isCustomField,
    this.fieldName,//
    this.dependancyMappingResponseMap,
    this.defaultValue,
    this.i18NLabel,
    required this.type,
    this.isReadOnly,//
    this.id,
    required this.maxLength,
    required this.isMandatory,
    this.toolTipType,
    this.toolTip,
    this.decimalPlaces,
    this.statusMapping,
    this.isPHI,
    this.isNested,
});

  String? displayLabel;
  List<dynamic>? allowedValues;
  String? name;
  String? apiName;
  bool isCustomField;
  String? fieldName;
  Object? dependancyMappingResponseMap;
  String? defaultValue;
  String? i18NLabel;
  String type;
  bool? isReadOnly;
  String? id;
  int maxLength;
  bool isMandatory;
  String? toolTipType;
  String? toolTip;
  int? decimalPlaces;
  List<ZDTicketStatusMapping>? statusMapping;
  bool? isPHI;
  bool? isNested;

  ZDTicketField.fromJson(Map<String, dynamic> json):
        displayLabel = json['displayLabel'],
        allowedValues = json['allowedValues'],
        name = json['name'],
        apiName = json['apiName'],
        isCustomField = json['isCustomField'],
        fieldName = json['fieldName'],
        dependancyMappingResponseMap = json['dependancyMappingResponseMap'],
        defaultValue = json['defaultValue'],
        i18NLabel = json['i18NLabel'],
        type = json['type'],
        isReadOnly = json['isReadOnly'],
        id = json['id'],
        maxLength = json['maxLength'],
        isMandatory = json['isMandatory'],
        toolTipType = json['toolTipType'],
        toolTip = json['toolTip'],
        decimalPlaces = json['decimalPlaces'],
        statusMapping = (json['statusMapping'] as List?)?.map((toElement) => ZDTicketStatusMapping.fromJson(toElement)).toList(),
        isPHI = json['isPHI'],
        isNested = json['isNested'];

  Map toJson() => {
    'displayLabel' : displayLabel,
    'allowedValues' : allowedValues,
    'name' : name,
    'apiName' : apiName,
    'isCustomField' : isCustomField,
    'fieldName' : fieldName,
    'dependancyMappingResponseMap' : dependancyMappingResponseMap,
    'defaultValue' : defaultValue,
    'i18NLabel' : i18NLabel,
    'type' : type,
    'isReadOnly' : isReadOnly,
    'id' : id,
    'maxLength' : maxLength,
    'isMandatory' : isMandatory,
    'toolTipType' : toolTipType,
    'toolTip' : toolTip,
    'decimalPlaces' : decimalPlaces,
    'statusMapping' : statusMapping,
    'isPHI' : isPHI,
    'isNested' : isNested,
  };

}

class ZDTicketStatusMapping{
  ZDTicketStatusMapping({
    required this.mappingValue,
    required this.name,
  });

  String mappingValue;
  String name;

  ZDTicketStatusMapping.fromJson(Map<String, dynamic> json):
        mappingValue = json['mappingValue'],
        name = json['name'];

  Map toJson() => {
    'mappingValue' : mappingValue,
    'name' : name
  };


}