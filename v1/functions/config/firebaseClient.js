const { initializeApp } = require('firebase/app');
const { getAuth } = require('firebase/auth');

let firebaseConfig;

if (process.env.NODE_ENV === 'production') {
  // 배포 모드
  firebaseConfig = {
    apiKey: 'AIzaSyDPhxX8Eq0C-GJNPCbFMZolZQE0l2EIlxY',
    authDomain: 'teamble-server.firebaseapp.com',
    projectId: 'teamble-server',
    storageBucket: 'teamble-server.appspot.com',
    messagingSenderId: '2748747111',
    appId: '1:2748747111:web:76f745d73c74b24c0673c2',
    measurementId: 'G-3BVQT7YS2M',
  };
} else {
  // 개발 모드
  firebaseConfig = {
    apiKey: 'AIzaSyDL3LyfLHPnTESsyx-IBCXlqa4q0vaAA0o',
    authDomain: 'teamble-server-local.firebaseapp.com',
    projectId: 'teamble-server-local',
    storageBucket: 'teamble-server-local.appspot.com',
    messagingSenderId: '381979822758',
    appId: '1:381979822758:web:9c9251bb8b51762c134267',
    measurementId: 'G-1KPRKVJK5K',
  };
}

const firebaseApp = initializeApp(firebaseConfig);
const firebaseAuth = getAuth(firebaseApp);

module.exports = { firebaseApp, firebaseAuth, firebaseConfig };
