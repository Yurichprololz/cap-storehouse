namespace storehouse;

using {
    Currency,
    managed
} from './common';
using {masterData} from './master-data';


entity Cars : managed{
    key ID            : UUID;
        driverSurname : String;
        status        : Association to masterData.Statuses;
        good          : Association to Goods;
}

entity Goods : managed {
    key ID        : UUID;
        name      : String;
        status    : Association to masterData.GoodStatuses;
        allowance : Association to masterData.Allowance;
        quantity  : Integer;
        price     : Decimal(15, 2);
        currency  : Currency;
}
