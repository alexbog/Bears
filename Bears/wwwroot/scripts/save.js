function saveClicked(eventData) {
    const selectedRows = gridOptions.api.getSelectedRows();

    if (selectedRows.length === 1) {

        const form = $("#details")[0];
        if (form.checkValidity() === true) {

            markFormInValidated(form);
            const row = selectedRows[0];
            const bearUpdate = new UpdateBear();

            bearUpdate.bearId = row.bearId;
            bearUpdate.bearTypeId = parseInt($("#bearType option:selected").val());
            bearUpdate.age = parseInt($("#age").val());
            bearUpdate.name = $("#name").val();
            bearUpdate.genderId = parseInt($("input[name=gender]:checked", "#details").val());

            $.ajax({
                type: "POST",
                url: "http://localhost:64037/api/bear/update",
                contentType: "application/json",
                data: JSON.stringify(bearUpdate),
                dataType: "json",
                success: function (response) {
                    const bear = bears.get(bearUpdate.bearId);
                    $.extend(bear, bearUpdate);
                    bear.bearTypeName = bearTypes.get(bear.bearTypeId).name;
                    bear.genderName = genders.get(bear.genderId).name;

                    gridOptions.api.updateRowData({ update: [bear] });
                    showStatusText("Bear updated successfully.");
                },
                error: function (response) {
                    alert(response.responseJSON.detail);
                }
            });
        } else {

            markFormValidated(form, eventData);
        }

    }
};