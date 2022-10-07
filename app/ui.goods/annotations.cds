using StorehouseService as service from '../../srv/service';

annotate service.Goods with @(
    
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Value : status_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : allowance_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : quantity,
        },
        {
            $Type : 'UI.DataField',
            Value : price,
        },
    ],

    UI          : {
        SelectionFields                : [quantity],
        Identification                 : [
            {Value : ID},
            {
                $Type  : 'UI.DataFieldForAction',
                Action : 'StorehouseService.loadCar',
                Label  : '{i18n>sendBook}'
            }
        ],
        HeaderInfo                     : {
            TypeName       : 'Good',
            TypeNamePlural : 'Goods',
            Title          : {Value : name},
            Description    : {Value : status_ID}
        },
        HeaderFacets                   : [{
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #High
        }],
        FieldGroup #Description        : {Data : [
            {
                $Type : 'UI.DataField',
                Value : quantity,
            },
            {
                $Type : 'UI.DataField',
                Value : status_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : quantity,
            },
            {
                $Type : 'UI.DataField',
                Value : allowance_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : price,
            },
        ], },

        FieldGroup #AdministrativeData : {Data : [
            {
                $Type : 'UI.DataField',
                Value : createdBy
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt
            }
        ]},
    },
    UI.Facets   : [{
        $Type  : 'UI.CollectionFacet',
        ID     : 'POAdmininfo',
        Label  : '{i18n>adminInfo}',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>admininfo}',
            Target : '@UI.FieldGroup#AdministrativeData'
        }]
    }]
);


using from './label';
using from './capabilities';
using from './field-control';
using from './value-helps';
