using {storehouse} from '../../db/schema';

annotate storehouse.Cars with @title      : '{i18n>CarTitle}' {
    ID            @UI.Hidden;
    driverSurname @title                  : '{i18n>driverSurname}';

    status        @title                  : '{i18n>status}'
                  @Common.Text            : status.name
                  @Common.TextArrangement : #TextFirst;
    good          @title                  : '{i18n>good}' 
                  @Common.Text            : good.name
                  @Common.TextArrangement : #TextOnly;
}
