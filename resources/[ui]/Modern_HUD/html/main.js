
$(function () {


    window.addEventListener("message", function (event) {
        const contenedorSlots = document.querySelector('#container__status__hud')
        const vidaSlot = document.querySelector('#vida')
        const escudoSlot = document.querySelector('#escudo')
        const comidaSlot = document.querySelector('#comida')
        const aguaSlot = document.querySelector('#agua')
        const estaminaSlot = document.querySelector('#estamina')
        const oxigenoSlot = document.querySelector('#oxigeno')
        const idPlayer = document.querySelector('#idPlayer')
        const Accountmoney = document.querySelector('.stats__account')
        const Trabajo = document.querySelector('#Trabajo')
        const Wallet = document.querySelector('#wallet')
        const BankMoney = document.querySelector('#bank')
        const dirtyMoney = document.querySelector('#dirty__money')
        const coord = document.querySelector('#coord')


        if (event.data.moneyPlayer) {
            Wallet.innerHTML = event.data.moneyPlayer
        }

        if (event.data.BankMoney) {
        }

        var soc = false

        if (event.data.dirtyMoney) {
            if (soc == false) {
                Accountmoney.classList.add('soc')
                dirtyMoney.innerHTML = event.data.dirtyMoney
                soc = true
            }

        } else {
            if (soc == true) {
                Accountmoney.classList.remove('soc')
                soc = false
            }
        }
        

        let accounts = event.data.Accounts

        for (let account of accounts) {
            if (account.name == 'money') {
                Wallet.innerHTML = new Intl.NumberFormat().format(account.money).replace(',', '.')
            }
            if (account.name == 'bank') {
                BankMoney.innerHTML = new Intl.NumberFormat().format(account.money).replace(',', '.')

            }
            if (account.name == 'black_money') {
                dirtyMoney.innerHTML = new Intl.NumberFormat().format(account.money).replace(',', '.')

            }
        }

        Trabajo.innerHTML = event.data.Player.job.label + ' - ' + event.data.Player.job.grade_label


        var dates = {
            idPlayer: event.data.id,
            status: {
                conduccion: event.data.estoyencoche,
                nadando: event.data.EstaEnElAgua,
                hud: event.data.hud,
                dead: event.data.dead
            }
        }

        vidaSlot.style.height = `${event.data.health}%`
        escudoSlot.style.height = `${event.data.armour}%`
        comidaSlot.style.height = `${event.data.food}%`
        aguaSlot.style.height = `${event.data.thirst}%`
        estaminaSlot.style.height = `${event.data.oxigeno}%`
        oxigenoSlot.style.height = `${event.data.oxigenoagua}%`
                
        coord.innerHTML = `X: ${event.data.coordenadas.x}, Y: ${event.data.coordenadas.y}, Z: ${event.data.coordenadas.z}`




        idPlayer.innerHTML = dates.idPlayer




        if (dates.status.conduccion == true || dates.status.conduccion == 1) {
            contenedorSlots.classList.add('conduciendo')

        } else {
            contenedorSlots.classList.remove('conduciendo')
        }

        if (dates.status.nadando == true || dates.status.nadando == 1) {
            contenedorSlots.classList.add('nadando')
        } else {
            contenedorSlots.classList.remove('nadando')

        }





        if (event.data.pauseMenu) {
            contenedorSlots.classList.add('quitar')
            Accountmoney.classList.add('quitar')
        } else {
            contenedorSlots.classList.remove('quitar')
            Accountmoney.classList.remove('quitar')

        }



    })


})
