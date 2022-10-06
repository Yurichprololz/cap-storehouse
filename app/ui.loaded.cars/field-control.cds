using StorehouseService from '../../srv/service';

annotate StorehouseService.Cars with {
    ID            @readonly;
    driverSurname @mandatory;
    carName       @mandatory;
    status        @readonly;
    good          @readonly;
};
