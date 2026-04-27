const PORT = 3000;
const URL = "http://localhost:";
const ENDPOINT_OBTENER_VIAJES = "viajes";
const ENDPOINT_INSERTAR_ELIMINAR_ACTUALIZAR_VIAJES = "viajes";

const botonbuscartodosviajes = document.getElementById("botonbuscartodos");
const botonbusquedaporciudad = document.getElementById("botonbusquedaporciudad");
const botoninsertarviaje = document.getElementById("botoninsertarviaje");
const botoneliminarviaje = document.getElementById("botoneliminarviaje");
const botonactualizarviaje = document.getElementById("botonactualizarviaje");
const busquedapordestino = document.getElementById("busquedapordestino");
const listaviajes = document.getElementById("listaviajes");
const mensajesalida = document.getElementById("mensajesalida");

function mostrarViajes(listaviajes) {
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