const express = require('express');
const router = express.Router();
const { checkUser } = require('../../../middlewares/auth');

router.get('/profile/metadata', checkUser, require('./userProfileMetadataGET'));
router.get('/profile/:userId', checkUser, require('./userProfileGET'));

module.exports = router;
