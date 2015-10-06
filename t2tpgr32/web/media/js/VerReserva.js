$(document).ready(
    function(){//recortar
        var p = document.getElementsByClassName("pdescripcion");
        for (i = 0; i < p.length; i++)
        {
            var palabras = $(p[i]).text().split(' ');
            var recortado ="";
            if (palabras.length > 9)
            {
                for (j = 0; j < 9; j++)
                {
                    recortado = recortado + palabras[j];
                    if(j !== 8)
                        recortado = recortado + " ";
                    else
                        recortado = recortado + "...";
                }
                $(p[i]).text(recortado);
            }
            $(p[i]).css("margin","0px");
        }
    }
);


