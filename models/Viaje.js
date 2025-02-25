import Sequelize from "sequelize";
import db from "../config/db.js";

export const Viaje = db.define("viaje", {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true // Asegura que el `id` sea autoincremental
    },
    titulo: {
        type: Sequelize.STRING
    },
    precio: {
        type: Sequelize.STRING
    },
    fecha_ida: {
        type: Sequelize.DATE
    },
    fecha_vuelta: {
        type: Sequelize.DATE
    },
    imagen: {
        type: Sequelize.STRING
    },
    descripcion: {
        type: Sequelize.STRING
    },
    disponibles: {
        type: Sequelize.STRING
    },
    slug: {
        type: Sequelize.STRING
    },
});