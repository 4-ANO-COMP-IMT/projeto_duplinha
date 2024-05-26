const express = require('express')
const {v4: uuidv4} = require('uuid')
const axios = require('axios')
const app = express()
app.use(express.json())

const cavalos = {}

app.get('/cavalos', (req, res) => {
    res.send(cavalos)
})

app.post('/cavalos', (req, res) => {
    const idCavalo = uuidv4()
    const {texto} = req.body

    res.status(201).send(cavalos[idCavalo])
})

app.listen(4000, () => {
    console.log('Cavalos na porta 4000')
})