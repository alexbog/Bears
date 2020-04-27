function createClicked() {
    if ($("#createBearDialog").length === 0) {
        initCreateBearDialog();
    }

    const dlg = $("#createBearDialog");
    dlg.find("#name").val("New Bear Name");
    dlg.find("#age").val(10);
    dlg.find("#bearType").val(bearTypes.values().next().value.bearTypeId);
    dlg.find("[name='gender']").first().prop("checked", true);

    showModal({
        header: "Create Bear.",
        data: "asd",
        executeYes: createBear,
        btnYesText: "Create",
        dialogId: "#createBearDialog"
    });
}


function createBear_success(response) {
    const newBear = new Bear();
    $.extend(newBear, response);
    newBear.bearTypeName = bearTypes.get(newBear.bearTypeId).name;
    newBear.genderName = genders.get(newBear.genderId).name;

    bears.set(newBear.bearId, newBear);
    gridOptions.api.updateRowData({ add: [newBear] });

    const node = gridOptions.api.getRowNode(newBear.bearId);
    node.setSelected(true, true);
    gridOptions.api.ensureNodeVisible(node);

    showStatusText("Bear created successfully.");
}


function createBear() {
    const createBear = new CreateBear();
    createBear.bearTypeId = parseInt($("#createBearDialog #bearType option:selected").val());
    createBear.age = parseInt($("#createBearDialog #age").val());
    createBear.name = $("#createBearDialog #name").val();
    createBear.genderId = parseInt($("#createBearDialog input[name=gender]:checked").val());

    $.ajax({
        type: "POST",
        url: "http://localhost:64037/api/bear/create",
        contentType: "application/json",
        data: JSON.stringify(createBear),
        dataType: "json",
        success: createBear_success,
        error: function (response) {
            const text = response.responseJSON != undefined
                ? response.responseJSON.detail.toString()
                : `Failed to create bear - '${createBear.name}'`;
            alert(text);
        }
    });
}


function initCreateBearDialog() {
    const details = $("#bearDetails").clone();
    const dialog = $("#modalDialog").clone();
    dialog.find("#modalBodyPlaceHolder").empty().append(details);
    dialog.attr("id", "createBearDialog");

    $("body").append(dialog);
}