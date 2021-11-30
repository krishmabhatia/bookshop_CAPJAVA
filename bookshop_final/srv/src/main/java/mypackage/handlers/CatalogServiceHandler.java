package mypackage.handlers;

import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;
import com.sap.cds.services.handler.annotations.On;

import org.springframework.stereotype.Component;

import cds.gen.catalogservice.CatalogService_;
import cds.gen.catalogservice.AddReviewContext;
import cds.gen.catalogservice.Reviews;
import cds.gen.catalogservice.Reviews_;
import cds.gen.catalogservice.Books;

import com.sap.cds.ql.Insert;
import com.sap.cds.ql.cqn.CqnAnalyzer;
import com.sap.cds.ql.cqn.CqnInsert;
import com.sap.cds.ql.cqn.CqnSelect;
import com.sap.cds.reflect.CdsModel;

@Component
@ServiceName(CatalogService_.CDS_NAME)
public class CatalogServiceHandler implements EventHandler {

    private final CqnAnalyzer analyzer;
    private final PersistenceService db;

    CatalogServiceHandler(PersistenceService db, CdsModel model) {
        this.db = db;
        this.analyzer = CqnAnalyzer.create(model);
    }

    @On(event = AddReviewContext.CDS_NAME)
    public void addReview(AddReviewContext context) {
        // System.out.println("Krishma Triggered the action!");
        // System.out.println(context.getCqn());

        CqnSelect select = context.getCqn();

        // System.out.println(analysisResult);

        Reviews review = Reviews.create();
        /*
         * System.out.println("i m testing "+context.getTitle());
         * System.out.println(context.getRating());
         * System.out.println(context.getText());
         */
        review.setBookId((String) analyzer.analyze(select).targetKeys().get(Books.ID));
        review.setTitle(context.getTitle());
        review.setRating(context.getRating());
        review.setText(context.getText());

        CqnInsert reviewInsert = Insert.into(Reviews_.CDS_NAME).entry(review);
        System.out.println(reviewInsert);
        Reviews savedReview = db.run(reviewInsert).single(Reviews.class);
        context.setResult(savedReview);
    }
}
