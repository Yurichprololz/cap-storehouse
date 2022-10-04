using StorehouseService as service from '../../srv/service';

annotate service.Cars with @(
    UI        : {
        SelectionFields     : [driverSurname],
        Identification      : [{Value : ID}],
        LineItem            : [
            {
                $Type             : 'UI.DataField',
                Value             : driverSurname,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : driverSurname,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : driverSurname,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : driverSurname,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : status_ID,
                Criticality       : status.criticality,
                ![@UI.Importance] : #High 
            },
            
            // {
            //     $Type             : 'UI.DataField',
            //     Value             : good.ID ,
            //     ![@UI.Importance] : #High
            // },
            // {
            //     $Type             : 'UI.DataField',
            //     Value             : good.price,
            //     ![@UI.Importance] : #High
            // }
        ],
        PresentationVariant : {SortOrder : [{
            $Type      : 'Common.SortOrderType',
            Property   : driverSurname,
            Descending : false
        }]},
    },
    UI        : {
        HeaderInfo                     : {
            TypeName       : 'Car',
            TypeNamePlural : 'Cars',
            Title          : {Value : driverSurname},
            Description    : {Value : status.name}
        },
        HeaderFacets                   : [{
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #High
        }],
        FieldGroup #Description        : {Data : [
            {
                $Type : 'UI.DataField',
                Value : driverSurname,
            },
            {
                $Type       : 'UI.DataField',
                Value       : status_ID,
                Criticality : status.criticality,
            },
            // {
            //     $Type : 'UI.DataField',
            //     Value : good.name,
            // },
            // {
            //     $Type : 'UI.DataField',
            //     Value : good.price,
            // }
        ]},
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
        ]}
    },
    UI.Facets : [
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'POAdmininfo',
            Label  : '{i18n>adminInfo}',
            Facets : [{
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>admininfo}',
                Target : '@UI.FieldGroup#AdministrativeData'
            }]
        }
    ]
);

using from './label';
using from './capabilities';
using from './field-control';
