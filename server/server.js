import fs from "fs";
import cors from "cors";
import https from "https";
import dotenv from "dotenv";
import bodyParser from "body-parser";
import express from "express";

// Load environment variables from .env file
dotenv.config({ path: ".env" });

// Instantiate an Express application
const app = express();
app.use(cors())
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))

// Define port numbers
const ports = {
    default: process.env.DEFAULT_PORT || 8080,
    frontend: process.env.FRONTEND_PORT || 3000,
};

// Options for the HTTPS server
const serverOptions = {
    key: fs.readFileSync("certs/key.pem"),
    cert: fs.readFileSync("certs/cert.pem")
}

// Callback function to let us know that the server is running
const successMessage = (port) =>
    console.log(`App running at https://localhost:${port}`);

// Create an HTTPS server that listens on port 3000 and use the callback function
https
    .createServer(serverOptions, app)
    .listen(ports.frontend, successMessage(ports.frontend));

app.get("/", (req, res) => {
    res.send("Hello, Express!!");
});

