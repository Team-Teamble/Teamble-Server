const express = require('express');
const router = express.Router();
const { checkUser } = require('../../../middlewares/auth');
const uploadImage = require('../../../middlewares/uploadImage');

router.get('/metadata', checkUser, require('./projectMetadataGET'));
router.get('/search/metadata', require('./projectSearchMetadataGET'));

router.post('/', require('./projectPOST'));
router.post('/member', checkUser, require('./projectMemberPOST'));
router.delete('/:projectId', checkUser, require('./projectDELETE'));
router.post('/photo/:projectId', checkUser, uploadImage, require('./projectPhotoPOST'));
module.exports = router;
