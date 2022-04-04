var tag = document.createElement('script');
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["play", "pause", "soundOn", "soundOff"]


  changeIcon(click) {
    console.log(this.playTarget.classList)
    console.log(this.pauseTarget.classList)
    console.log(this.pauseTarget.classList.contains('d-none'))
    if (this.pauseTarget.classList.contains('d-none') == true) {
      this.playTarget.classList.add('d-none')
      this.pauseTarget.classList.remove('d-none')
      onYouTubeIframeAPIReady() ;{
      player = new YT.Player('iframe-id', {
        videoId: 'video-id',
        events: {
          'onReady': onPlayerReady,
          'onStateChange': onPlayerStateChange
          }
        })
      }
    } else {
      this.playTarget.classList.remove('d-none')
      this.pauseTarget.classList.add('d-none')
      this.playTarget.playVideo()
      };
    }

  changeMute(click) {
    console.log(this.soundOnTarget.classList)
    console.log(this.soundOffTarget.classList)
    console.log(this.soundOnTarget.classList.contains('d-none'))
    if (this.soundOnTarget.classList.contains('d-none') == true) {
      this.soundOnTarget.classList.remove('d-none')
      this.soundOffTarget.classList.add('d-none')
    } else {
      this.soundOnTarget.classList.add('d-none')
      this.soundOffTarget.classList.remove('d-none')
    }
  }
}
