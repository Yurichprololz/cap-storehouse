using {StorehouseService} from '../../srv/service';

annotate StorehouseService.Books with @odata.draft.enabled;

annotate StorehouseService.Cars with @Capabilities : {
    Deletable  : true,
    Insertable : true
};