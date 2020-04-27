function onDeleteBear(bearId) {
    const bear = bears.get(bearId);
    showModal({
        header: "Delete Bear!",
        message: `Are you sure you want to delete bear - '${bear.name}'?`,
        data: bear,
        executeYes: deleteBear
    });
}


function deleteBear(bear) {
    const url = `http:///localhost:64037/api/bear/delete/${bear.bearId}`;
    $.ajax({
        type: "POST",
        url: url,
        data: JSON.stringify(bear),
        success: function (response) {
            bears.delete(bear.bearId);
            gridOptions.api.updateRowData({ remove: [bear] });
            showStatusText("Bear deleted successfully.");
        },
        error: function (response) {
            alert(`Failed to delete bear - '${bear.name}`);
        }
    });
}