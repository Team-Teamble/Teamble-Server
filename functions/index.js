const admin = require('firebase-admin');
let serviceAccount;

if (process.env.NODE_ENV === 'production') {
  // 배포 모드
  serviceAccount = require('./teamble-server-firebase-adminsdk-qy3jy-abef10cd0d.json');
} else {
  // 개발 모드
  serviceAccount = require('./teamble-server-local-firebase-adminsdk-uk7hm-5f9d2ca9b9.json');
}

const dotenv = require('dotenv');

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
  api: require('./api'),
};
