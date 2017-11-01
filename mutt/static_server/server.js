#!/usr/bin/env node

const fs = require('fs')
const opn = require('opn')
const express = require('express')
const app = express()

const filename = process.argv[2]


let main = () => {

  fs.readFile(filename, 'utf8', (err, data) => {
    app.get('/', (req, res) => {
      res.send(data)
    })
    opn('http://localhost:3000', {app: 'google-chrome-stable'})
  })

  app.listen(3000)

}

if (require.main === module)
    main()
