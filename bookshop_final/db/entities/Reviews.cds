namespace my.bookshop_final;

using {my.bookshop_final as book} from './books';
using {my.bookshop_final as bookshop_types} from '../types/index';
using {
    cuid,
    managed
} from '@sap/cds/common';

entity Reviews : cuid, managed {
    book   : Association to book.Books;
    rating : bookshop_types.Rating @assert.range;
    title  : bookshop_types.Name @mandatory;
    text   : bookshop_types.Text @mandatory;
}
