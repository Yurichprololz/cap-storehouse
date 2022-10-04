using {StorehouseService} from '../../srv/service';

annotate StorehouseService.Goods with @odata.draft.enabled;

annotate StorehouseService.Goods with @Capabilities : {
    Deletable  : true,
    Insertable : true
};