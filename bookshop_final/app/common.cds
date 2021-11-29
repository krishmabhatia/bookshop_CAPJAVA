using {my.bookshop_final as bookshop} from '../db/books';

annotate bookshop.Books with {
    title    @title : 'Title';
    author   @title : 'Author';
    genre    @title : 'Genre';
    price    @title : 'Price';
    id       @UI.Hidden;
    descr    @title : 'Description';
    currency @UI.Hidden;
    rating   @title : 'Rating'
}
