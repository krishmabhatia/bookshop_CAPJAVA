using {my.bookshop_final as bookshop_types} from '../db/types';
using {my.bookshop_final as bookshop_entities} from '../db/entities/books';

@path : 'browse'
service CatalogService {
  entity Books   as projection on bookshop_entities.Books;
 /* actions{
    action addReview(rating : bookshop_types.Rating,title : bookshop_types.Name, text : bookshop_types.Text) returns Reviews;//bookshop_entities.Reviews
  };*/
  entity Reviews as projection on bookshop_entities.Reviews;
}
