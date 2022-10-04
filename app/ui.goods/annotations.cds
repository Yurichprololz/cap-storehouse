using StorehouseService as service from '../../srv/service';

annotate service.Goods with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'status_ID',
            Value : status_ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'allowance_ID',
            Value : allowance_ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'quantity',
            Value : quantity,
        },
        {
            $Type : 'UI.DataField',
            Label : 'price',
            Value : price,
        },
    ]
);
annotate service.Goods with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'status_ID',
                Value : status_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'allowance_ID',
                Value : allowance_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'quantity',
                Value : quantity,
            },
            {
                $Type : 'UI.DataField',
                Label : 'price',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Value : currency_code,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
