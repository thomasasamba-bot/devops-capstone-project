const express = require("express");
const router = express.Router();

router.get("/", (req, res) => {
  res.json({ message: "Welcome to the DevOps Capstone API 🚀" });
});

module.exports = router;
