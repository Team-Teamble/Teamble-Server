const express = require('express');
const router = express.Router();
const { checkUser } = require('../../../middlewares/auth');

router.get('/metadata', checkUser, require('./projectMetadataGET'));
router.post('/', require('./projectPOST'));
router.post('/member', checkUser, require('./projectMemberPOST'));

router.get('/search/metadata', require('./projectSearchMetadataGET'));

router.delete('/:projectId', checkUser, require('./projectDELETE'));
router.get('/:projectId', require('./projectGET'));
module.exports = router;
