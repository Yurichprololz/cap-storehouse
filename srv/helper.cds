namespace helper;



type carUUID : UUID;

annotate carUUID with @(Common.ValueList : {
  CollectionPath  : 'Cars',
  Label           : '',
  Parameters      : [
    {
      $Type             : 'Common.ValueListParameterInOut',
      LocalDataProperty : car,
      ValueListProperty : 'ID'
    },
    {
      $Type             : 'Common.ValueListParameterDisplayOnly',
      ValueListProperty : 'carName'
    },
    {
      $Type             : 'Common.ValueListParameterDisplayOnly',
      ValueListProperty : 'status_ID'
    }
  ],
  SearchSupported : true
});
