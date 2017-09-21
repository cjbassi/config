#!/usr/bin/node

var fs = require('fs');
var express = require('express')
var app = express()

var filename = process.argv[2];

fs.readFile(filename, 'utf8', function (err,data) {
  if (err) {
    return console.log(err);
  }
  app.get('/', function (req, res) {
    res.send(data)
  })
});

app.listen(1337);
