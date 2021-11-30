sap.ui.define(
    ["sap/ui/core/Fragment"],
    function (Fragment) {
        "use strict";
        return {
            openDialog: async function () {
                const oBooklistPage = sap.ui.getCore().byId("bookshop_final::BooksList");
                if (!this.oAddReviewDialog) {
                    this.sReviewDialogId = `${oBooklistPage.getId()}-AddReviewDialog`;
                    this.oAddReviewDialog = await Fragment.load({
                        id: this.sReviewDialogId,
                        name: "bookshop_final.custom.AddReview.AddReviewDialog",
                    });
                    oBooklistPage.addDependent(this.oAddReviewDialog);
                }
                this.oAddReviewDialog.open();
            },
        };
    });