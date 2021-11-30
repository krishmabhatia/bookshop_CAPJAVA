sap.ui.define(
    ["sap/m/MessageBox"],
    function (MessageBox) {
        "use strict";
        return {
            onPress: function () {
                MessageBox.show("button Pressed!");
            },
        };
    });