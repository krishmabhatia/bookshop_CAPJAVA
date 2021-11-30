sap.ui.define(
    [],
    function () {
        "use strict";

        const getAddReviewDialog = (oEvent) => oEvent.getSource().getParent();

        return {
            submit: function (oEvent) {
                getAddReviewDialog(oEvent).close();
            },
            cancel: function (oEvent) {
                getAddReviewDialog(oEvent).close();
            },
        };
    });