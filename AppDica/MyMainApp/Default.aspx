<%@ Page Title="" Language="C#" MasterPageFile="~/MasterInicio.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="dica.Default" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="CPHPrincipal">
   
        <div align="center">
            <asp:Label ID="LblTitulo" runat="server" Text="BIENVENIDO A PIXELS CAPS" Font-Bold="True" Font-Size="30pt" ForeColor="#FF6A00"></asp:Label>
           
          </div>  <%--titulo--%>
    <asp:Panel ID="Panel1" runat="server">
         
         <div class="container-fluid"> <%--contenido de todo el texto  --%>   
             
             <p align="justify">El Ministerio de Economía de El Salvador, considera importante apoyar el desarrollo de nuevas actividades productivas para renovar el tejido
                  productivo nacional, motivo por el cual desarrollo el programa PIXELS CAPS Videojuegos el cual busca desarrollar oportunidades laborales 
                 para la juventud salvadoreña en áreas relacionadas a los videojuegos dentro del marco de las industrias creativas, apoyando de esa manera
                  la creación de empleo en la juventud económicamente activa, desarrollando capacidad técnica para la industria nacional y ampliando la 
                 capacidad productiva de la misma mediante la creación de empresas, asociaciones empresariales y emprendimientos comerciales.</p>
              <br />
             <asp:Label ID="Label1" runat="server" Text="PIXELS CAPS" Font-Bold="True" ForeColor="#3366CC"></asp:Label><br /><br />
                 <ul>
                     <li><b>PIXELS CAPS Animación</b></li>
                     Es una iniciativa conjunta entre el MINEC, GIZ y otras instituciones privadas<br /><br />
                     <li><b> Objetivo General</b></li>
                     Apoyar el desarrollo de la industria de animación digital salvadoreña.<br /> <br />
                     <li><b>Objetivos Específicos</b></li>
                     Preparar talento local para su inclusión en el mercado laboral de las industrias creativas.<br /><br />
                     <li><b>Alcances del programa</b></li>
                     Proveer pasantías remuneradas a los miembros del programa <br />
                     Fomentar el emprendedurismo en animación digital <br /><br />
                     <li><b>¿Quiénes pueden participar del programa?</b></li>
                     El programa está abierto para jóvenes entre los 18 y 25 años, que presenten talento y/o interés por la animación digital.<br /><br />
                     <li><b>¿Cuánto dura el proyecto?</b></li>
                     El programa se realiza anualmente y tiene una duración de 5 meses.<br /><br />
                     <li><b>Beneficios para el participante</b></li>
                      Acceso a talleres especializados en temas relacionados a animación digital.<br />
                      Pasantías remuneradas. <br /><br />
                      <li><b>Compromisos del participante.</b></li>
                      Desarrollar cortometrajes animados originales e inéditos.<br />
                        Las producciones tendrán una duración entre los 30 segundos y 5 minutos.<br />
                        Uso de técnicas de animación aprendidas durante el programa.
            </ul>
                 
          </div> <%--fin de contenido  --%>   
            </asp:Panel>
       
    
</asp:Content>

