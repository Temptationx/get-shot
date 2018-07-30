#! /usr/bin/env node

const child_process = require('child_process')
const express = require('express')
const app = express()
var bodyParser = require('body-parser')

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))
app.use(express.static('public'))

app.get('/snapshot.png', (req, res)=>{
    const child = child_process.execFile(__dirname + '/raspi2png', ['-c', '8'], (error, stdout, stderr) => {
        if (error) {
            console.error(error, stderr);
            res.sendStatus(500)
            return
        }
        console.log(stdout);
        res.sendFile(__dirname + '/snapshot.png')
      });
})

const port = process.env.GET_SHOT_PORT || 8080
app.listen(port, ()=> console.log('Server Listen on ' + port))
