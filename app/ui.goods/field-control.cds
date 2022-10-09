using StorehouseService from '../../srv/service';

annotate StorehouseService.Goods with {
    ID        @readonly;
    name      @mandatory;
    quantity  @mandatory;
    price     @mandatory;
    currency  @mandatory;
    status    @readonly;
    allowance @mandatory;
};