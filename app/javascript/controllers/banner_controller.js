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
      this.playTarget.pauseVideo()
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
