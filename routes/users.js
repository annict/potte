var path = require('path');

var express = require('express');
var router = express.Router();
var Nightmare = require('nightmare');

router.get('/:username', function(req, res) {
  var nightmare = new Nightmare();
  var url = process.env.ANNICT_URL + '/shot/' + req.params.username;
  var filePath = path.join(__dirname, '..', 'tmp', 'shots', req.params.username + '.png');

  nightmare
    .viewport(1000, 1)
    .goto(url)
    .screenshot(filePath)
    .run(function(err, nightmare) {
      res.sendFile(filePath);
      console.log('Done. ' + filePath);
    });
});

module.exports = router;
