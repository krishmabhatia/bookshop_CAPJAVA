namespace my.bookshop_final; //groupid and artifctid

using {my.bookshop_final as bookshop} from './Reviews';
using {my.bookshop_final as bookshop_types} from '../types/index';
using {Currency,cuid} from '@sap/cds/common';

entity Books :cuid{
    //key id       : Integer;
        title    : bookshop_types.Name;
        descr    : bookshop_types.Text;
        author   : bookshop_types.Name;
        genre    : bookshop_types.Name;
        price    : Decimal(9, 2);
        currency : Currency;
        rating   : Decimal(2, 1)@assert.range : [
            0.0,
            5.0
        ];
        reviews  : Association to many bookshop.Reviews
                       on reviews.book = $self;
}