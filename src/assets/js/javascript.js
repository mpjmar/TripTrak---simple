const PORT = 3000;
const ENDPOINT_SERVER = "http://localhost";
const URL_BASE = `${ENDPOINT_SERVER}:${PORT}/`;
const ENDPOINT_OBTENER_VIAJES = "viajes";
const ENDPOINT_INSERTAR_ELIMINAR_ACTUALIZAR_VIAJE = "viaje";

const botonbuscartodosviajes = document.getElementById("botonbuscartodos");
const botonbusquedaporciudad = document.getElementById("botonbusquedaporciudad");
const botoninsertarviaje = document.getElementById("botoninsertarviaje");
const botoneliminarviaje = document.getElementById("botoneliminarviaje");
const botonactualizarviaje = document.getElementById("botonactualizarviaje");
const busquedaporpais = document.getElementById("busquedaporpais");
const listaviajes = document.getElementById("listaviajes");
const mensajesalida = document.getElementById("mensajesalida");

function mostrarViajes(viajes) {
    listaviajes.innerHTML = "";
    mensajesalida.textContent = "";

    if (listaviajes.length === 0) {
        mensajesalida.textContent = "<p>Aún no tienes viajes.</p>";
    } else {
        viajes.forEach(viaje => { 
            let div = document.createElement("div");
            div.classList.add("grid-item");
            div.innerHTML = 
                `<h3>${viaje.nomViaj}</h3>
                <p><strong>Inicio:</strong> ${viaje.fechInic}</p>
                <p><strong>Fin:</strong> ${viaje.fechFin}</p>`;
            listaviajes.appendChild(div);
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
            mensajesalida.innerHTML = `<p><b>Error</b>: ${error}</p>`;
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
        mensajesalida.innerHTML = `<p><b>Error</b>: ${error}</p>`;
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
        mensajesalida.innerHTML = `<p><b>Error</b>: ${error}</p>`;
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
        mensajesalida.innerHTML = `<p><b>Error</b>: ${error}</p>`;
    });
}

botonbuscartodosviajes.addEventListener("click", () => listarViajes());
botonbusquedaporciudad.addEventListener("click", () => listarViajes("ciudad",
    botonbusquedaporciudad.value.trim()));
botoninsertarviaje.addEventListener("click", () => {
    const nuevo_viaje = {
        nomViaj: "00Prueba",
        fechInic: "2026/07/09",
        fechaFin: "2026/08/09"
    };
    insertarViaje(nuevo_viaje);
});
botoneliminarviaje.addEventListener("click", () => {
    eliminarViaje(idViaje);
});
botonactualizarviaje.addEventListener("click", () => {
    const viaje = {
        nomViaj: "Maldivas",
        fechInic: "2026/10/10",
        fechaFin: "2026/10/20"
    }
    actualizarViaje(viaje);
});