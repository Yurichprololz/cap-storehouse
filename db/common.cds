namespace common;
 
using { cuid, managed, Currency } from '@sap/cds/common';

extend sap.common.Currencies with {
    numcode  : Integer;
    exponent : Integer;
    minor    : String; 
}
