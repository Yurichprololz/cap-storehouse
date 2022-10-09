using {storehouse} from '../../db/schema';

annotate storehouse.Goods {
    currency  @Common.ValueList : {
        CollectionPath  : 'Currencies',
        Label           : '',
        Parameters      : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : currency_code,
                ValueListProperty : 'code'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'descr'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'symbol'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'minor'
            }
        ],
        SearchSupported : true
    };
    status    @Common.ValueList : {
        CollectionPath  : 'Statuses',
        Label           : '',
        Parameters      : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : status_ID,
                ValueListProperty : 'code'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            },

        ],
        SearchSupported : true
    };
    allowance @Common.ValueList : {
        CollectionPath  : 'Allowance',
        Label           : '',
        Parameters      : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : allowance_ID,
                ValueListProperty : 'ID'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            },

        ],
        SearchSupported : true
    };
} 
