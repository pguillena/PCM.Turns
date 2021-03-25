function validateMail(idMail) {
    //Creamos un objeto 
    object = document.getElementById(idMail);
    valueForm = object.value;

    // Patron para el correo
    var patron = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/;
    if (valueForm.search(patron) == 0) {
        //Mail correcto
        object.style.color = "#000";
        return;
    }
    //Mail incorrecto
    object.style.color = "#f00";
}

function validarEmail(email) {
    re = /^([\da-z_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
    if (!re.exec(email)) {
        alert('email no valido');
    }
    else alert('email valido');
}