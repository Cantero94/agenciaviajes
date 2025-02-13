import { Viaje } from "../models/Viaje.js";
import { Testimonial } from "../models/Testimoniales.js";
import { Cliente } from "../models/cliente.js";
import moment from "moment";
import nodemailer from "nodemailer";

const paginaInicio = async (req, res) => {
  const promiseDB = [];
  //Con esto hacemos dos consultas en paralelo
  promiseDB.push(Viaje.findAll({ limit: 3 }));
  promiseDB.push(Testimonial.findAll({ limit: 3, order: [["Id", "DESC"]]}));

  try {
    const resultado = await Promise.all(promiseDB);

    res.render("inicio", {
      pagina: "Inicio",
      clase: "home",
      viajes: resultado[0], //En el la posición 0 de la promesa está el resultado de la primera consulta, viajes
      testimonios: resultado[1], //En el la posición 1 de la promesa está el resultado de la segunda consulta, testimonios
      moment
    });
  } catch (err) {
    console.log(err);
  }
};

const paginaNosotros = (req, res) => {
  res.render("nosotros", {
    pagina: "Nosotros",
    moment
  });
};

const paginaViajes = async (req, res) => {
  const viajes = await Viaje.findAll();

  res.render("viajes", {
    pagina: "Viajes Disponibles",
    viajes,
    moment
  });
};

const paginaDetallesViajes = async (req, res) => {
  // req.params te va a dar los :slug que ponemos al pasarlo del router
  const { slug } = req.params;
  try {
    const resultado = await Viaje.findOne({ where: { slug /* : slug */ } });
    res.render("viaje", {
      pagina: "Información del Viaje",
      resultado,
      moment
    });
  } catch (error) {
    console.log(error);
  }
};

const crearViaje = async (req, res) => {
  const { titulo, precio, disponibles, fecha_ida, fecha_vuelta, imagen, slug, descripcion } = req.body;
  const errores = [];
  if (titulo.trim() === "") {
    errores.push({ mensaje: "El título está vacío" });
  }
  if (precio.trim() === "") {
    errores.push({ mensaje: "El precio está vacío" });
  }
  if (disponibles.trim() === "") {
    errores.push({ mensaje: "El número de plazas disponibles está vacío" });
  }
  if (fecha_ida.trim() === "") {
    errores.push({ mensaje: "La fecha de ida está vacía" });
  }
  if (fecha_vuelta.trim() === "") {
    errores.push({ mensaje: "La fecha de vuelta está vacía" });
  }
  if (imagen.trim() === "") {
    errores.push({ mensaje: "La imagen está vacía" });
  }
  if (slug.trim() === "") {
    errores.push({ mensaje: "El slug está vacío" });
  }
  if (descripcion.trim() === "") {
    errores.push({ mensaje: "La descripción está vacía" });
  }
  // Check if slug already exists
  const existingViaje = await Viaje.findOne({ where: { slug } });
  if (existingViaje) {
    errores.push({ mensaje: "El slug ya existe" });
  }

  if (errores.length > 0) {
    const viajes = await Viaje.findAll(); // Obtener todos los viajes para renderizar la vista correctamente
    res.render("viajes", {
      pagina: "Viajes Disponibles",
      errores,
      titulo,
      precio,
      disponibles,
      fecha_ida,
      fecha_vuelta,
      imagen,
      slug,
      descripcion,
      viajes,
      moment
    });
  } else {
    try {
      await Viaje.create({
        titulo,
        precio,
        disponibles,
        fecha_ida,
        fecha_vuelta,
        imagen,
        slug,
        descripcion
      });
      res.redirect("/viajes");
    } catch (error) {
      console.log(error);
    }
  }
};

const paginaComprar = async (req, res) => {
  // req.params te va a dar los :slug que ponemos al pasarlo del router
  const { slug } = req.params;
  try {
    //Me traigo una sola columna y lo hago con un where donde coincida el slug
    const resultado = await Viaje.findOne({ where: { slug: slug } });
    res.render("comprar", {
      pagina: "Comprar un Viaje",
      resultado,
      moment
    });
  } catch (error) {
    console.log(error);
  }
};

