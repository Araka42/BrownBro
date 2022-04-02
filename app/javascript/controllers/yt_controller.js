import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["play", "pause"]

  changeIcon(click) {
    console.log(this.playTarget.classList)
    console.log(this.pauseTarget.classList)
    console.log(this.pauseTarget.classList.contains('d-none'))
    if (this.pauseTarget.classList.contains('d-none') == true) {
      this.playTarget.classList.add('d-none')
      this.pauseTarget.classList.remove('d-none')
    } else {
      this.playTarget.classList.remove('d-none')
      this.pauseTarget.classList.add('d-none')
    }
  }
}
