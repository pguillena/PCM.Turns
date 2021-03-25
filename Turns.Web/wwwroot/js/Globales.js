var fnGlobales = {
    msg: {
        automatico: function (msg,fn) {  
            fn = fn === null ? function () { } : fn;
            swal({
                position: 'top-end',
                type: 'success',
                title: msg,
                showConfirmButton: false,
                timer: 1500
            }).catch(function (timeout) { });
        },
        existe: function (msg) {
            swal(
                '<h4>' + msg +'</h4>',
                ' ',
                //'question'
                'warning'
               
            );
        },
        success: function (msg, fn) {
            fn = fn === null ? function () { } : fn;
            //bootbox.alert(msg, fn);
            swal({
                title: 'Exito!',
                text: msg,
                type: 'success'
            }).then(function () {
                fn();
            });
        },
        error: function (msg, fn) {
            fn = fn === null ? function () { } : fn;
            swal({
                title: 'Alerta!',
                text: msg,
                type: 'warning'
            }).then(
                fn,
                function (dismiss) {
                    fn();
                }
            );
        },
        confirm: function (msg, fn) {
            fn = fn === null ? function () { } : fn;
            swal({
                title: '¿Estás seguro?',
                text: msg,
                type: 'question',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Aceptar',
                cancelButtonText: 'Cancelar'
            }).then(function () {
                fn();
            }).catch(swal.noop);
        },
        salir: function (msg, fn, urlSalir) {
            fn = fn === null ? function () { } : fn;

            swal({
                title: '¿Estás seguro?',
                text: msg,
                type: 'question',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Aceptar',
                cancelButtonText: 'Cancelar'
            }).then(function (isConfirm) {
                if (isConfirm) {
                    swal.showLoading();
                    fn();
                } else {
                }
            }, function (dismiss) {
                urlSalir();
            });

        },
        CamposVacios: function (msg, fn) {
            swal({
                title: '¿Estás seguro?',
                text: msg,
                type: 'question',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sí',
                cancelButtonText: 'No'
            }).then(function (isConfirm) {
                if (isConfirm)
                    fn();
                //true;
                else
                    swal.close();
            });
        },
        msgUsuario: function (msg, tittle) {
            swal({
                title: tittle,
                text: msg,
                type: "warning",
                showCancelButton: false,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Aceptar',
                cancelButtonText: 'Cancelar'
            }).then(function (isConfirm) {

                swal.close();
            });
        }
    },

    table: {
        selectRow: function (table, multi, fn) {
            $(table).on('click', 'tbody tr td', null, function (e) {
                if (multi) {
                    var chk = $(e.target).find('input');
                    if (chk.length === 0) {
                        chk = $(e.target).parent().find('td input');
                        //chk.iCheck(chk.is(':checked') ? 'uncheck' : 'check');
                        chk.prop('checked', !chk.is(':checked'));
                    }
                } else {
                    fn($(e.target).parent());
                }
            });
        }
    },

    error: {
        show: function (idTarget, htmlText) {
            $('#' + idTarget).html(htmlText).hide();
            $('html, body').animate({ scrollTop: 0 }, '500', 'swing', function () {
                $('#' + idTarget).slideDown(500, function () { });
            });
        },
        clientErrorShow: function (idTarget, error) {
            var error = (error === null ? [] : error);
            error = Array.isArray(error) ? error : [error];
            var htmlText = '<div class="alert alert-danger alert-dismissible">'
                + '<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>'
                + '<ul>';
            $.each(error, function (i, r) {
                htmlText += '<li>' + r + '</li>';
            });
            htmlText += '</ul></div>';
            this.show(idTarget, htmlText);
        }
    },

    wait: {
        modal: function (idModal) {
            var htmlText = '<div class="modal-dialog">'
                + '<div class="modal-content modal-width">'
                + '<div class="modal-header">'
                + '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>'
                + '<h4 class="modal-title">Cargando</h4>'
                + '</div>'
                + '<div class="modal-body form-horizontal">'
                + '<div id="uploadProgress" class="progress progress-striped active">'
                + '<div class="progress-bar" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width: 100%">'
                + '<span class="sr-only">Cargando</span>'
                + '</div>'
                + '</div>'
                + '</div>'
                + '<div class="modal-footer">'
                + '</div>'
                + '</div>'
                + '</div>';
            $("#" + idModal).html(htmlText);
        },
        appendProgress: function (selector) {
            var htmlText = '<div class="progress progress-striped active fnGlobales-progressbar ">'
                + '<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width: 100%">'
                + '<span class="sr-only">Cargando</span>'
                + '</div>'
                + '</div>';

            var a = selector.charAt(0);
            if (a !== '.' && a !== '#') selector = '#' + selector;

            $(selector).prepend(htmlText);
        },
        removeProgress: function (selector) {
            var a = selector.charAt(0);
            if (a !== '.' && a !== '#') selector = '#' + selector;

            $(selector + ' .fnGlobales-progressbar').remove();
        },
        appendOverlay: function (selector) {
            var a = selector.charAt(0);
            if (a !== '.' && a !== '#') selector = '#' + selector;

            $(selector).append('<div class="overlay"><i class="fa fa-refresh fa-spin"></i></div>');
        },
        removeOverlay: function (selector) {
            var a = selector.charAt(0);
            if (a !== '.' && a !== '#') selector = '#' + selector;

            $(selector + ' .overlay').remove();
        }
    },

    string: {
        format: function () {
            var s = arguments[0];
            for (var i = 0; i < arguments.length - 1; i++) {
                var reg = new RegExp("\\{" + i + "\\}", "gm");
                s = s.replace(reg, arguments[i + 1]);
            }
            return s;
        }
    },

    fechacorta: {
        convertDateFormat: function () {
            var string = arguments[0];
            var info = string.split('-');

            string = info[2].substring(0, 2) + '/' + info[1] + '/' + info[0];
            return info[2].substring(0, 2) + '/' + info[1] + '/' + info[0];
        }
    },

    pagination: {
        //btnNames: ['Primero', 'Anterior', 'Siguiente', 'Último'],
        btnNames: ['<<', '<', 'n', '>', '>>'],
        btnPages: 7,
        btnClass: 'pagination pagination-sm paging simple numbers',
        update: function (table, btnPages, btnNames, btnClass) {
            if (btnPages === null) btnPages = fnGlobales.pagination.btnPages;
            if (btnNames === null) btnNames = fnGlobales.pagination.btnNames;
            if (btnClass === null) btnClass = fnGlobales.pagination.btnClass;

            var paginator = $('#' + table.data('paginator'));
            var page = table.data('page');
            var fn = table.data('function');
            var nPaginas = Math.ceil(table.data('totalrows') / table.data('pagesize'));
            paginator.html(null);

            var ul = $('<ul class="pagination">');
            ul.addClass(btnClass);

            var li = $('<li class="page-item link-pagina">');
            li.addClass(page === 1 ? 'disabled' : '');
            li.append($('<a class="page-link link-red">'));
            li.children('a').html('<<'); //btnNames[0]
            li.children('a').attr('href', page === 1 ? '#' : fnGlobales.string.format('javascript:{0}(1)', fn));
            ul.append(li);

            li = $('<li class="page-item link-pagina">');
            li.addClass(page === 1 ? 'disabled' : '');
            li.append($('<a class="page-link">'));
            li.children('a').html('<');//btnNames[1]
            li.children('a').attr('href', page === 1 ? '#' : fnGlobales.string.format('javascript:{0}({1})', fn, page - 1));
            ul.append(li);

            if (nPaginas > 1) {
                var g = page;
                if (page < Math.ceil(btnPages / 2)) g = Math.ceil(btnPages / 2);
                if (page > nPaginas - Math.ceil(btnPages / 2) + 1) g = nPaginas - Math.ceil(btnPages / 2) + 1;

                var ini = g - Math.ceil(btnPages / 2) + 1 <= 0 ? 1 : g - Math.ceil(btnPages / 2) + 1;
                var fin = nPaginas <= btnPages ? nPaginas : g - Math.ceil(btnPages / 2) + btnPages;

                for (var i = ini; i <= fin; i++) {
                    li = $('<li class="page-item link-pagina">');
                    li.addClass(page === i ? 'active' : '');
                    li.append($('<a class="page-link">' + i + '</a>'));
                    li.children('a').html(i);
                    li.children('a').attr('href', page === i ? '#' : fnGlobales.string.format('javascript:{0}({1})', fn, i));
                    ul.append(li);
                }
            }

            li = $('<li class="page-item link-pagina">');
            li.addClass(page === nPaginas || nPaginas === 0 ? 'disabled' : '');
            li.append($('<a class="page-link">'));
            li.children('a').html(page);
            ul.append(li);

            li = $('<li class="page-item link-pagina">');
            li.addClass(page === nPaginas || nPaginas === 0 ? 'disabled' : '');
            li.append($('<a class="page-link">'));
            li.children('a').html('>');//btnNames[2]
            li.children('a').attr('href', page === nPaginas || nPaginas === 0 ? '#' : fnGlobales.string.format('javascript:{0}({1})', fn, page + 1));
            ul.append(li);


            li = $('<li class="page-item link-pagina">');
            li.addClass(page === nPaginas || nPaginas === 0 ? 'disabled' : '');
            li.append($('<a class="page-link">'));
            li.children('a').html('>>');//btnNames[3]
            li.children('a').attr('href', page === nPaginas || nPaginas === 0 ? '#' : fnGlobales.string.format('javascript:{0}({1})', fn, nPaginas));
            ul.append(li);

            paginator.append(ul);
        }
    },

    format: {
        decimal: function (value) {
            //return Number(value).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,');
            //return Number(value).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,').replace(',','');
            return Number(value).toFixed(2);
        },
        decimalEspecial: function (value, n) {
            var re = '\\d(?=(\\d{3})+' + (n > 0 ? '\\.' : '$') + ')';
            return Number(value).toFixed(Math.max(0, ~ ~n)).replace(new RegExp(re, 'g'), '$&,').replace(',', '');
        }
    },

    validator: {
        validarRUC: function (ruc) {
            var factores = new String("5432765432");
            var ultimoIndex = ruc.length - 1;
            var sumaTotal = 0, residuo = 0;
            var ultimoDigitoRUC = 0, ultimoDigitoCalc = 0;

            for (var i = 0; i < ultimoIndex; i++) {
                sumaTotal += (parseInt(ruc.charAt(i)) * parseInt(factores.charAt(i)));
            }
            residuo = sumaTotal % 11;

            ultimoDigitoCalc = (residuo === 10) ? 0 : ((residuo === 11) ? 1 : (11 - residuo) % 10);
            ultimoDigitoRUC = parseInt(ruc.charAt(ultimoIndex));

            return ultimoDigitoRUC === ultimoDigitoCalc;
        }
    },

    control: {
        uploadfile: function (formId) {
            $('#' + formId + ' .file-list ul li div.tools i').on('click', function (e) {
                fnGlobales.msg.confirm('Desea eliminar el archivo adjunto.', () => {
                    $('#' + formId + ' input[name="ArchivoAdjuntoId"]').val('0');
                    $('#' + formId + ' .file-list').addClass('file-empty');
                });
            });
            $('#' + formId + ' input[name="PostedFile"]').on('change', function (e) {
                $('#' + formId).submit();
            });
            $('#' + formId).submit(function (e) {
                $.ajax({
                    url: "/General/Adjunto/Upload",
                    type: 'POST',
                    data: new FormData(this),
                    cache: false,
                    processData: false,
                    contentType: false,
                    beforeSend: function () {
                        //$('#msgEditar').hide();
                        //fnGlobales.wait.append('.modal-footer');
                    },
                    complete: function () {
                        //fnGlobales.wait.remove('.modal-footer');
                    },
                    success: function (result) {
                        if (result === "") {
                            //fnGlobales.msg.confirm('El archivo no es un pdf', () => { 
                            //    $('#' + formId + ' .file-list').addClass('file-empty');
                            //});
                            fnGlobales.error.clientErrorShow('msgEditar', "Solo se Puede Cargar Archivos PDF");
                            return;
                        }
                        $('#' + formId + ' input[name="ArchivoAdjuntoId"]').val(result.ArchivoAdjuntoId);
                        $('#' + formId + ' .file-list').removeClass('file-empty');
                        $('#' + formId + ' .file-list ul li span.text a').attr('href', '/General/Adjunto/Descargar/' + result.ArchivoAdjuntoId).html(result.FileName);

                        $("#msgEditar").css("display", "none");
                        fnGlobales.msg.success('Archivo cargado correctamente.');
                    },
                    error: function (result) {
                        //fnGlobales.wait.remove('.modal-footer');
                        fnGlobales.error.show('msgEditar', result.responseText);
                    }
                });

                e.preventDefault();
            });
        }
    }
};