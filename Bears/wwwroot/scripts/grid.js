

function getRowNodeIdCallBack(data) {
    return data.bearId;
}


function onCellFocused(params) {
    if (params.column && params.column.colId === "deleteBear") {
        gridOptions.suppressRowClickSelection = true;
    } else {
        gridOptions.suppressRowClickSelection = false;
    }

}


function deleteCellRendererFunc(params) {
    return `
        <button id="deleteBear" onclick="onDeleteBear(${params.data.bearId})" class="btn btn-sm btn-outline-danger" data-toggle="tooltip" data-placement="top" title="Delete Bear">
            <i class="fas fa-trash-alt"></i>
        </button>`;
}


function onFirstDataRendered(params) {
    params.api.selectIndex(0, false, false);
    params.api.sizeColumnsToFit();
    params.api.autoSizeColumns(["deleteBear"]);
}


function resizeToFit() {
    gridOptions.api.sizeColumnsToFit();
    gridOptions.api.refreshCells();
}
