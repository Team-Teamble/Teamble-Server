const admin = require("firebase-admin");
const serviceAccount = require("./teamble-server-firebase-adminsdk-qy3jy-abef10cd0d.json");
const dotenv = require("dotenv");

dotenv.config();

let firebase;
if (admin.apps.length === 0) {
  firebase = admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
  });
} else {
  firebase = admin.app();
}

module.exports = {
  api: require("./api"),
};
