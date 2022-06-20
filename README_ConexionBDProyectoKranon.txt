Configuracion de conexion a base de datos del proyecto: sol_webApp_LibreriaKranon


<connectionStrings>
    <add name="LKEntities" connectionString="metadata=res://*/LKModel.csdl|res://*/LKModel.ssdl|res://*/LKModel.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=DESKTOP-JJL3M6U\ALEX;initial catalog=LibreriaKranon;persist security info=True;user id=sa;password=12345;MultipleActiveResultSets=True;App=EntityFramework&quot;" providerName="System.Data.EntityClient" />
</connectionStrings>

Esta cadena de conexion se encuentra en el:

        - "App.Config" de la biblioteca de clases -Data- en la capa: 3.Data
        - "Web.config" del proyecto - webApp_LibreriaKranon - en la capa: 1.UI

   En ambos archivos se modifica la cadena de conexion de los siguientes parametros:

          - data source=(Nombre del servidor local donde se encuentre la base de datos)

          Autenticación por SQL Server Authentication
          - user id=(usuario con acceso a la base de datos local)
          - password=(contraseña del usuario con acceso a base de datos local)