const express = require('express');
const router = express.Router();
const { checkUser } = require('../../../middlewares/auth');
const uploadImage = require('../../../middlewares/uploadImage');

router.get('/profile/metadata', checkUser, require('./userProfileMetadataGET'));
router.get('/profile/:userId', checkUser, require('./userProfileGET'));
router.put('/profile/:userId', checkUser, require('./userProfilePUT'));
router.post('/profile/photo/:userId', checkUser, uploadImage, require('./userProfilePhotoPOST'));
router.post('/poke-user', checkUser, require('./userPokeUserPOST'));
router.get('/poke-user/:userId', checkUser, require('./userPokeUserGET'));
router.post('/poke-project', checkUser, require('./userPokeProjectPOST'));
router.delete('/poke-user/:userId/:pokingUserId', checkUser, require('./userPokeUserDELETE'));
router.get('/poke-project/:userId', checkUser, require('./userPokeProjectGET'));
router.delete('/poke-project/:projectId/:pokingUserId', checkUser, require('./userPokeProjectDELETE'));

module.exports = router;
