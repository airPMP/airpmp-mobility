//  --------------Classes to store resource details from "actuals" field----------------------

/// Actual Resource Class: Fetched from the actuals field. Contains details of a resource which has been added.
class ActualResource {
  /// Variable names are the same as the api fields.
  late String iD, actualHours, designation, name, remarks;

  /// Variable names are the same as the api fields.
  late double plannedTotHrs, hourlySalary;

  /// Variable names are the same as the api fields.
  late bool isEquipment, unPlanned;

  ActualResource(
      this.iD,
      this.actualHours,
      this.designation,
      this.hourlySalary,
      this.isEquipment,
      this.name,
      this.plannedTotHrs,
      this.remarks,
      this.unPlanned);
  ActualResource.fromJson(Map<String, dynamic> json) {
    iD = json['Id'] ?? "";
    designation = json['designation'] ?? "";
    name = json['name'] ?? "";
    actualHours = json['actualHours'] ?? "";
    remarks = json['remarks'] ?? "";
    hourlySalary = json['hourlySalary'] ?? 0;
    plannedTotHrs = json['plannedTotHrs'] ?? 0;
    isEquipment = json['isEquipment'] ?? false;
    unPlanned = json['unPlanned'] ?? false;
  }
}

//  --------------Classes to store resource details from "plannedVsAllowableVsActual" field----------------------
//  -----------------------This field will be null if the job is executed----------------------------

/// PlannedvsActualResource Class: Fetched from the plannedVsAllowableVsActual field. Includes details of a resource in relation to the Project.
///
/// This resource was allowed, and has been added.
class PlannedvsActualResource {
  /// Variable names are the same as the api fields.
  double actualTotCost,
      actualTotHours,
      allowableResources,
      allowableTotCost,
      allowableTotHrs,
      cpi,
      plannedResources,
      plannedTotCost,
      plannedTotHrs,
      spi;

  /// Variable names are the same as the api fields.
  String designation, unit;

  PlannedvsActualResource(
      this.actualTotCost,
      this.actualTotHours,
      this.allowableResources,
      this.allowableTotCost,
      this.allowableTotHrs,
      this.cpi,
      this.designation,
      this.plannedResources,
      this.plannedTotCost,
      this.plannedTotHrs,
      this.spi,
      this.unit);
}

/// UnplannedvsActualResource Class: Fetched from the plannedVsAllowableVsActual field. Includes details of a resource in relation to the Project.
///
/// This resource was not allowed, but has been added.
class UnplannedvsActualResource {
  /// Variable names are the same as the api fields.
  double actualTotCost,
      actualTotHours,
      allowableTotCost,
      cpi,
      plannedTotCost,
      spi;

  /// Variable names are the same as the api fields.
  String designation;

  UnplannedvsActualResource(
    this.actualTotCost,
    this.actualTotHours,
    this.allowableTotCost,
    this.cpi,
    this.designation,
    this.plannedTotCost,
    this.spi,
  );
}

//  ---------------------Classes to store resource details from "planned" field----------------------

/// PlannedResource class: When resources are fetched, the planned field contains the resources allowed
///
/// [PlannedResource] class is used to store planned resources, which has not been added.
class PlannedResource {
  late String designation, unit;
  late double number, hours;

  PlannedResource(
      {required this.designation,
      required this.hours,
      required this.number,
      required this.unit});

  PlannedResource.fromJson(Map<String, dynamic> json) {
    designation = json['designation'] ?? "";
    hours = json['hours'] ?? 0;
    number = json['number'] ?? 0;
    unit = json['unit'] ?? "";
  }
}

/// PlannedActualResource class: When resources are fetched, the planned field contains the resources allowed
///
/// [PlannedActualResource] class is used to store planned resources, which has been added.(Actual resources)
class PlannedActualResource extends PlannedResource {
  late double cost, actualHours, cpi;
  PlannedActualResource(
      {designation,
      unit,
      number,
      hours,
      required this.actualHours,
      required this.cost,
      required this.cpi})
      : super(
            designation: designation, unit: unit, number: number, hours: hours);

  PlannedActualResource.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    cost = json['cost'] ?? 0;
    actualHours = json['actualHours'] ?? 0;
    cpi = json['cpi'] ?? 0;
  }
}

/// UnplannedResource Class: used to store details of resources which were not planned, but added.
class UnplannedResource {
  late String designation, actualHours;
  late double cost, cpi;

  UnplannedResource(
      {required this.actualHours,
      required this.cost,
      required this.cpi,
      required this.designation});

  UnplannedResource.fromJson(Map<String, dynamic> json) {
    designation = json['designation'] ?? "";
    actualHours = json['actualHours'] ?? 0;
    cost = json['cost'] ?? 0;
    cpi = json['cpi'] ?? "";
  }
}
