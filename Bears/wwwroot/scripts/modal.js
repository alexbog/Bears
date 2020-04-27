
function markFormValidated(form, eventData) {
    eventData.preventDefault();
    eventData.stopPropagation();
    form.classList.add("was-validated");
}


function markFormInValidated(form) {
    form.classList.remove("was-validated");
}


function showModal(option) {
    var msg = option.message;
    if (msg == undefined || msg === "")
        msg = "Are you sure?";

    var header = option.header;
    if (header == undefined || header === "")
        header = "???";

    const dialogId = option.dialogId ? option.dialogId : "#modalDialog";
    const dlg = $(dialogId);
    dlg.find("#modalDialogHeader").text(header);
    dlg.find("#modalDialogMessage").text(msg);
    const btnYs = dlg.find("#modalDialogYesButton");
    const btnNo = dlg.find("#modalDialogNoButton");

    if (option.btnYesText) {
        btnYs.text(option.btnYesText);
    }

    btnYs.unbind("click");
    btnYs.click(function (eventData) {
        const form = dlg.find("#modalBodyPlaceHolder")[0];
        if (form.checkValidity() === true) {
            if (typeof option.executeYes === "function") {
                option.executeYes(option.data);
                markFormInValidated(form);
                dlg.modal("hide");
            } else {
                markFormValidated(form, eventData);
            }
        } else {
            markFormValidated(form, eventData);
        };
    });

    btnNo.unbind("click");
    btnNo.click(function () {
        dlg.modal("hide");
        if (typeof option.executeNo === "function")
            option.executeNo(option.data);
    });

    $(dialogId).modal({});
}