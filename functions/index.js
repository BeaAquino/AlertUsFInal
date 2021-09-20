const functions = require("firebase-functions");
var admin = require("firebase-admin");


exports.helloWorld = functions.https.onRequest((request, response) => {
  functions.logger.info("Hello logs!", {structuredData: true});
  response.send("Hello from Firebase!");
});//sample lang to para icheck kung gumagana yung function
