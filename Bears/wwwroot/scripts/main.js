class Bear {
    bearId = 0;
    bearTypeId = 0;
    name = "";
    age = "";
    bearTypeName = "";
    genderName = "";
}

class UpdateBear {
    bearId = 0;
    bearTypeId = 0;
    genderId = 0;
    name = "";
    age = "";
}


class CreateBear {
    bearTypeId = 0;
    genderId = 0;
    name = "";
    age = "";
}


class BearType {
    bearTypeId = 0;
    name = "";
    description = "";
    imageUrl = ""
}


// bears
var bears = new Map();

// grid
var bearsGrid = null;

// bear types
var bearTypes = new Map();

// genders
var genders = new Map();


var columnDefs = [
    { headerName: "Name", field: "name" },
    { headerName: "Type", field: "bearTypeName" },
    { headerName: "Gender", field: "genderName" },
    { headerName: "Age", field: "age" },
    { headerName: "", field: "bearId", lockPinned: true, cellClass: "lock-pinned", pinned: "right", width: 50, cellRenderer: deleteCellRendererFunc, colId: "deleteBear", resizable: false, suppressSizeToFit:true}
];
    
   
// let the grid know which columns and what data to use
var gridOptions = {
    columnDefs: columnDefs,
    rowData: null,
    defaultColDef: {
        resizable: true,
        sortable: true
        
    },
    groupHeaders: true,
    rowSelection: "single",
    // event handlers
    onFirstDataRendered: onFirstDataRendered,
    onSelectionChanged: onSelectionChanged,
    onCellFocused: onCellFocused,
    getRowNodeId: getRowNodeIdCallBack
};


function onSelectionChanged() {
    const selectedRows = gridOptions.api.getSelectedRows();

    if (selectedRows.length === 1) {
        const row = selectedRows[0];

        $("#name").val(row.name);
        $("#age").val(row.age);

        const bearType = bearTypes.get(row.bearTypeId);

        $("#bearType").val(bearType.bearTypeId);
        bearType_OnSelect(bearType);

        $("#saveButton").prop("disabled", false);
        const radios = $("*[name='gender']", "#details");
        for (let i = 0; i < radios.length; i++) {
            const radio = radios[i];

            if (radio.value === row.genderId.toString()) {
                radio.checked = true;
                break;
            }
        }

    } else {
        $("#saveButton").prop("disabled", true);
    }
}


function bearType_OnSelect(bearType) {
    
    if ($("#bearType")[0].selectedIndex >= 0) {
        $("#bearImage")[0].src = bearType.imageUrl;
        $("#bearDescription")[0].innerText = bearType.description;
    }
}


function showStatusText(text) {
    const statusText = $("#statusText");
    statusText.text(text);
    statusText.stop();
    statusText.fadeIn(500, function () {
        statusText.fadeOut(4000);
    });
}


function onLoad() { 
    const  gridDiv = $("#bearsGrid")[0];
    bearsGrid = new agGrid.Grid(gridDiv, gridOptions);

    loadGenders();
    loadBearTypes();
    loadBears();

    $("#saveButton").click(saveClicked);
    $("#createButton").click(createClicked);

   $(window).resize(resizeToFit);
};


$(document).ready(function () {
    onLoad();
});
