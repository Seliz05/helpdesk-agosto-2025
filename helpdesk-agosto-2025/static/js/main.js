// Interacciones con jQuery aquí
$(document).ready(function() {
    // Ejemplo: confirmar eliminación
    $('.btn-danger').click(function() {
        return confirm('Are you sure?');
    });
});