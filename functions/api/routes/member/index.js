const express = require('express');
const router = express.Router();

router.get('/metadata', require('./memberMetadataGET'));

module.exports = router;
