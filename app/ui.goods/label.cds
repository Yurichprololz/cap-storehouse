using {storehouse} from '../../db/schema';

annotate storehouse.Goods with @title    : '{i18n>goodTitle}' {
    ID        @UI.Hidden;
    name      @title                  : '{i18n>goodName}';
    quantity  @title                  : '{i18n>quantity}';
    price     @title                  : '{i18n>price}'
              @Measures.ISOCurrency   : currency_code;
    status    @title                  : '{i18n>goodstatus}'
              @Common.Text            : status.name
              @Common.TextArrangement : #TextOnly;
    allowance @title                  : '{i18n>status}'
              @Common.Text            : allowance.name
              @Common.TextArrangement : #TextOnly;
    currency  @title                  : '{i18n>currency}'
              @Common.Text            : currency.symbol
              @Common.TextArrangement : #TextLast;
}

