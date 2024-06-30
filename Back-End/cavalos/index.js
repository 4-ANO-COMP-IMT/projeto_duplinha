const express = require('express')
const {v4: uuidv4} = require('uuid')
const axios = require('axios')
const app = express()
app.use(express.json())

const cavalos = []

app.get('/cavalos', (req, res) => {
    res.send(cavalos)
})

app.post('/cavalos', async (req, res) => {
    let pos = 0
    const idCavalo = uuidv4()
    const infos = req.body
    cavalos[pos] = {
        idCavalo, infos
    }

    await axios.post("http://localhost:50000/eventos", {
        tipo: 'CavaloCriado',
        dados: {
            idCavalo, 
            infos
        }
      })

    res.status(201).send(cavalos[pos])
    pos++
})

app.post('/eventos', (req, res) => {
    res.status(200).send({msg: 'ok'})
  })

app.listen(4000, () => {
    console.log('Cavalos na porta 4000')
})
