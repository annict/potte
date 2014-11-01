var express = require('express');
var router = express.Router();
var Nightmare = require('nightmare');

router.get('/:username', function(req, res) {
  var nightmare = new Nightmare();
  console.log('username: ' + req.params.username);
  console.log('url: ' + process.env.ANNICT_URL);

  nightmare
    .goto(process.env.ANNICT_URL)
    .screenshot('/root/shot.png')
    .run(function(err, nightmare){
      res.sendFile('/root/shot.png');
      console.log('Done.');
    });
});

module.exports = router;
