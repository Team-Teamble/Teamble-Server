const express = require('express');
const router = express.Router();
const { checkUser } = require('../../../middlewares/auth');
const uploadImage = require('../../../middlewares/uploadImage');

router.get('/profile/metadata', checkUser, require('./userProfileMetadataGET'));
router.get('/profile/:userId', checkUser, require('./userProfileGET'));
router.put('/profile/:userId', checkUser, require('./userProfilePUT'));
router.post('/profile/photo/:userId', checkUser, uploadImage, require('./userProfilePhotoPOST'));
router.post('/poke-user', checkUser, require('./userPokeUserPOST'));

module.exports = router;
