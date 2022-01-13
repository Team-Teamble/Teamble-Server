const { initializeApp } = require('firebase/app');
const { getAuth } = require('firebase/auth');

const firebaseConfig = {
  apiKey: 'AIzaSyDPhxX8Eq0C-GJNPCbFMZolZQE0l2EIlxY',
  authDomain: 'teamble-server.firebaseapp.com',
  projectId: 'teamble-server',
  storageBucket: 'teamble-server.appspot.com',
  messagingSenderId: '2748747111',
  appId: '1:2748747111:web:76f745d73c74b24c0673c2',
  measurementId: 'G-3BVQT7YS2M',
};

const firebaseApp = initializeApp(firebaseConfig);
const firebaseAuth = getAuth(firebaseApp);

module.exports = { firebaseApp, firebaseAuth, firebaseConfig };
