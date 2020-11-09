
const $item = document.getElementById('item');

function addItem(){

    let $newItem = ('<div class="form-row align-items-center"><div class="col-sm-6 my-1"><label class="sr-only" for="inlineFormInputGroup">hotel</label><div class="input-group "><div class="input-group-prepend"><input id="idh" name="idh[]" type="text" hidden><div class="input-group-text"><i class="fa fa-map-marker" aria-hidden="true"></i></div></div><input type="text" class="form-control" id="hotel" readonly></div></div><div class="col-sm-2 my-1"><label class="sr-only" for="inlineFormInputGroup">fecha</label><div class="input-group "><div class="input-group-prepend"><div class="input-group-text"><i class="fa fa-calendar-check-o" aria-hidden="true"></i></div></div><input type="text" class="form-control" id="fecha" name="fecha[]" readonly></div></div><div class="col-sm-2 my-1"><div class="input-group"><div class="input-group-prepend"><div class="input-group-text"><i class="fa fa-building-o" aria-hidden="true"></i></div></div><input type="text" class="form-control" id="visits" name="visits[]" readonly></div></div><div class="col-auto"><button id="delete" type="button" class="btn btn-outline-danger" onclick="remove(item)">Delete Item</button></div></div>');

    $item.insertAdjacentHTML("afterend", $newItem);

    let idhotel = document.getElementById('idhotel').value;
    document.getElementById('idh').value = idhotel;

    let nameHotel = document.getElementById('idhotel');
    let selected = nameHotel.options[nameHotel.selectedIndex].text;
    document.getElementById('hotel').value = selected;

    let month = document.getElementById('month');
    let selectedTwo = month.options[month.selectedIndex].text;
    document.getElementById('fecha').value = selectedTwo;

    document.getElementById('visits').value = document.getElementById('visit').value; 

    document.getElementById('visit').value = 0;

    document.getElementById('save').disabled = false;

}

