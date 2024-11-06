// función gcod(longitud) {
// constante coche = '0123456789';
// deje que cod = '';

// para (sea i = 0; i < longitud; i++) {
// const ranI = Math.floor(Math.random() * car.length);
// bacalao += coche[ranI];
// }

// devolver bacalao;
// }

function Alerta() {
    // constante rancod = gcod(4);
    const alerta = document.getElementById('alerta');
    // const mensaje = document.getElementById('men');
    // mensaje.textContent = "Tu código es: " + rancod;
    alerta.style.display = 'flex';
    const usu = document.getElementById('usu').value;
    
    const usua = document.getElementById('bien');
    usua.textContent = "¡Bienvenid@ " + usu + "! ";
}


function ing() {
    const rancod = document.getElementById('men').textContent.split(": ")[1];
    const ti = document.getElementById('bien').textContent.split(": ")[1];
    const doc = documento.getElementById('doc').value;
    const cl = document.getElementById('cod').value;
    
    if  (doc === ti && rancod === cl) {
        ventana.ubicacion.href = "index.html";
    } else {
        ventana.location.href = "index_1.html";
        alert("Revise bien la información.");
    }
}