# agenciaviajes

## Funcionalidad Añadida: Crear Nuevo Viaje

### Descripción
Este proyecto es una prueba y actualización del proyecto visto en clase para practicar las tecnologías Node.js, Express, Sequelize y MySQL. [Proyecto original](https://github.com/cronceroicloud/agenciaviajes)

Se ha añadido la funcionalidad para crear un nuevo viaje en el proyecto. Esta funcionalidad incluye un botón en la vista `viajes.pug` que abre un modal (`modal_viaje.pug`) con un formulario para ingresar los detalles del viaje.

### URL del Proyecto Desplegado
[Agencia de Viajes + Crear Viaje](https://agenciaviajes-v5il.onrender.com/viajes)

### Detalles de la Funcionalidad
1. **Botón para Añadir Viaje**: En la vista [viajes.pug](views/viajes.pug), se ha añadido un botón que abre un modal para crear un nuevo viaje.
2. **Formulario en el Modal**: El modal [modal_viaje.pug](views/layout/modal_viaje.pug) contiene un formulario donde se pueden ingresar los detalles del viaje, como título, precio, plazas disponibles, fechas, imagen, slug y descripción.
3. **Generación Automática del Slug**: Se ha añadido una funcionalidad en JavaScript para generar automáticamente el slug basado en el título del viaje. Esta funcionalidad permite editar el slug manualmente en caso de que haya duplicados.
    ```javascript
    document.getElementById('titulo').addEventListener('input', function() {
        const titulo = this.value;
        const slug = titulo.toLowerCase().replace(/ /g, '-').replace(/[^\w-]+/g, '');
        document.getElementById('slug').value = `viaje-${slug}`;
    });
    ```
4. **Validación y Envío del Formulario**: Al enviar el formulario, los datos se envían por método POST al controlador, la ruta para ello está definida en el archivo de routers [index.js](routers/index.js).
    ```javascript
    router.post('/modal_viaje', crearViaje);
    ```
    El controlador valida los datos y, si hay errores, redirige a la vista mostrando el modal con los errores. Para esto es importante pasarle una variable de control que reconozca el script de la vista y reabra el modal con los mensajes de error, ya que sino se recargará la vista con el modal cerrado.
    ```javascript
    // paginaController.js > crearViaje()
    if (errores.length > 0) {
        const viajes = await Viaje.findAll();
        res.render("viajes", {
            ...
            showModal: true
        });
    }
    ```
    ```javascript
    // viajes.pug
    if showModal
        script.
            document.addEventListener('DOMContentLoaded', function() {
                var myModal = new bootstrap.Modal(document.getElementById('addViajeModal'));
                myModal.show();
            });
    ```
    Si no hay errores, añade el viaje y muestra la vista de los viajes actualizada.

