const express = require('express');
const router = express.Router();

router.get('/metadata', require('./memberMetadataGET'));
router.post('/', require('./memberPOST'));

module.exports = router;
