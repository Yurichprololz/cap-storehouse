namespace storehouse;

using {
    Currency,
    managed
} from './common';
using {masterData} from './master-data';


entity Cars {
    ID            : UUID;
    driverSurname : String;
    status        : Association to masterData.Statuses;
    good          : Association to Goods;
}

entity Goods : managed {
    ID        : UUID;
    name      : String;
    status    : Association to masterData.GoodStatuses;
    allowance : Association to masterData.Allowance;
    quantity  : Integer;
    price     : Decimal(15, 2);
    currency  : Currency;
}

// Error: SQLITE_ERROR: no such column: a.undefined in:
// SELECT
// a.currency_code AS "a_currency_code",
// a.price AS "a_price",
// a.quantity AS "a_quantity",
// b.ID AS "b_ID",
// b.name AS "b_name",
// c.ID AS "c_ID",
// c.name AS "c_name",
// d.DraftUUID AS "d_DraftUUID",
// d.DraftIsCreatedByMe AS "d_DraftIsCreatedByMe",
// d.InProcessByUser AS "d_InProcessByUser",
// d.CreatedByUser AS "d_CreatedByUser",
// d.LastChangeDateTime AS "d_LastChangeDateTime", ? AS "a_IsActiveEntity", ? AS "a_HasActiveEntity", CASE WHEN DRAFTS.DRAFTADMINISTRATIVEDATA_DRAFTUUID IS NOT NULL THEN TRUE ELSE FALSE END AS "a_HasDraftEntity" FROM localized_StorehouseService_Goods a LEFT JOIN StorehouseService_Goods_drafts drafts ON a.undefined = drafts.undefined LEFT JOIN StorehouseService_GoodStatuses b ON ( b.ID = a.status_ID ) LEFT JOIN StorehouseService_Allowance c ON ( c.ID = a.allowance_ID ) LEFT JOIN DRAFT_DraftAdministrativeData d ON d.DraftUUID IN ( SELECT DraftAdministrativeData_DraftUUID FROM StorehouseService_Goods_drafts ) LIMIT 1
