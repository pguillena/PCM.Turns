var SISTURN = {
    UrlPageMethod: function (strPageMethod) {
        return window.location.pathname + '/' + strPageMethod;
    },

    //< img src = "~/images/loading.gif" />
    MostrarLoading: function () {
        var dlg = $('<label id="dlgLoading"><img  src="../images/loading.gif" width="32px;" height="32px;" /><span style="color:#245170;">Cargando...</span></label>')
            .dialog({
                resizable: false,
                disable: true,
                modal: true,
                closeOnEscape: false,
                //autoOpen : false,
                position: 'center',
                width: '60px',
                height: '90px'
            });


        $('div[aria-labelledby="ui-dialog-title-dlgLoading"] .ui-dialog-titlebar').hide();

    },
    DialogMensaje: function (pTipoMensaje) {
        if (pTipoMensaje == "Confirmacion") {
            var dlg = $('<div id="dlgBase"> <p> El registro se guardó satisfactoriamente</p></div>')
                .dialog({
                    title: "Información del Sistema",
                    resizable: false,
                    modal: true,
                    width: 250
                });

            dlg.dialog("option", "buttons", {
                "Aceptar": function () { $(this).dialog("close"); return true; }
            });
        }

        if (pTipoMensaje == "Error") {
            var dlg = $('<div id="dlgBase"> <p> Error al realizar la operación</p></div>')
                .dialog({
                    title: "Información del Sistema",
                    resizable: false,
                    modal: true,
                    width: 250
                });

            dlg.dialog("option", "buttons", {
                "Aceptar": function () { $(this).dialog("close"); return true; }
            });
        }

        if (pTipoMensaje == "NoSeleccionado") {
            var dlg = $('<div id="dlgBase"> <p> Seleccione una fila </p></div>')
                .dialog({
                    title: "Información del Sistema",
                    resizable: false,
                    modal: true,
                    width: 250
                });

            dlg.dialog("option", "buttons", {
                "Aceptar": function () { $(this).dialog("close"); return true; }
            });
        }

        if (pTipoMensaje == "Eliminado") {
            var dlg = $('<div id="dlgBase"> <p> El registro se elimino satisfactoriamente</p></div>')
                .dialog({
                    title: "Información del Sistema",
                    resizable: false,
                    modal: true,
                    width: 250
                });

            dlg.dialog("option", "buttons", {
                "Aceptar": function () { $(this).dialog("close"); return true; }
            });
        }

    },
    MetodoDialogDatos: function (strPageMethodINS, strPageMethodUPD, objJsonParams, dlgdatos, callbackOk) {
        SISCOMER.MostrarLoading();
        if ($("#" + dlgdatos).data("Opcion") == "Nuevo") {
            //$.ajax({
            //    url: SISCOMER.UrlPageMethod(strPageMethodINS),
            //    data: JSON.stringify(objJsonParams),
            //    success: function (result) {
            //        SISCOMER.CerrarLoading();
            //        if (typeof callbackOk == 'function') { callbackOk.call(this); }
            //        SISCOMER.ResultadoDialogDatos(result.d, dlgdatos);
            //    }
            //});
        } else if ($("#" + dlgdatos).data("Opcion") == "Actualizar") {
            //$.ajax({
            //    url: SISCOMER.UrlPageMethod(strPageMethodUPD),
            //    data: JSON.stringify(objJsonParams),
            //    success: function (result) {
            //        SISCOMER.CerrarLoading();
            //        if (typeof callbackOk == 'function') { callbackOk.call(this); }
            //        SISCOMER.ResultadoDialogDatos(result.d, dlgdatos);
            //    }
            //});
        }
    }


};


