var express = require('express');
var bodyParser = require('body-parser');

var app = express();

app.use(bodyParser.urlencoded({ extended: true }));
app.set('views', 'views');
app.set('view engine', 'ejs');
app.use(express.static('public'));

app.get('/', function(req, res){
  console.log('[INFO] GET /');
  res.render('index');
});

app.listen(3030);
