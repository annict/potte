var express = require('express');
var router = express.Router();

router.get('/', function(req, res) {
  res.send('スクリーンショットを撮影するAPIサーバ、なので。')
});

module.exports = router;
