const express = require('express')
const cors = require('cors')
const {v4: uuidv4} = require('uuid')
const axios = require('axios')
const app = express()
app.use(express.json())
app.use(cors())

const cavalos = []
let pos = 0

const funcoes = {
    ProprietarioCriado: (proprietario) => {
        console.log('Entrei na função ProprietarioCriado')
        //Seleciona array de cavalos do proprietário criado
        const cavalosParaAtualizar = proprietario.infos.id_cavalos
        console.log('Cavalos para atualizar: ' + cavalosParaAtualizar)
        //Adiciona propritário a cada cavalo selecionado no cadastro
        cavalosParaAtualizar.forEach(IDcavalo => {
            console.log("ID Cavalo: " + IDcavalo)
            const cavalo_cadastrado = cavalos.find(cavalo_cad => cavalo_cad.idCavalo === IDcavalo)
            console.log("Cavalo cadastrado: " + cavalo_cadastrado.idCavalo)
            cavalo_cadastrado.infos.id_proprietarios.push(proprietario.idProprietario)
            //Substitui as informações do cavalo no sistema
            const indice = cavalos.findIndex(cavalo_cad => cavalo_cad.idCavalo === cavalos.idCavalo)
            cavalos[indice] = cavalo_cadastrado
        })
    }
}

app.get('/cavalos', (req, res) => {
    res.send(cavalos)
})

app.post('/cavalos', async (req, res) => {
    const idCavalo = uuidv4()
    const infos = req.body
    cavalos[pos] = {
        idCavalo, infos
    }

    await axios.post("http://barramento-de-eventos-service:50000/eventos", {
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
    try{
        funcoes[req.body.tipo](req.body.dados)
    } catch(err){}
    res.status(200).send({msg: 'ok'})
  })

app.listen(4000, () => {
    console.log('Cavalos na porta 4000')
})
