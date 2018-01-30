    function soloLetras(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
       especiales = "8-37-39-46";
       //-258-259-260-261
       tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }

        if(letras.indexOf(tecla)==-1 && !tecla_especial){
          
            return false;
        }
    }


        function soloNumeros(e){
            key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = "-+0123456789";
       especiales = "";

       tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }

        if(letras.indexOf(tecla)==-1 && !tecla_especial){
          
            return false;
        }
    }


            function Documentos(e){
                key = e.keyCode || e.which;
                 //alert(key);
                 if (key === 8 || key === 173) { return true; }
       tecla = String.fromCharCode(key).toLowerCase();
       letras = "-0123456789";
       especiales = "";

       tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }

        if(letras.indexOf(tecla)==-1 && !tecla_especial){
          
            return false;
        }
    }

/*
  function preventBack(){window.history.forward();}
  setTimeout("preventBack()", 0);
  window.onunload=function(){null};
*/