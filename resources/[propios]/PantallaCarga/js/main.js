"use strict"

const vid = document.getElementById("bg__video");
const btnStopAndPlay = document.querySelector('#btn__playandstop__video')

const iconVolume = document.querySelector('#icon__volume')

const videoInputVolume = document.querySelector('#video__volume')

const iconPlay = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-play"><polygon points="5 3 19 12 5 21 5 3"></polygon></svg>'

const iconPause = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-pause"><rect x="6" y="4" width="4" height="16"></rect><rect x="14" y="4" width="4" height="16"></rect></svg>'

const iconSvgVolumeMin = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-volume"><polygon points="11 5 6 9 2 9 2 15 6 15 11 19 11 5"></polygon></svg>'
const iconSvgVolumeMedium = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-volume-1"><polygon points="11 5 6 9 2 9 2 15 6 15 11 19 11 5"></polygon><path d="M15.54 8.46a5 5 0 0 1 0 7.07"></path></svg>'
const iconSvgVolumeMax = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-volume-2"><polygon points="11 5 6 9 2 9 2 15 6 15 11 19 11 5"></polygon><path d="M19.07 4.93a10 10 0 0 1 0 14.14M15.54 8.46a5 5 0 0 1 0 7.07"></path></svg>'
const iconSvgMute = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-volume-x"><polygon points="11 5 6 9 2 9 2 15 6 15 11 19 11 5"></polygon><line x1="23" y1="9" x2="17" y2="15"></line><line x1="17" y1="9" x2="23" y2="15"></line></svg>'


vid.play()

function checkStatusVideo() {
    if (!vid.paused) {
        btnStopAndPlay.innerHTML = iconPause
    } else {
        btnStopAndPlay.innerHTML = iconPlay
    }
}


checkStatusVideo()

function pauseAndPlay() {
    if (!vid.paused) {
        vid.pause()
    } else {
        vid.play()
    }
}
const volume = 0

function SetVolume(value) {
    vid.volume = value / 100
    if (value == 0) {
        iconVolume.innerHTML = iconSvgMute
    } else if (value < 15) {
        iconVolume.innerHTML = iconSvgVolumeMin
    } else if (value >= 15 && value < 50) {
        iconVolume.innerHTML = iconSvgVolumeMedium
    } else if (value >= 50) {
        iconVolume.innerHTML = iconSvgVolumeMax

    }
}

function ResetInput(value) {
    videoInputVolume.value = value
}

SetVolume(videoInputVolume.value)

btnStopAndPlay.addEventListener('click', (e) => {
    e.preventDefault()
    pauseAndPlay()
    checkStatusVideo()
})

videoInputVolume.addEventListener('change', (e) => {
    e.preventDefault()

    SetVolume(videoInputVolume.value)

})
let valueVolume = 5

function setMute() {
    if (vid.volume !== 0) {
        valueVolume = videoInputVolume.value
        SetVolume(0)
        ResetInput(0)
    } else {
        SetVolume(valueVolume)
        ResetInput(valueVolume)
    }
}



iconVolume.addEventListener('click', (e) => {
    e.preventDefault()
    setMute()

})