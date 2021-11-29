namespace my.bookshop_final; //groupid and artifctid

using {my.bookshop_final as bookshop} from './index';
using {Currency,cuid} from '@sap/cds/common';

entity Books :cuid{
    //key id       : Integer;
        title    : String(100);
        descr    : String(1000);
        author   : String(100);
        genre    : String(100);
        price    : Decimal(9, 2);
        currency : Currency;
        rating   : Decimal(2, 1)@assert.range : [
            0.0,
            5.0
        ];
        reviews  : Association to many bookshop.Reviews
                       on reviews.book = $self;
}
