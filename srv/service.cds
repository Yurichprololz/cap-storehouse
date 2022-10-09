using {storehouse} from '../db/schema';
using {masterData} from '../db/master-data';


service StorehouseService {
    entity Cars         as projection on storehouse.Cars actions {
        @Core.OperationAvailable : {$value : in.sendCarEnabled}
        action sendCar();
    };

    entity Goods as projection on storehouse.Goods actions {
        @Core.OperationAvailable : in.loadCarEnabled
        action loadCar(car : UUID @Common.ValueList : {
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
        }
        )
    };

    entity Statuses     as projection on masterData.Statuses;
    entity GoodStatuses as projection on masterData.GoodStatuses;
    entity Allowance    as projection on masterData.Allowance;
}

service TechnicalService @(reqires : 'system-user') {
    entity Cars         as projection on storehouse.Cars;
    entity Goods        as projection on storehouse.Goods;
    entity Statuses     as projection on masterData.Statuses;
    entity GoodStatuses as projection on masterData.GoodStatuses;
    entity Allowance    as projection on masterData.Allowance;
}
