const express = require('express')
const {v4: uuidv4} = require('uuid')
const axios = require('axios')
const app = express()
app.use(express.json())

const proprietarios = {}

app.get('/proprietarios', (req, res) => {
    res.send(proprietarios)
})

app.post('/proprietarios', async (req, res) => {
    const idProprietario = uuidv4()
    const infos = req.body
    proprietarios[idProprietario] = {
        idProprietario, infos
    }

    await axios.post("http://localhost:50000/eventos", {
        tipo: 'ProprietarioCriado',
        dados: {
            idProprietario, 
            infos
        }
      })

    res.status(201).send(proprietarios[idProprietario])
})

app.post('/eventos', (req, res) => {
    console.log(req.body)
    res.status(200).send({msg: 'ok'})
  })

app.listen(5000, () => {
    console.log('Proprietários na porta 5000')
})