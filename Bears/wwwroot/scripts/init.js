
function loadBears() {
    $.getJSON("http://localhost:64037/api/bear",
        function (data) {
            bears = new Map(data.map(i => [i.bearId, i]));
            gridOptions.api.setRowData(data);
        });
}


function loadGenders() {
    $.getJSON("http://localhost:64037/api/gender",
        function (data) {
            var radios = $("*[name='gender']", "#details");

            $.each(data,
                function (index, gender) {
                    genders.set(gender.genderId, gender);

                    const radio = radios[index];
                    radio.labels[0].innerText = gender.name;
                    radio.value = gender.genderId.toString();
                });
        });
}


function loadBearTypes() {
    $.getJSON("http://localhost:64037/api/bearType",
        function (data) {
            var list = $("#bearType")[0];
            list.addEventListener("change",
                (event) => {
                    bearType_OnSelect(bearTypes.get(parseInt(event.target.value)));
                });

            $.each(data,
                function (index, bearType) {
                    bearTypes.set(bearType.bearTypeId, bearType);

                    const op = document.createElement("option");

                    op.label = bearType.name;
                    op.value = bearType.bearTypeId.toString();

                    list.appendChild(op);
                });
        });
}