var express = require('express');
var os = require('os');

// Constants
var PORT = 80;
//var hostname = os.hostname();

// App
var app = express();
app.get('/', function (req, res) {
  res.send('hello World/n');
//  res.send(os.networkInterfaces()); 
});

app.listen(PORT);
console.log('Running on http://localhost:' + PORT);
