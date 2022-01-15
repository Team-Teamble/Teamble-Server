const express = require('express');
const router = express.Router();
const { checkUser } = require('../../../middlewares/auth');

router.get('/metadata', checkUser, require('./projectMetadataGET'));

module.exports = router;
