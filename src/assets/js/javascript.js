const PORT = 3000;
const ENDPOINT_SERVER = "http://localhost";
const URL_BASE = `${ENDPOINT_SERVER}:${PORT}/`;
const ENDPOINT_OBTENER_VIAJES = "viajes";
const ENDPOINT_INSERTAR_ELIMINAR_ACTUALIZAR_VIAJE = "viaje";

document.addEventListener('DOMContentLoaded', function() {
    const loginForm = document.getElementById("login-form");
    const errorDiv = document.getElementById("error-message");
    const successDiv = document.getElementById("success-message");
    const mensajeSalida = document.getElementById("mensaje-salida");

    const botonBuscarTodosViajes = document.getElementById("boton-buscar-todos");
    const botonBusquedaPorPais = document.getElementById("boton-busqueda-por-pais");
    const botonInsertarViaje = document.getElementById("boton-insertar-viaje");
    const botonEliminarViaje = document.getElementById("boton-eliminar-viaje");
    const botonActualizarViaje = document.getElementById("boton-actualizar-viaje");
    const listaViajes = document.getElementById("lista-viajes");

    loginForm.addEventListener("submit", function(event) {
        event.preventDefault();
        const formData = new FormData(loginForm);

        fetch('/login', {
            method: 'POST',
            body: formData
        })
        .then(response => {
            if (response.ok) {
                window.location.href = '/pagina-principal';
            } else {
                errorDiv.hidden = false;
            }
        })
        .catch(() => {
            errorDiv.hidden = false;
            errorDiv.textContent = "Error de red. Inténtalo de nuevo.";
        });
    });

    function mostrarViajes(viajes) {
        listaViajes.innerHTML = "";
        mensajeSalida.textContent = "";

        if (listaViajes.length === 0) {
            mensajeSalida.textContent = "<p>Aún no tienes viajes.</p>";
        } else {
            viajes.forEach(viaje => { 
                let div = document.createElement("div");
                div.classList.add("grid-item");
                div.innerHTML = 
                    `<h3>${viaje.nomViaj}</h3>
                    <p><strong>Inicio:</strong> ${viaje.fechInic}</p>
                    <p><strong>Fin:</strong> ${viaje.fechFin}</p>`;
                listaViajes.appendChild(div);
            });
        }
    }

    function consultarViajes(filtro = "todos", valor = "") {
        const ENDPOINT_SERVER_VIAJES = new URL(ENDPOINT_OBTENER_VIAJE, URL_BASE);

        switch (filtro) {
            case "pais":
                ENDPOINT_SERVER_VIAJES.searchParams.append("pais", valor);
                break;
        }

        fetch(ENDPOINT_SERVER_VIAJES)
            .then(response => {
                if (!response.ok) {
                    throw new Error("Error al obtener los viajes");
                }
                return response.json();
            })
            .then(datos_viajes => {
                mostrarViajes(datos_viajes);
            })
            .catch(error => {
                console.error("Error consultando los viajes:", error);
                mensajeSalida.innerHTML = `<p><b>Error</b>: ${error}</p>`;
            });
    }

    function insertarViaje(viaje) {
        const ENDPOINT_SERVER_INSERTAR_VIAJES = new 
            URL(ENDPOINT_INSERTAR_ELIMINAR_ACTUALIZAR_VIAJE, URL_BASE);

        fetch(ENDPOINT_SERVER_INSERTAR_VIAJES, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(viaje)
        })
        .then(response => {
            if (!response.ok) {
                throw new Error("Error al insertar el viaje.")
            }
            return response.json();
        })
        .then(datos => {
            console.log(datos);
            alert(datos.mensaje);
        })
        .catch(error => {
            console.error("Error al insertar el viaje: ", error);
            mensajeSalida.innerHTML = `<p><b>Error</b>: ${error}</p>`;
        });
    }

    function eliminarViaje(idViaje) {
        const ENDPOINT_SERVER_ELIMINAR_VIAJES = new 
            URL(ENDPOINT_INSERTAR_ELIMINAR_ACTUALIZAR_VIAJE + `/${idViaje}`, URL_BASE);
        
        fetch(ENDPOINT_SERVER_ELIMINAR_VIAJES, {
            method: "DELETE"
        })
        .then(response => {
            if (!response.ok) {
                throw new Error("Error al eliminar el viaje.");
            }
            return response.json();
        })
        .then(datos => {
            console.log(datos);
            alert(datos.mensaje);
        })
        .catch(error => {
            console.error("Error al eliminar el viaje: ", error);
            mensajeSalida.innerHTML = `<p><b>Error</b>: ${error}</p>`;
        });
    }

    function actualizarViaje(viaje) {
        const ENDPOINT_SERVER_ACTUALIZAR_VIAJES = new
            URL(ENDPOINT_INSERTAR_ELIMINAR_ACTUALIZAR_VIAJE + `/${viaje.idViaje}`, URL_BASE);
        
        fetch(ENDPOINT_SERVER_ACTUALIZAR_VIAJES, {
            method: "PUT",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(viaje)
        })
        .then(response => {
            if (!response.ok) {
                throw new Error("Error al actualizar el viaje.")
            }
            return response.json();
        })
        .then(datos => {
            console.log(datos);
            alert(datos.mensaje);
        })
        .catch(error => {
            console.error("Error al actulizar el viaje: ", error);
            mensajeSalida.innerHTML = `<p><b>Error</b>: ${error}</p>`;
        });
    }

    botonBuscarTodosViajes.addEventListener("click", () => listarViajes());

    botonBusquedaPorPais.addEventListener("click", () => {
        const pais = prompt("Ingrese el país para filtrar los viajes:")
        if (pais) {
            listarViajes("pais", pais);
        } else {
            alert("Por favor, ingrese un país válido.");
        }
    });    

    botonInsertarViaje.addEventListener("click", () => {
        const nuevo_viaje = {
            nomViaj: "00Prueba",
            fechInic: "2026/07/09",
            fechaFin: "2026/08/09"
        };
        insertarViaje(nuevo_viaje);
    });

    botonEliminarViaje.addEventListener("click", () => {
        eliminarViaje(idViaje);
    });

    botonActualizarViaje.addEventListener("click", () => {
        const viaje = {
            nomViaj: "Maldivas",
            fechInic: "2026/10/10",
            fechaFin: "2026/10/20"
        }
        actualizarViaje(viaje);
    });
});