enum MaintenanceStatus { assigned, inProgress, review, completed }

enum MaintenanceType { reactive, preventive, predictive, preventiveInspection }

enum EquipmentType { bigInjection, smallInjection }

enum MaterialRequestStatus { inProgress, completed }

enum MaintenanceObject { equipment, mold }

enum RequestStatus { submitted, rejected, approved }

enum MaintenanceObjectStatus { underMaintenance, working, idle }

enum MaterialStatus {
  inUsed,
  expired,
  error,
  missing,
  available,
}
