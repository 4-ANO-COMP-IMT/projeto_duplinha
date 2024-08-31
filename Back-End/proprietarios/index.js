const express = require('express')
const cors = require('cors')
const {v4: uuidv4} = require('uuid')
const axios = require('axios')
const app = express()
app.use(express.json())
app.use(cors())

const proprietarios = []
let pos = 0

app.get('/proprietarios', (req, res) => {
    res.send(proprietarios)
})

app.post('/proprietarios', async (req, res) => {
    const idProprietario = uuidv4()
    const infos = req.body
    proprietarios[pos] = {
        idProprietario, infos
    }
    console.log('Criou o proprietário')

    await axios.post("http://localhost:50000/eventos", {
        tipo: 'ProprietarioCriado',
        dados: {
            idProprietario,
            infos
        }
      })

      console.log('Enviou proprietário para os eventos')

    res.status(201).send(proprietarios[pos])
    pos++
})

app.post('/eventos', (req, res) => {
    res.status(200).send({msg: 'ok'})
  })

app.listen(5000, () => {
    console.log('Proprietários na porta 5000')
})