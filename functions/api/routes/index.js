const express = require('express');
const router = express.Router();

router.use('/auth', require('./auth'));
router.use('/user', require('./user'));
router.use('/project', require('./project'));
router.use('/member', require('./member'));

module.exports = router;
