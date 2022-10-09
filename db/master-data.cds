namespace masterData;

entity Statuses {
  key ID          : String;
      name        : String(20);
      criticality : Integer;
}

entity GoodStatuses {
  key ID          : String;
      name        : String(20);
      criticality : Integer;
}

entity Allowance {
  key ID   : String;
      name : String(20);
}