const guardarCompra = async (req, res) => {
  const { nombre, apellidos, correo, telefono, slug } = req.body;

  const errores = [];

  if (nombre.trim() === "") {
    errores.push({ mensaje: "El nombre está vacío" });
  }
  if (correo.trim() === "") {
    errores.push({ mensaje: "El correo está vacío" });
  }
  if (telefono.trim() === "") {
    errores.push({ mensaje: "El teléfono está vacío" });
  }
  if (apellidos.trim() === "") {
    errores.push({ mensaje: "Los apellidos están vacío" });
  }

  const resultado2 = await Viaje.findOne({ where: { slug: slug } });

  if (errores.length > 0) {
    //Debemos volver a la vista y mostrar los errores

    res.render("comprar", {
      pagina: "Comprar un viaje",
      errores,
      nombre,
      correo,
      apellidos,
      telefono,
      resultado: resultado2
    });
  } else {
    //Almacenar el mensaje en la BBDD
    // Crear un objeto de transporte de Nodemailer
    const transporter = nodemailer.createTransport({
      service: "gmail", // Usando Gmail como servicio de correo
      auth: {
        user: "jc.canterito@gmail.com", // Reemplaza con tu correo de Gmail
        pass: "nvcf imwa wwlp wkgd" // Reemplaza con tu contraseña o una contraseña de aplicación
      },
    });
    try {
      // Crear cliente en la base de datos
      await Cliente.create({
        nombre,
        apellidos,
        correoelectronico: correo,
        telefono
      });

      // Configurar el mensaje de correo
      const mailOptions = {
        from: `jc.canterito@gmail.com`, // Remitente
        to: "jccanterogarcia@gmail.com", // Destinatario
        subject: `Compra realizada por ` + nombre, // Asunto
        // Contenido del correo
        text:
          "Nombre: " +
          nombre +
          "\n" +
          "Apellidos: " +
          apellidos +
          "\n" +
          "Correo: " +
          correo +
          "\n" +
          "Teléfono: " +
          telefono +
          "\n" +
          "Viaje: " +
          resultado2.titulo +
          "\n" +
          "Precio: " +
          resultado2.precio +
          " euros\n" +
          "Fecha de ida: " +
          resultado2.fecha_ida +
          "\n" +
          "Fecha de vuelta: " +
          resultado2.fecha_vuelta +
          "\n" +
          "Disponibles: " +
          resultado2.disponibles +
          "\n" +
          "Descripción: " +
          resultado2.descripcion,
      };

      await transporter.sendMail(mailOptions);
      //res.redirect('/comprar'); //Guardo en la base de datos y lo envío a la misma vista
      res.render("enviarmail.pug", {
        pagina: "Comprar un viaje",
        correcto: "si",
        nombre,
        correo,
        apellidos,
        telefono,
        resultado: resultado2
      });
    } catch (error) {
      console.log(error);
    }
  }
};

const paginaTestimonios = async (req, res) => {
  try {
    const testimonios = await Testimonial.findAll({
      limit: 6,
      order: [["Id", "DESC"]],
    });
    res.render("testimonios", {
      pagina: "Testimonios",
      testimonios,
      moment
    });
  } catch (err) {
    console.log(err);
  }
};

const guardarTestimonios = async (req, res) => {
  const { nombre, correo, mensaje } = req.body;
  //console.log(req.body);
  const errores = [];

  if (nombre.trim() === "") {
    errores.push({ mensaje: "El nombre está vacío" });
  }
  if (correo.trim() === "") {
    errores.push({ mensaje: "El correo está vacío" });
  }
  if (mensaje.trim() === "") {
    errores.push({ mensaje: "El mensaje está vacío" });
  }

  if (errores.length > 0) {
    //Debemos volver a la vista y mostrar los errores
    const testimonios = await Testimonial.findAll({
      limit: 6,
      order: [["Id", "DESC"]],
    });

    res.render("testimonios", {
      pagina: "Testimonios",
      errores,
      nombre,
      correo,
      mensaje,
      testimonios
    });
  } else {
    //Almacenar el mensaje en la BBDD
    try {
      await Testimonial.create({
        nombre,
        correoelectronico: correo,
        mensaje
      });
      res.redirect("/testimonios"); //Guardo en la base de datos y lo envío a la misma vista
    } catch (error) {
      console.log(error);
    }
  }
};

export {
  paginaInicio,
  paginaViajes,
  paginaTestimonios,
  paginaNosotros,
  paginaDetallesViajes,
  guardarTestimonios,
  guardarCompra,
  paginaComprar,
  crearViaje
};
