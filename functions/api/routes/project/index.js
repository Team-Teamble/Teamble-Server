const express = require("express");
const router = express.Router();
const { checkUser } = require("../../../middlewares/auth");

router.get("/dummy", checkUser, require("./projectDummyGET"));

module.exports = router;
