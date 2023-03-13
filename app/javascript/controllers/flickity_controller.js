import { Controller } from "@hotwired/stimulus"
import Flickity from 'flickity'

export default class extends Controller {
  connect() {
    this.carousel = new Flickity(this.element, {
      // options
      cellAlign: 'left',
      contain: true,
      wrapAround: false,
      prevNextButtons: false,
      pageDots: false,
      imagesLoaded: true,
      lazyLoad: true
    })
    window.addEventListener("resize", this.resize.bind(this))
    // Iterate over each slide and set up click event
    this.carousel.on('select', () => {
      this.element.querySelectorAll('.carousel-cell').forEach((slide, index) => {
        slide.onclick = () => {
          window.location.href = slide.dataset.link;
        }
      });
    });
  };
  resize() {
    this.carousel.resize()
  }

  disconnect() {
    window.removeEventListener("resize", this.resize.bind(this));
    this.carousel.destroy();
  }
}
