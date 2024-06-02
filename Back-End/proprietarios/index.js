const express = require('express')
const {v4: uuidv4} = require('uuid')
const axios = require('axios')
const app = express()
app.use(express.json())

const proprietarios = {}

app.get('/proprietarios', (req, res) => {
    res.send(proprietarios)
})

app.post('/proprietarios', (req, res) => {
    const idProprietario = uuidv4()
    const infos = req.body
    proprietarios[idProprietario] = {
        idProprietario, infos
    }

    res.status(201).send(proprietarios[idProprietario])
})

app.listen(5000, () => {
    console.log('Proprietários na porta 5000')
})